/*
 * Copyright (C) 2024  Sander Klootwijk
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * radar is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Lomiri.Components 1.3
import Lomiri.Connectivity 1.0
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.XmlListModel 2.0
import "pages"
import "components"

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'radar.sanderklootwijk'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    anchors {
        bottomMargin: LomiriApplication.inputMethod.visible ? LomiriApplication.inputMethod.keyboardRectangle.height/(units.gridUnit / 8) : 0

        Behavior on bottomMargin {
            NumberAnimation {
                duration: 175
                easing.type: Easing.OutQuad
            }
        }
    }

    theme.name: {
        switch (settings.theme) {
            case 0: return "";
            case 1: return "Ubuntu.Components.Themes.Ambiance";
            case 2: return "Ubuntu.Components.Themes.SuruDark";
            default: return "";
        }
    }

    // Application metadeta
    property string version: "2.0.0"

    // Data loading state
    property bool searchLoading: false
    property bool reloading: false

    // API sources
    property string locationsSource
    property string forecastSource: "https://forecast.buienradar.nl/2.0/forecast/?lat=" + settings.currentLatitude + "&lon=" + settings.currentLongitude
    property string observationsSource: "https://observations.buienradar.nl/1.0/actual/weatherstation/" + settings.currentWeatherstationID
    
    // Current weather data
    property string currentTemp: "	"
    property string sunrise
    property string sunset
    property string feeltemperature
    property string groundtemperature
    property string sunpower
    property string airpressure
    property string humidity
    property string windgusts
    property string visibility
    property string weatherSummary: i18n.tr("Loading...")

    // Precipitation data
    property bool precipitationEmpty: true
    readonly property string precipitationSource: root.precipitationFor24Hours
            ? "https://graphdata.buienradar.nl/2.0/forecast/geo/Rain24Hour?lat=" + settings.currentLatitude + "&lon=" + settings.currentLongitude
            : "https://graphdata.buienradar.nl/2.0/forecast/geo/RainHistoryForecast?lat=" + settings.currentLatitude + "&lon=" + settings.currentLongitude
    property bool precipitationFor24Hours: false
    property string radarType: "rain3Hours"

    onRadarTypeChanged: {
        if (radarType == "rain24Hours") {
            precipitationFor24Hours = true
            fetchPrecipitation()
        }
        else {
            precipitationFor24Hours = false
            fetchPrecipitation()
        }
    }

    Component.onCompleted: reloadData()

    Settings {
        id: settings

        property int theme: 0

        property double currentLatitude: 52.11
        property double currentLongitude: 5.18056
        property string currentLocationName: "De Bilt"
        property int currentWeatherstationID: 6260

        onThemeChanged: mainPage.precipitationChart.chartCanvas.requestPaint()
    }

    Connections {
        target: Connectivity
        
        onStatusChanged: {
            if (Connectivity.status == NetworkingStatus.Online) {
                reloadData()
            }
        }
    }

    PageStack {
        id: pageStack

        anchors.fill: parent

        Component.onCompleted: push(mainPage)

        // Pages
        MainPage {
            id: mainPage

            visible: false

            anchors.fill: parent
        }

        SearchPage {
            id: searchPage

            visible: false

            anchors.fill: parent
        }

        SettingsPage {
            id: settingsPage

            visible: false

            anchors.fill: parent
        }

        AboutPage {
            id: aboutPage

            visible: false

            anchors.fill: parent
        }
    }

    // XmlListModel to fetch weather forecast text
    XmlListModel {
        id: weatherModel
        source: "https://data.buienradar.nl/1.0/feed/xml"
        query: "/buienradarnl/weergegevens/verwachting_vandaag"

        XmlRole { name: "summary"; query: "samenvatting/string()" }

        onCountChanged: {
            if (weatherModel.count > 0) {
                root.weatherSummary = weatherModel.get(0).summary;
            }
        }
    }

    // Function to make a XMLHttpRequest
    function makeRequest({url, method = "GET", retries = 3, retryDelay = 1000, onSuccess, onError}) {
        let request = new XMLHttpRequest();
        let retryTimer = Qt.createQmlObject('import QtQuick 2.7; Timer {}', root);

        function sendRequest() {
            request.open(method, url);
            request.onreadystatechange = function () {
                if (request.readyState === XMLHttpRequest.DONE) {
                    if (request.status === 200) {
                        if (onSuccess) onSuccess(request.responseText);
                    } else if (request.status === 429 && retries > 0) {
                        retryTimer.interval = retryDelay;
                        retryTimer.repeat = false;
                        retryTimer.triggered.connect(sendRequest);
                        retryTimer.start();
                        retries--;
                    } else {
                        console.log("HTTP Error:", request.status, request.statusText);
                        if (onError) onError(request.status, request.statusText);
                    }
                }
            };
            request.send();
        }

        sendRequest();
    }

    // Fetch locations after search
    function fetchLocations() {
        root.searchLoading = true;

        makeRequest({
            url: locationsSource,
            retries: 3,
            retryDelay: 1000,
            onSuccess: function (responseText) {
                let list = JSON.parse(responseText);

                searchPage.locationsListModel.clear();

                for (let i in list) {
                    if (list[i].countrycode === "NL") {
                        searchPage.locationsListModel.append({
                            "name": list[i].name,
                            "province": list[i].foad.name,
                            "latitude": Number(list[i].location.lat),
                            "longitude": Number(list[i].location.lon),
                            "weatherstationid": list[i].weatherstationid
                        });
                    }
                }

                root.searchLoading = false;
                
                console.log("Locations fetched successfully");
            },
            onError: function (status, statusText) {
                console.log("Failed to fetch locations:", status, statusText);
                root.searchLoading = false;
            }
        });
    }

    // Fetch weather forecast for current location
    function fetchForecast() {
        makeRequest({
            url: forecastSource,
            onSuccess: function (responseText) {
                let list = JSON.parse(responseText);
                root.sunrise = new Date(list.days[0].sunrise).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
                root.sunset = new Date(list.days[0].sunset).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

                const getDayName = dateString => [i18n.tr("Sun"), i18n.tr("Mon"), i18n.tr("Tue"), i18n.tr("Wed"), i18n.tr("Thu"), i18n.tr("Fri"), i18n.tr("Sat")][new Date(dateString).getDay()];
                const getFullDate = dateString => {
                    const days = [i18n.tr("Sunday"), i18n.tr("Monday"), i18n.tr("Tuesday"), i18n.tr("Wednesday"), i18n.tr("Thursday"), i18n.tr("Friday"), i18n.tr("Saturday")];
                    const months = [i18n.tr("January"), i18n.tr("February"), i18n.tr("March"), i18n.tr("April"), i18n.tr("May"), i18n.tr("June"), i18n.tr("July"), i18n.tr("August"), i18n.tr("September"), i18n.tr("October"), i18n.tr("November"), i18n.tr("December")];                            
                    const date = new Date(dateString);
                    const dayName = days[date.getDay()];
                    const day = date.getDate();
                    const monthName = months[date.getMonth()];

                    return `${dayName} ${day} ${monthName}`;
                };
                
                let formattedDate = dateString => {
                    const [year, month, day] = dateString.split("T")[0].split("-");
                    return `${day}-${month}`;
                };

                const formattedTime = dateString => {
                    const hours = new Date(dateString).getHours();
                    return String(hours).padStart(2, '0') + "u";
                };

                mainPage.forecastListModel.clear();
                for (let i in list.days) {
                    let day = list.days[i];
                    let hours = (day.hours && Array.isArray(day.hours) && i < 6) 
                                ? day.hours.map(hour => ({
                                    time: formattedTime(hour.datetime),
                                    iconcode: hour.iconcode,
                                    temperature: Math.round(hour.temperature),
                                    feeltemperature: Math.round(hour.feeltemperature),
                                    precipitationmm: hour.precipitationmm,
                                    precipitation: hour.precipitation,
                                    winddirection: hour.winddirection,
                                    beaufort: hour.beaufort
                                }))
                                : [];
                    
                    mainPage.forecastListModel.append({
                        "day": getDayName(day.date),
                        "date": formattedDate(day.date),
                        "fulldate": getFullDate(day.date),
                        "iconcode": day.iconcode,
                        "mintemp": Math.round(day.mintemperature),
                        "maxtemp": Math.round(day.maxtemperature),
                        "precipitationmm": day.precipitationmm,
                        "precipitation": day.precipitation,
                        "winddirection": day.winddirection,
                        "beaufort": day.beaufort,
                        "hours": hours
                    });
                }

                mainPage.hoursListView.update();

                console.log("Forecast fetched successfully");
            },
            onError: function (status, statusText) {
                console.log("Failed to fetch forecast:", status, statusText);
            }
        });
    }

    // Fetch oberservations for current location
    function fetchObservations() {
        makeRequest({
            url: observationsSource,
            onSuccess: function (responseText) {
                let list = JSON.parse(responseText);

                root.currentTemp = Math.round(list.temperature).toString() + " °C";
                root.feeltemperature = Math.round(list.feeltemperature).toString() + " °C";
                root.groundtemperature = Math.round(list.groundtemperature).toString() + " °C";
                root.sunpower = list.sunpower + " W/m²";
                root.airpressure = list.airpressure + " hPa";
                root.humidity = list.humidity + "%";
                root.windgusts = Math.round(list.windgusts) + " km/u";
                root.visibility = Math.round((list.visibility / 1000)).toString() + " km";

                console.log("Observations fetched successfully");
            },
            onError: function (status, statusText) {
                console.log("Failed to fetch observations:", status, statusText);
            }
        });
    }
    
    // Fetch precipitation
    function fetchPrecipitation() {
        makeRequest({
            url: precipitationSource,
            onSuccess: function (responseText) {
                var data = JSON.parse(responseText);

                let forecastsLength = root.precipitationFor24Hours ? Math.floor(data.forecasts.length / 2) + 1 : data.forecasts.length;

                var allZero = data.forecasts.slice(0, forecastsLength).every(function(forecast) {
                    return forecast.value === 0;
                });

                root.precipitationEmpty = allZero;

                mainPage.precipitationListModel.clear();

                for (var i = 0; i < forecastsLength; i++) {
                    var forecast = data.forecasts[i];
                    mainPage.precipitationListModel.append({
                        "datetime": forecast.datetime,
                        "value": forecast.value
                    });
                }

                mainPage.precipitationChart.chartCanvas.requestPaint();

                console.log("Precipitation data fetched successfully");
            },
            onError: function (status, statusText) {
                console.log("Failed to fetch precipitation:", status, statusText);
            }
        });
    }

    // Reload all data
    function reloadData() {
        root.reloading = true;
        
        fetchForecast();
        fetchPrecipitation();
        fetchObservations();

        weatherModel.reload();

        mainPage.radarItem.webEngineView.url = "https://gadgets.buienradar.nl/gadget/zoommap/?lat=" + settings.currentLatitude + "&lng=" + settings.currentLongitude + "&overname=2&zoom=13&size=3&voor=1";
        
        Qt.callLater(() => {
            root.reloading = false;
        });
    }
}
