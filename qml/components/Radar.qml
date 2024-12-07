/*
* Copyright (C) 2024  Sander Klootwijk
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 3.
*
* wegwijs is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.7
import Lomiri.Components 1.3
import QtQuick.Layouts 1.3
import QtWebEngine 1.6
import QtGraphicalEffects 1.12

Item {
    id: radarItem

    property alias locationMarker: locationMarker
    property alias webEngineView: webEngineView
    property alias radarOptionSelector: radarOptionSelector
    property alias radar: radar

    clip: true

    Rectangle {
        id: radarPaintedImage

        anchors.fill: parent

        color: "transparent"

        ActivityIndicator {
            id: activity

            anchors.centerIn: parent

            running: radar.status !== AnimatedImage.Ready
        }
    }

    WebEngineView {
        z: 1
        id: webEngineView

        visible: false

        anchors.fill: radarPaintedImage
        
        settings.showScrollBars: false
        
        zoomFactor: 0.01446 * (radarPaintedImage.width / units.gu(1)) + 0.015

        profile: WebEngineProfile {
            id: webContext
            
            persistentCookiesPolicy: WebEngineProfile.NoPersistentCookies
            offTheRecord: true

            userScripts: [
                WebEngineScript {                   
                    injectionPoint: WebEngineScript.DocumentReady
                    sourceUrl: Qt.resolvedUrl('../js/theme.js')
                    worldId: WebEngineScript.UserWorld
                }
            ]
        }

        Image {
            z: 2

            width: radarPaintedImage.width / 28
            height: width

            anchors.centerIn: parent

            source: "../icons/location-marker.svg"
        }
    }

    AnimatedImage {
        id: radar

        anchors.fill: parent

        fillMode: Image.PreserveAspectFit

        source: {
            if (root.reloading) {
                ""
            } else if (root.radarType == "rain3Hours") {
                "https://image.buienradar.nl/2.0/image/animation/RadarMapRainNL?&history=1&forecast=18&skip=1"
            } else if (root.radarType == "rain24Hours") {
                "http://api.buienradar.nl/image/1.0/24hourforecastmapnl/?ext=gif"
            } else if (root.radarType == "drizzle") {
                "http://api.buienradar.nl/image/1.0/drizzlemapnl/?ext=gif"
            } else if (root.radarType == "snow") {
                "http://api.buienradar.nl/image/1.0/snowmapnl/?ext=gif"
            } else if (root.radarType == "lightning") {
                "https://api.buienradar.nl/image/1.0/lightningnl/?ext=gif&type=NL"
            } else if (root.radarType == "satellite") {
                "https://api.buienradar.nl/image/1.0/satvisual/?ext=gif&type=NL"
            }
        }

        onStatusChanged: playing = (status == AnimatedImage.Ready)

        Image {
            id: locationMarker

            width: radarPaintedImage.width / 34
            height: width

            visible: !activity.running && ["rain3Hours", "rain24Hours", "drizzle", "snow", "lightning"].includes(root.radarType)

            source: "../icons/location-marker.svg"

            function updatePosition(latitude, longitude) {
                var lat1 = 54.809388;   // Top-right latitude
                var lon1 = 0.058662;    // Bottom-left longitude
                var lat2 = 49.509635;   // Bottom-left latitude
                var lon2 = 9.959873;    // Top-right longitude

                var xNorm = (longitude - lon1) / (lon2 - lon1);
                var yNorm = (latitude - lat2) / (lat1 - lat2);

                locationMarker.x = xNorm * radarPaintedImage.width - locationMarker.width / 2;
                locationMarker.y = (1 - yNorm) * radarPaintedImage.height - locationMarker.height / 2;
            }

            Component.onCompleted: updatePosition(settings.currentLatitude, settings.currentLongitude);

            Connections {
                target: radarPaintedImage
                onWidthChanged: locationMarker.updatePosition(settings.currentLatitude, settings.currentLongitude)
                onHeightChanged: locationMarker.updatePosition(settings.currentLatitude, settings.currentLongitude)
            }

            Connections {
                target: settings
                onCurrentLatitudeChanged: locationMarker.updatePosition(settings.currentLatitude, settings.currentLongitude)
                onCurrentLongitudeChanged: locationMarker.updatePosition(settings.currentLatitude, settings.currentLongitude)
            }
        }
    }

    OptionSelector {
        z: 2
        id: radarOptionSelector

        width: units.gu(15.5)
        containerHeight: radar.height - units.gu(2)

        anchors {
            left: radar.left
            leftMargin: units.gu(1)
            bottom: radar.bottom
            bottomMargin: units.gu(1)
        }

        visible: !activity.running && !webEngineView.visible

        model: customModel
        
        delegate: OptionSelectorDelegate {
            Icon {
                id: selectorIcon

                width: units.gu(2.25)
                height: units.gu(2.25)

                anchors {
                    left: parent.left
                    leftMargin: units.gu(1)
                    verticalCenter: parent.verticalCenter
                }

                source: image
            }

            ColorOverlay {
                anchors.fill: selectorIcon
                source: selectorIcon
                color: theme.palette.normal.foregroundText
            }

            Label {
                anchors {
                    left: selectorIcon.right
                    leftMargin: units.gu(1)
                    verticalCenter: parent.verticalCenter
                }

                text: name
            }
        }

        onCurrentlyExpandedChanged: collapseButtons();

        onSelectedIndexChanged: {
            switch(selectedIndex) {
                case 0: root.radarType = "rain3Hours"; break;
                case 1: root.radarType = "drizzle"; break;
                case 2: root.radarType = "snow"; break;
                case 3: root.radarType = "lightning"; break;
                case 4: root.radarType = "satellite"; break;
            }
        }
    }

    ListModel {
        id: customModel

        Component.onCompleted: {
            customModel.append({ name: i18n.tr("Rain"), image: "../icons/l.png" })
            customModel.append({ name: i18n.tr("Drizzle"), image: "../icons/m.png" })
            customModel.append({ name: i18n.tr("Snow"), image: "../icons/t.png" })
            customModel.append({ name: i18n.tr("Lightning"), image: "../icons/s.png" })
            customModel.append({ name: i18n.tr("Satellite"), image: "../icons/satellite.png" })
        }
    }

    Button {
        z: 2
        id: zoomButton
        
        width: units.gu(5)
        height: units.gu(5)

        anchors {
            right: radar.right
            rightMargin: units.gu(1)
            top: radar.top
            topMargin: units.gu(1)
        }

        visible: !activity.running && root.radarType === "rain3Hours"
        color: "white"

        Icon {
            width: units.gu(2)
            height: units.gu(2)
            anchors.centerIn: parent
            name: webEngineView.visible ? "zoom-out" : "zoom-in"
            color: "black"
        }

        onClicked: {
            collapseButtons()
            radarOptionSelector.currentlyExpanded = false
            webEngineView.visible = !webEngineView.visible
        }
    }

    Row {
        z: 2
        id: radarRow

        height: units.gu(5)
        width: units.gu(5)

        anchors {
            right: radar.right
            rightMargin: units.gu(1)
            bottom: radar.bottom
            bottomMargin: units.gu(1)
        }

        visible: !activity.running && ["rain3Hours", "rain24Hours"].includes(root.radarType) && !webEngineView.visible

        spacing: units.gu(1)

        Button {
            id: plus3Button

            width: units.gu(5)
            height: units.gu(5)
            
            visible: false
            
            color: theme.palette.normal.background
            text: "+3"
            
            onClicked: {
                collapseButtons();
                radarOptionSelector.currentlyExpanded = false
                root.radarType = "rain3Hours";
            }
        }

        Button {
            id: plus24Button
            
            width: units.gu(5)
            height: units.gu(5)
            
            visible: false
            
            color: theme.palette.normal.background
            text: "+24"
            
            onClicked: {
                collapseButtons();
                radarOptionSelector.currentlyExpanded = false
                root.radarType = "rain24Hours";
            }
        }

        Button {
            id: expandButton
            
            width: units.gu(5)
            height: units.gu(5)
            
            color: theme.palette.normal.activity
            text: root.precipitationFor24Hours ? "+24" : "+3"
            
            onClicked: {
                radarOptionSelector.currentlyExpanded = false;
                radarRow.width = units.gu(17);
                expandButton.visible = false;
                collapseButton.visible = true;
                plus3Button.visible = true;
                plus24Button.visible = true;
            }
        }

        Button {
            id: collapseButton
            
            width: units.gu(5)
            height: units.gu(5)
            
            visible: false
            
            color: theme.palette.normal.activity
            
            Icon {
                width: units.gu(2)
                height: units.gu(2)
                anchors.centerIn: parent
                name: "next"
                color: theme.palette.normal.negativeText
            }

            onClicked: {
                collapseButtons();
                radarOptionSelector.currentlyExpanded = false
            }
        }
    }

    MouseArea {
        z: 1
        anchors.fill: parent
        onClicked: {
            collapseButtons()
            radarOptionSelector.currentlyExpanded = false
        }
    }

    function collapseButtons() {
        radarRow.width = units.gu(5);
        expandButton.visible = true;
        collapseButton.visible = false;
        plus3Button.visible = false;
        plus24Button.visible = false;
    }
}
