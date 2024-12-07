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

ListItem {
    id: dayItem
    
    width: parent.width
    height: units.gu(6.5)

    property bool expanded: forecastListView.expandedIndex == index

    expansion.height: units.gu(6.5) + hoursColumn.height
    expansion.expanded: forecastListView.expandedIndex == index

    highlightColor: "transparent"

    onClicked: {
        if (hours.count > 0) {
            if (forecastListView.expandedIndex == index) {
                forecastListView.expandedIndex = -1
            }
            else {
                forecastListView.expandedIndex = index
                expandConnector.enabled = true
            }
        }
    }

    Connections {
        id: expandConnector

        target: dayItem
        enabled: false

        onHeightChanged: {
            if (dayItem.height === expansion.height) {
                let itemTop = dayItem.y
                let itemBottom = dayItem.y + dayItem.height
                let flickableTop = comingdaysFlickable.contentY
                let flickableBottom = comingdaysFlickable.contentY + comingdaysFlickable.height

                if (itemTop < flickableTop) {
                    comingdaysFlickable.contentY = itemTop
                }

                else if (itemBottom > flickableBottom) {
                    comingdaysFlickable.contentY = itemBottom - comingdaysFlickable.height
                }

                enabled = false
            }
        }
    }

    Row {
        id: dayRow

        anchors {
            top: parent.top
            left: parent.left
            leftMargin: units.gu(2)
        }

        width: parent.width
        height: units.gu(6.5)

        spacing: (parent.width - units.gu(4) - dayDateItem.width - weatherIcon.width - temperatureLabel.width - precipitationLabel.width - windLabel.width - expandIcon.width) / 5

        Item {
            id: dayDateItem

            width: units.gu(4.25)
            height: parent.height - units.gu(2)

            anchors.verticalCenter: parent.verticalCenter

            Label {
                id: dayLabel
                                
                anchors {
                    left: parent.left
                    top: parent.top
                }
                
                text: dayItem.expanded ? fulldate : day

                font.bold: true
            }

            Label {
                id: dateLabel
                                
                anchors {
                    left: parent.left
                    bottom: parent.bottom
                }
                
                text: dayItem.expanded ? "" : date
            }
        }

        Icon {
            id: weatherIcon

            opacity: dayItem.expanded ? 0 : 1

            height: units.gu(3)
            width: units.gu(3)

            anchors.verticalCenter: parent.verticalCenter
            
            source: "../icons/" + iconcode + ".png"
        }

        Label {
            id: temperatureLabel

            opacity: dayItem.expanded ? 0 : 1

            width: units.gu(5.75)
                    
            anchors.verticalCenter: parent.verticalCenter
            
            text: mintemp + "°/" + maxtemp + "°"

            horizontalAlignment: Text.AlignHCenter
        }

        Label {
            id: precipitationLabel

            opacity: dayItem.expanded ? 0 : 1

            width: units.gu(12.75)
                    
            anchors.verticalCenter: parent.verticalCenter
            
            text: precipitationmm + " mm/" + precipitation + "%"

            horizontalAlignment: Text.AlignHCenter
        }

        Label {
            id: windLabel

            opacity: dayItem.expanded ? 0 : 1

            width: units.gu(3.25)
                    
            anchors.verticalCenter: parent.verticalCenter
            
            text: winddirection + beaufort

            horizontalAlignment: Text.AlignHCenter
        }

        Icon {
            id: expandIcon

            opacity: hours.count > 0 ? 1 : 0

            width: units.gu(1.5)
            height: units.gu(1.5)

            anchors.verticalCenter: parent.verticalCenter
            
            name: dayItem.expanded ? "go-up" : "go-down"

            color: theme.palette.normal.foregroundText
        }
    }

    Row {
        id: hoursLabels

        opacity: dayItem.expanded ? 1 : 0

        width: parent.width - units.gu(2)
        height: units.gu(3.25)
        
        anchors {
            left: parent.left
            leftMargin: units.gu(2)
            bottom: dayRow.bottom
        }

        spacing: dayRow.spacing

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

        Item {
            width: units.gu(1.5)
            height: units.gu(1.5)

            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        z: -1

        anchors {
            fill: dayRow
            leftMargin: -units.gu(2)
        }

        color: {
            if (dayItem.highlighted) {
                theme.palette.highlighted.base
            }
            else if (dayItem.expanded) {
                theme.palette.focused.base
            }
            else {
                "transparent"
            }
        }
    }

    Rectangle {
        width: parent.width
        height: units.dp(1)

        anchors {
            bottom: dayRow.bottom
            horizontalCenter: parent.horizontalCenter
        }

        color: theme.palette.normal.base
    }

    Column {
        id: hoursColumn

        width: parent.width

        anchors.top: dayRow.bottom

        Repeater {
            id: repeater

            model: hours

            delegate: Item {
                width: parent.width
                height: units.gu(5)

                MouseArea {
                    z: 1
                    
                    anchors.fill: parent
                }

                Row {
                    id: hourRow

                    anchors {
                        fill: parent
                        leftMargin: units.gu(2)
                        rightMargin: units.gu(2)
                    }
                    
                    spacing: dayRow.spacing

                    Label {
                        id: hourLabel

                        width: units.gu(3)
        
                        anchors.verticalCenter: parent.verticalCenter
                        
                        text: time

                        horizontalAlignment: Text.AlignRight
                    }

                    Icon {
                        id: hourWeatherIcon

                        width: units.gu(3)
                        height: units.gu(3)

                        anchors.verticalCenter: parent.verticalCenter
                        
                        source: "../icons/" + iconcode + ".png"
                    }

                    Item {
                        id: hourTemperatureLabels

                        width: units.gu(8)
                        height: parent.height

                        Label {    
                            width: units.gu(3)

                            anchors {
                                left: parent.left
                                verticalCenter: parent.verticalCenter
                            }
                            
                            text: temperature + "°"

                            horizontalAlignment: Text.AlignHCenter
                        }

                        Label {     
                            width: units.gu(3)

                            anchors {
                                right: parent.right
                                verticalCenter: parent.verticalCenter
                            }
                            
                            text: feeltemperature + "°"

                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    Label {
                        id: hourPrecipitationLabel

                        width: units.gu(12.75)
                                
                        anchors.verticalCenter: parent.verticalCenter
                        
                        text: precipitationmm + " mm/" + precipitation + "%"

                        horizontalAlignment: Text.AlignHCenter
                    }

                    Label {
                        id: hourWindLabel

                        width: units.gu(3.25)
                                
                        anchors.verticalCenter: parent.verticalCenter
                        
                        text: winddirection + beaufort

                        horizontalAlignment: Text.AlignHCenter
                    }

                    Item {
                        id: hourFillIcon

                        width: units.gu(1.5)
                        height: units.gu(1.5)

                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
    }
}