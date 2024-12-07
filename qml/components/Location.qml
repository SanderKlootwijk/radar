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
    id: locationItem
    
    width: parent.width
    height: units.gu(6.5)

    Icon {
        id: locationIcon

        height: units.gu(2.5)
        width: units.gu(2.5)

        name: 'location'
        color: theme.palette.normal.foregroundText
        
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: units.gu(2)
        }
    }

    Label {
        id: locationName
        
        width: parent.width - locationIcon.width - units.gu(6)
        
        anchors {
            left: locationIcon.right
            leftMargin: units.gu(2)
            top: parent.top
            topMargin: units.gu(1.25)
        }
        
        text: name

        elide: Text.ElideRight
        maximumLineCount: 1
    }
    
    Label {
        id: provinceName
        
        width: parent.width - locationIcon.width - units.gu(6)
        
        anchors {
            left: locationIcon.right
            leftMargin: units.gu(2)
            top: locationName.bottom
        }
        
        text: province

        textSize: Label.Small
        color: theme.palette.normal.backgroundSecondaryText

        elide: Text.ElideRight
        maximumLineCount: 1
    }

    onClicked: {
        settings.currentLatitude = latitude
        settings.currentLongitude = longitude
        settings.currentLocationName = name
        settings.currentWeatherstationID = weatherstationid

        reloadData()

        mainPage.todayFlickable.contentY = 0
        mainPage.forecastListView.expandedIndex = -1
        mainPage.comingdaysFlickable.contentY = 0

        mainPage.radarItem.collapseButtons()
        mainPage.radarItem.radarOptionSelector.currentlyExpanded = false
        mainPage.radarItem.webEngineView.visible = false


        pageStack.pop()

        searchField.text = null
        searchField.searchExecuted = false
        
        locationsListModel.clear()
    }
}