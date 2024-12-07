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
import QtQuick.Layouts 1.3
import "../components"

Page {
    id: mainPage

    property alias todayFlickable: todayFlickable
    property alias comingdaysFlickable: comingdaysFlickable
    property alias forecastListView: forecastListView

    property alias radarItem: radarItem
    property alias precipitationChart: precipitationChart
    property alias precipitationListModel: precipitationListModel
    property alias forecastListModel: forecastListModel
    property alias hoursListView: hoursListView

    header: PageHeader {
        id: mainPageHeader

        title: settings.currentLocationName
        subtitle: root.currentTemp

        trailingActionBar {
            numberOfSlots: 2

            actions: [
                Action {
                    text: i18n.tr("Location")
                    iconName: "location"
                    onTriggered: {
                        pageStack.push(searchPage)
                    }
                },
                Action {
                    text: i18n.tr("Settings")
                    iconName: "settings"
                    onTriggered: pageStack.push(settingsPage)
                },
                Action {
                    text: i18n.tr("About")
                    iconName: "info"
                    onTriggered: pageStack.push(aboutPage)
                }
            ]
        }

        extension: Sections {
            id: mainPageHeaderSections

            actions: [
                Action {
                    text: i18n.tr("Today")
                },
                Action {
                    text: i18n.tr("Coming days")
                }
            ]

            onSelectedIndexChanged: {
                mainPageTabView.currentIndex = selectedIndex
                radarItem.collapseButtons()
                radarItem.radarOptionSelector.currentlyExpanded = false
                forecastListView.expandedIndex = -1
                comingdaysFlickable.contentY = 0
            }
        }
    }

    ListModel {
        id: precipitationListModel
    }

    ListModel {
        id: forecastListModel
    }

    VisualItemModel {
        id: mainPageTabs

        Item {
            id: todayTab

            width: mainPageTabView.width
            height: mainPageTabView.height

            Scrollbar {
                z: 1

                id: todayScrollbar

                flickableItem: todayFlickable
                align: Qt.AlignTrailing
            }

            Flickable {
                id: todayFlickable

                anchors.fill: parent

                contentWidth: todayColumn.width
                contentHeight: todayColumn.height

            
                Column {
                    id: todayColumn

                    width: mainPage.width

                    spacing: units.gu(1)

                    Radar {
                        id: radarItem

                        width: parent.width
                        height: width / 1.07421875
                    }

                    PrecipitationChart {
                        id: precipitationChart

                        width: parent.width
                    }

                    Label {
                        width: parent.width - units.gu(4)

                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        text: i18n.tr("Weather forecast Netherlands")

                        elide: Text.ElideRight
                        font.bold: true
                    }

                    Label {
                        width: parent.width - units.gu(4)

                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        text: root.weatherSummary

                        wrapMode: Text.WordWrap

                        elide: Text.ElideRight
                    }

                    Label {
                        width: parent.width - units.gu(4)

                        visible: root.weatherSummary.length > 20

                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        text: i18n.tr("Read the entire forecast") + " >"

                        elide: Text.ElideRight

                        color: theme.palette.normal.activity
                        
                        MouseArea {
                            anchors.fill: parent

                            onClicked: Qt.openUrlExternally("https://www.buienradar.nl/nederland/weerbericht/weerbericht")
                        }
                    }

                    Item {
                        width: parent.width
                        height: units.gu(2)
                    }

                    Label {
                        width: parent.width - units.gu(4)

                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        text: i18n.tr("Coming hours in") + " " + settings.currentLocationName

                        elide: Text.ElideRight
                        font.bold: true
                    }

                    Label {
                        width: parent.width - units.gu(4)

                        visible: hoursModel.count == 0

                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        text: i18n.tr("Loading...")

                        wrapMode: Text.WordWrap

                        elide: Text.ElideRight
                    }

                    Row {
                        width: parent.width - units.gu(2)
                        height: units.gu(3.25)

                        visible: hoursModel.count > 0
                        
                        anchors {
                            left: parent.left
                            leftMargin: units.gu(2)
                            bottom: dayRow.bottom
                        }

                        spacing: (parent.width - units.gu(3) - units.gu(31.5)) / 4

                        Item {
                            width: units.gu(3)
                            height: units.gu(3)

                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Item {            
                            width: units.gu(3)
                            height: units.gu(3)

                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Label {            
                            width: units.gu(8)

                            anchors.verticalCenter: parent.verticalCenter
                            
                            text: i18n.tr("Temp.") + "  " + i18n.tr("Feel.")

                            font.italic: true
                            horizontalAlignment: Text.AlignHCenter
                        }

                        Label {
                            width: units.gu(12.75)
                                    
                            anchors.verticalCenter: parent.verticalCenter
                            
                            text: i18n.tr("Precipitation")

                            font.italic: true
                            horizontalAlignment: Text.AlignHCenter
                        }

                        Label {
                            width: units.gu(3.25)
                                    
                            anchors.verticalCenter: parent.verticalCenter
                            
                            text: i18n.tr("Wind")

                            font.italic: true
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    Repeater {
                        id: hoursListView

                        width: parent.width

                        model: ListModel {
                            id: hoursModel
                        }

                        delegate: HourItem {
                        }

                        function update() {
                            let hours = [];

                            if (forecastListModel.count > 0) {
                                let firstHours = forecastListModel.get(0).hours;
                                let firstCount = Math.min(firstHours.count, 5);
                                for (let i = 0; i < firstCount; i++) {
                                    hours.push(firstHours.get(i));
                                }
                            }

                            if (hours.length < 5 && forecastListModel.count > 1) {
                                let secondHours = forecastListModel.get(1).hours;
                                let remainingCount = Math.min(secondHours.count, 5 - hours.length);
                                for (let i = 0; i < remainingCount; i++) {
                                    hours.push(secondHours.get(i));
                                }
                            }

                            hoursModel.clear();
                            for (let i = 0; i < hours.length; i++) {
                                hoursModel.append(hours[i]);
                            }
                        }
                    }

                    Label {
                        width: parent.width - units.gu(4)

                        visible: hoursModel.count > 0

                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        text: i18n.tr("Show full overview") + " >"

                        elide: Text.ElideRight

                        color: theme.palette.normal.activity
                        
                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                mainPageTabView.currentIndex = 1
                                forecastListView.expandedIndex = 0
                                comingdaysFlickable.contentY = 0
                            }
                        }
                    }

                    Item {
                        width: parent.width
                        height: units.gu(2)
                    }

                    Label {
                        width: parent.width - units.gu(4)

                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        text: i18n.tr("Today in") + " " + settings.currentLocationName

                        elide: Text.ElideRight
                        font.bold: true
                    }

                    Row {
                        id: sunRow

                        width: parent.width - units.gu(4)
                        height: units.gu(3)

                        anchors.horizontalCenter: parent.horizontalCenter

                        spacing: units.gu(1)

                        Icon {
                            id: sunriseIcon

                            height: units.gu(3)
                            width: units.gu(3)

                            source: "../icons/sunrise.png"
                            
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Label {
                            id: sunriseLabel

                            width: units.gu(4.25)

                            anchors.verticalCenter: parent.verticalCenter
                            
                            text: root.sunrise
                        }

                        Item {
                            height: units.gu(3)
                            width: observationsLabel.paintedWidth - sunriseIcon.width - sunriseLabel.paintedWidth
                        }

                        Icon {
                            id: sunsetIcon

                            width: units.gu(3)
                            height: units.gu(3)

                            source: "../icons/sunset.png"
                            
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Label {
                            id: sunsetLabel

                            width: units.gu(4.25)

                            anchors.verticalCenter: parent.verticalCenter
                            
                            text: root.sunset
                        }
                    }

                    Rectangle {
                        width: parent.width - units.gu(4)
                        height: units.dp(1)

                        anchors.horizontalCenter: parent.horizontalCenter

                        color: theme.palette.normal.base
                    }

                    Row {
                        id: observationsRow

                        width: parent.width - units.gu(4)
                        height: observationsLabel.paintedHeight

                        anchors.horizontalCenter: parent.horizontalCenter

                        spacing: units.gu(3)

                        Label {
                            id: observationsLabel
                            
                            text: i18n.tr("Feel temperature") + "\n" + i18n.tr("Ground temperature") + "\n" + i18n.tr("Sun power") + "\n" + i18n.tr("Air pressure") + "\n" + i18n.tr("Humidity") + "\n" + i18n.tr("Wind gusts") + "\n" + i18n.tr("Visibility")

                            elide: Text.ElideRight
                        }

                        Label {
                            width: parent.width - observationsLabel.width - units.gu(1)
                            
                            text: root.feeltemperature + "\n" + root.groundtemperature + "\n" + root.sunpower + "\n" + root.airpressure + "\n" + root.humidity + "\n" + root.windgusts + "\n" + root.visibility

                            elide: Text.ElideRight
                            font.bold: true

                            color: theme.palette.normal.backgroundSecondaryText
                        }
                    }

                    Item {
                        width: parent.width
                        height: units.gu(1)
                    }
                }
            }
        }

        Item {
            id: comingdaysTab

            width: mainPageTabView.width
            height: mainPageTabView.height

            Scrollbar {
                z: 1

                flickableItem: comingdaysFlickable
                align: Qt.AlignTrailing
            }

            Flickable {
                id: comingdaysFlickable

                anchors.fill: parent
                
                contentHeight: comingdaysColumn.height

                Column {
                    id: comingdaysColumn
                    
                    width: parent.width

                    Repeater {
                        id: forecastListView

                        width: parent.width

                        property int expandedIndex: -1

                        model: forecastListModel

                        delegate: DayItem {}
                    }
                }
            }
        }
    }

    ListView {
        id: mainPageTabView

        anchors {
            fill: parent
            topMargin: mainPageHeader.height
        }

        model: mainPageTabs

        currentIndex: 0

        orientation: Qt.Horizontal

        snapMode: ListView.SnapOneItem

        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveDuration: LomiriAnimation.FastDuration

        onCurrentIndexChanged: mainPageHeaderSections.selectedIndex = currentIndex

        clip: true
    }
}