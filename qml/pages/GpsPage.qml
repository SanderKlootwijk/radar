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
import Lomiri.Components.Popups 1.3
import QtQuick.Layouts 1.3
import QtPositioning 5.2
import QtSystemInfo 5.5
import "../components"

Page {
    id: gpsPage

    property alias positionSource: positionSource
    property alias gpsLabelTimer: gpsLabelTimer
    property alias locationDialogComponent: locationDialogComponent

    header: PageHeader {
        id: gpsPageHeader

        title: i18n.tr("Current location")

        leadingActionBar.actions: [
            Action {
                iconName: "back"
                onTriggered: {
                    positionSource.active = false
                    gpsLabelTimer.stop()
                    gpsLabel.text = i18n.tr("Waiting for GPS signal...")
                    pageStack.pop()
                }
            }
        ]
    }

    ScreenSaver {
        id: screenSaver

        screenSaverEnabled: {
            if (Qt.application.state == Qt.ApplicationActive) {
                !positionSource.active
            } else {
                true
            }
        }
    }

    PositionSource {
        id: positionSource
        
        property var coordinate: position.coordinate

        active: false
        preferredPositioningMethods: PositionSource.SatellitePositioningMethods
        updateInterval: 1000

        onCoordinateChanged: {
            if (active == true) {
                positionSource.active = false

                gpsLabelTimer.stop()
                gpsLabel.text = i18n.tr("Waiting for GPS signal...")

                fetchLocationByLatLon(position.coordinate.latitude,position.coordinate.longitude) 
            }
        }
    }

    ActivityIndicator {
        id: loadingIndicator
        running: positionSource.active

        anchors {
            centerIn: parent
        }
    }

    Label {
        id: gpsLabel
        
        width: parent.width - units.gu(8)

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: loadingIndicator.bottom
            topMargin: units.gu(2)
        }

        text: i18n.tr("Waiting for GPS signal...")

        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
    }

    Timer {
        id: gpsLabelTimer

        interval: 15000
        repeat: false
        running: false

        onTriggered: {
            gpsLabel.text = i18n.tr("This could take a while...")
        }
    }

    Component {
        id: locationDialogComponent

        Dialog {
            id: locationDialog

            title: i18n.tr("Location not supported")
            text: i18n.tr("This app only supports locations within the Netherlands. Please try again or use the search function to look up a location.")

            Button {
                text: i18n.tr("Close")

                onClicked: {
                    positionSource.active = false
                    gpsLabelTimer.stop()
                    gpsLabel.text = i18n.tr("Waiting for GPS signal...")
                    PopupUtils.close(locationDialog);
                    pageStack.pop()
                }
            }
        }
    }
}