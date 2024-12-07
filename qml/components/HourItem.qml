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

Item {
    width: parent.width
    height: units.gu(4)

    Row {
        id: hourRow

        anchors {
            fill: parent
            leftMargin: units.gu(2)
        }
        
        spacing: (parent.width - units.gu(3) - units.gu(31.5)) / 4

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
    }
}