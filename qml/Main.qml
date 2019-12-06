import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.XmlListModel 2.0
import QtGraphicalEffects 1.0
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.0
import Qt.labs.settings 1.0

MainView {
  id: root
  objectName: 'mainView'
  applicationName: 'radar.sanderklootwijk'
  automaticOrientation: true

  width: units.gu(75)
  height: units.gu(85)

  Image {
    id: testImg
    anchors.right: parent.left
    source: "https://www.buienradar.nl/resources/images/logor.svg"
    onStatusChanged: if (testImg.status == Image.Ready) console.log('TestImg is loaded!')
  }

  Timer {
    id: delaytimer
    interval: 1000
    running: false
    repeat: false
    onTriggered: {
      if (loaded.text == 'Not loaded'){
        PopupUtils.open(noConnectionDialog)
        console.log('Oops! No internet connection.')
      }
      else{
        console.log('Yes! Working internet connection.')
      }
    }
  }

  Text {
    id: loaded
    visible: false
    text: testImg.status == Image.Ready ? 'Loaded' : 'Not loaded'
    Component.onCompleted: {
      delaytimer.start()
    }
  }

  Component.onCompleted: {
    if (settings.firstRun == "true"){
      Theme.name = "Ubuntu.Components.Themes." + settings.theme
      welcomeWizard.visible = true
      mainPage.visible = false
    }
    else {
      Theme.name = "Ubuntu.Components.Themes." + settings.theme
    }
  }

  Settings {
    id: settings
    property string weerstation: "5"
    property string theme: "SuruDark"
    property string firstRun: "true"
  }

  XmlListModel {
    id: xmlModel
    source: "http://xml.buienradar.nl/"
    query: "/buienradarnl/weergegevens"

    XmlRole { name: "titel"; query: "verwachting_vandaag/samenvatting/string()" }
    XmlRole { name: "tekst"; query: "verwachting_vandaag/tekst/string()" }
    XmlRole { name: "datum"; query: 'actueel_weer/buienindex/datum/string()' }
    XmlRole { name: "dagen"; query: 'verwachting_meerdaags/tekst_middellang/string()' }
    XmlRole { name: "temp"; query: 'actueel_weer/weerstations/weerstation[' + settings.weerstation + ']/temperatuurGC/string()' }
    XmlRole { name: "icoonactueel"; query: 'actueel_weer/weerstations/weerstation[' + settings.weerstation + ']/icoonactueel/string()' }
    XmlRole { name: "luchtvochtigheid"; query: 'actueel_weer/weerstations/weerstation[' + settings.weerstation + ']/luchtvochtigheid/string()' }
    XmlRole { name: "wind"; query: 'actueel_weer/weerstations/weerstation[' + settings.weerstation + ']/windrichting/string()' }
    XmlRole { name: "windms"; query: 'actueel_weer/weerstations/weerstation[' + settings.weerstation + ']/windsnelheidMS/string()' }
    XmlRole { name: "stationnaam"; query: 'actueel_weer/weerstations/weerstation[' + settings.weerstation + ']/stationnaam/string()' }
    XmlRole { name: "weerbericht"; query: 'verwachting_meerdaags/tekst_lang/string()' }
    XmlRole { name: "morgen"; query: 'verwachting_meerdaags/dag-plus1/dagweek/string()' }
    XmlRole { name: "morgenicoon"; query: 'verwachting_meerdaags/dag-plus1/icoon/string()' }
    XmlRole { name: "tempmorgenmin"; query: 'verwachting_meerdaags/dag-plus1/mintemp/string()' }
    XmlRole { name: "tempmorgenmax"; query: 'verwachting_meerdaags/dag-plus1/maxtemp/string()' }
    XmlRole { name: "kansregenmorgen"; query: 'verwachting_meerdaags/dag-plus1/kansregen/string()' }
    XmlRole { name: "overmorgen"; query: 'verwachting_meerdaags/dag-plus2/dagweek/string()' }
    XmlRole { name: "overmorgenicoon"; query: 'verwachting_meerdaags/dag-plus2/icoon/string()' }
    XmlRole { name: "tempovermorgenmin"; query: 'verwachting_meerdaags/dag-plus2/mintemp/string()' }
    XmlRole { name: "tempovermorgenmax"; query: 'verwachting_meerdaags/dag-plus2/maxtemp/string()' }
    XmlRole { name: "kansregenovermorgen"; query: 'verwachting_meerdaags/dag-plus2/kansregen/string()' }
    XmlRole { name: "overovermorgen"; query: 'verwachting_meerdaags/dag-plus3/dagweek/string()' }
    XmlRole { name: "overovermorgenicoon"; query: 'verwachting_meerdaags/dag-plus3/icoon/string()' }
    XmlRole { name: "tempoverovermorgenmin"; query: 'verwachting_meerdaags/dag-plus3/mintemp/string()' }
    XmlRole { name: "tempoverovermorgenmax"; query: 'verwachting_meerdaags/dag-plus3/maxtemp/string()' }
    XmlRole { name: "kansregenoverovermorgen"; query: 'verwachting_meerdaags/dag-plus3/kansregen/string()' }
    XmlRole { name: "overoverovermorgen"; query: 'verwachting_meerdaags/dag-plus4/dagweek/string()' }
    XmlRole { name: "overoverovermorgenicoon"; query: 'verwachting_meerdaags/dag-plus4/icoon/string()' }
    XmlRole { name: "tempoveroverovermorgenmin"; query: 'verwachting_meerdaags/dag-plus4/mintemp/string()' }
    XmlRole { name: "tempoveroverovermorgenmax"; query: 'verwachting_meerdaags/dag-plus4/maxtemp/string()' }
    XmlRole { name: "kansregenoveroverovermorgen"; query: 'verwachting_meerdaags/dag-plus4/kansregen/string()' }
    XmlRole { name: "overoveroverovermorgen"; query: 'verwachting_meerdaags/dag-plus5/dagweek/string()' }
    XmlRole { name: "overoveroverovermorgenicoon"; query: 'verwachting_meerdaags/dag-plus5/icoon/string()' }
    XmlRole { name: "tempoveroveroverovermorgenmin"; query: 'verwachting_meerdaags/dag-plus5/mintemp/string()' }
    XmlRole { name: "tempoveroveroverovermorgenmax"; query: 'verwachting_meerdaags/dag-plus5/maxtemp/string()' }
    XmlRole { name: "kansregenoveroveroverovermorgen"; query: 'verwachting_meerdaags/dag-plus5/kansregen/string()' }
  }

  WelcomeWizard {
    id: welcomeWizard
  }

  SettingsPage {
    id: settingsPage
  }

  Rectangle {
    z: 10
    id: panel
    width: units.gu(10)
    height: parent.height

    color: theme.palette.normal.background

    visible: {
      if (root.width > units.gu(60)) {
        if (settings.firstRun == "true") {
          false
        }
        else if (settingsPage.visible == true) {
          false
        }
        else {
          true
        }
      }
      else {
        false
      }
    }

    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
    }

    Rectangle {
      width: units.gu(0.1)
      height: parent.height - header.height + units.gu(0.1)

      anchors {
        right: parent.right
        bottom: parent.bottom
      }

      color: {
        if (Theme.name == "Ubuntu.Components.Themes.SuruDark") {
          "#5d5d5d"
        }
        else {
          "#cdcdcd"
        }
      }
    }

    Column {
      id: iconColumn
      spacing: {
        if (parent.height < units.gu(60)) {
          parent.height / 15
        }
        else {
          parent.height / 9
        }
      }

      anchors {
        fill: parent
        topMargin: header.height
      }

      Rectangle {
        color: theme.palette.normal.background
        width: parent.width - units.gu(0.1)
        height: 0.0000000000000001
      }

      Rectangle {
        color: theme.palette.normal.background
        width: parent.width - units.gu(0.1)
        height: width / 1.6

        Icon {
          width: parent.width - units.gu(6.5)
          height: width

          anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
          }

          name: "calendar-today"

          color: theme.palette.normal.baseText
        }

        Label {
          anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
          }

          text: i18n.tr("Vandaag")
        }

        MouseArea {
          anchors.fill: parent
          onClicked: {
            sections.selectedIndex = 0
          }
        }
      }

      Rectangle {
        color: theme.palette.normal.background
        width: parent.width - units.gu(0.1)
        height: width / 1.2

        Icon {
          width: parent.width - units.gu(6.5)
          height: width

          anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
          }

          name: "calendar"

          color: theme.palette.normal.baseText
        }

        Label {
          anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
          }

          text: i18n.tr("Komende\ndagen")

          horizontalAlignment: Text.AlignHCenter
        }

        MouseArea {
          anchors.fill: parent
          onClicked: {
            sections.selectedIndex = 1
          }
        }
      }

      Rectangle {
        color: theme.palette.normal.background
        width: parent.width - units.gu(0.1)
        height: width / 1.6

        Icon {
          width: parent.width - units.gu(6.5)
          height: width

          anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
          }

          source: "img/radars.svg"

          color: theme.palette.normal.baseText
        }

        Label {
          anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
          }

          text: i18n.tr("Radars")
        }

        MouseArea {
          anchors.fill: parent
          onClicked: {
            sections.selectedIndex = 2
          }
        }
      }

      Rectangle {
        color: theme.palette.normal.background
        width: parent.width - units.gu(0.1)
        height: width / 1.6

        Icon {
          width: parent.width - units.gu(6.5)
          height: width

          anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
          }

          name: "stock_website"

          color: theme.palette.normal.baseText
        }

        Label {
          anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
          }

          text: i18n.tr("Kaarten")
        }

        MouseArea {
          anchors.fill: parent
          onClicked: {
            sections.selectedIndex = 3
          }
        }
      }

    }
  }

  Page {
    id: mainPage

    anchors {
      verticalCenter: parent.verticalCenter
      right: parent.right
    }

    header: PageHeader {
      id: header

      width: parent.width
      height: {
        if (root.width > units.gu(60)) {
          units.gu(6)
        }
        else {
          units.gu(10)
        }
      }

      ListView {
        id: title
        model: xmlModel
        width: parent.width
        height: {
          if (root.width > units.gu(60)) {
            header.height - units.gu(4)
          }
          else {
            header.height - sections.height - units.gu(4)
          }
        }
        anchors {
          top: parent.top
          topMargin: units.gu(2)
        }
        delegate: Label {
          id: headerText
          anchors {
            left: parent.left
            leftMargin: {
              if (root.width > units.gu(60)) {
                units.gu(12)
              }
              else {
                units.gu(2)
              }
            }
          }
          font.pixelSize: title.height
          text: stationnaam + " - " + temp + " °C"
        }
      }

      MouseArea {
        z: 1
        anchors.fill: title
      }

      ActionBar {
        z: 2
        anchors {
          right: parent.right
          rightMargin: units.gu(1)
          top: header.top
          topMargin: header.height / 11.3
        }
        numberOfSlots: 1
        actions: [
        Action {
          text: i18n.tr("Locatie")
          iconName: "location"
          onTriggered: {
            settingsPage.visible = true
            mainPage.visible = false
          }
        },
        Action {
          text: {
            if (settings.theme == "Ambiance"){
              i18n.tr("Nachtmodus")

            }
            else {
              i18n.tr("Dagmodus")
            }
          }
          iconSource: {
            if (settings.theme == "Ambiance"){
              "img/night-mode.svg"

            }
            else {
              "img/day-mode.svg"
            }
          }
          onTriggered: {
            if (settings.theme == "Ambiance"){
              Theme.name = "Ubuntu.Components.Themes.SuruDark"
              settings.theme = "SuruDark"
              // bottomEdge moet geopend en gesloten worden voordat het nieuwe thema is toegepast. Anders toont zich een lege pagina:
              bottomEdge.commit()
              bottomEdge.collapse()
            }
            else {
              Theme.name = "Ubuntu.Components.Themes.Ambiance"
              settings.theme = "Ambiance"
              // bottomEdge moet geopend en gesloten worden voordat het nieuwe thema is toegepast. Anders toont zich een lege pagina:
              bottomEdge.commit()
              bottomEdge.collapse()
            }
          }
        },
        Action {
          text: i18n.tr("Over")
          iconName: "info"
          onTriggered: {
            PopupUtils.open(aboutDialog)
          }
        }
        ]
      }

      extension: Sections {
        id: sections
        visible: {
          if (root.width > units.gu(60)) {
            false
          }
          else {
            true
          }
        }
        anchors {
          horizontalCenter: parent.horizontalCenter
          bottom: parent.bottom
        }

        actions: [
        Action {
          text: i18n.tr("Vandaag")
        },
        Action {
          text: i18n.tr("Komende dagen")
        },
        Action {
          text: i18n.tr("Radars")
        },
        Action {
          text: i18n.tr("Kaarten")
        }
        ]
        onSelectedIndexChanged: {
          tabView.currentIndex = selectedIndex
        }

      }

    }

    VisualItemModel {
      id: tabs

      Item {
        id: vandaagItem
        width: tabView.width
        height: tabView.height

        Behavior on opacity {
          NumberAnimation {duration: 230; easing.type: Easing.InOutCubic }
        }

        Column {
          id: layout

          spacing: units.gu(1)
          anchors {
            fill: parent
          }

          Rectangle {
            color: "transparent"
            width: parent.width
            height: {
              if (root.width > units.gu(60)) {
                parent.height / 10
              }
              else {
                0
              }
            }
          }

          AnimatedImage {
            id: radar
            z: 1
            height: width
            width: {
              if (root.width > units.gu(60)) {
                units.gu(50)
              }
              else {
                parent.width
              }
            }

            anchors.horizontalCenter: parent.horizontalCenter

            source: "https://image.buienradar.nl/2.0/image/animation/RadarMapRainNL?height=512&width=512&renderText=True&history=0&forecast=18&skip=1"

            Image {
              anchors.fill: parent
              source: "overlays/" + settings.weerstation + ".png"

              visible: {
                if (radar.status == 1) {
                  true
                }
                else {
                  false
                }
              }
            }

            ActivityIndicator {
              id: activity
              running: {
                if (radar.status == 2) {
                  true
                }
                else {
                  false
                }
              }
              anchors.centerIn: parent
            }

            OptionSelector {
              id: selector
              width: units.gu(14)
              anchors {
                right: parent.right
                rightMargin: units.gu(1)
                bottom: parent.bottom
                bottomMargin: units.gu(1)
              }
              expanded: true
              model: [i18n.tr("+2 uur"),i18n.tr("+24 uur")]
              onSelectedIndexChanged: {
                switch(selector.selectedIndex) {
                case 0: {
                  radar.source = "https://image.buienradar.nl/2.0/image/animation/RadarMapRainNL?height=512&width=512&renderText=True&history=0&forecast=18&skip=1"
                  break;
                }
              case 1: {
                radar.source = "http://api.buienradar.nl/image/1.0/24hourforecastmapnl/?ext=gif"
                break;
              }
            }
          }
        }
      }

      Rectangle {
        color: "transparent"
        width: parent.width
        height: units.gu(10)
        anchors.left: radar.left
        ListView {
          id: list
          z: 23
          anchors.horizontalCenter: parent.horizontalCenter
          width: parent.width - units.gu(2);
          height: Text.paintedHeight
          model: xmlModel
          delegate: Text {
            id: text
            width: parent.width
            textFormat: Text.StyledText
            text:  '<p><b><font color="' + theme.palette.normal.baseText + '">' + i18n.tr('Huidig weer') + '</font></b></p><font color="' + theme.palette.normal.baseText + '">' + i18n.tr('Het is') + ' </font><font color="#19b6ee">' + temp + 'ºC</font><font color="' + theme.palette.normal.baseText + '"> (' + stationnaam + ')' + '<br>' + i18n.tr('De luchtvochtigheid is') + ' </font><font color="#19b6ee">' + luchtvochtigheid + '%</font>' + '<font color="' + theme.palette.normal.baseText + '"><br>' + i18n.tr('De wind komt uit het') + ' </font><font color="#19b6ee">' + wind + '</font><font color="' + theme.palette.normal.baseText + '"> ' + i18n.tr('en heeft') + ' <br> ' + i18n.tr('een snelheid van') + ' </font><font color="#19b6ee">' + windms + ' m/s</font>' + '</p><p>' + '&nbsp;<br>&nbsp;'
            wrapMode: Text.WordWrap
          }
        }
      }
    }
  }

  Item {
    id: komendedagenItem
    width: tabView.width
    height: tabView.height

    Behavior on opacity {
      NumberAnimation {duration: 230; easing.type: Easing.InOutCubic }
    }

    Row {
      anchors.fill: parent
      anchors.topMargin: units.gu(2)

      Rectangle {
        width: parent.width / 25
        height: parent.height
        color: "transparent"
      }

      Rectangle {
        width: 20 + units.gu(2)
        height: parent.height
        color: "transparent"

        Column {
          anchors.fill: parent
          anchors.topMargin: units.gu(4.65)

          ListView {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - units.gu(2);
            height: Text.paintedHeight
            model: xmlModel
            delegate: Column {
              Image {
                source: morgenicoon
                height: units.gu(3)
                width: units.gu(3)
              }
              Rectangle {
                color: "transparent"
                width: parent.width
                height: units.gu(1.75)
              }
              Image {
                source: overmorgenicoon
                height: units.gu(3)
                width: units.gu(3)
              }
              Rectangle {
                color: "transparent"
                width: parent.width
                height: units.gu(1.75)
              }
              Image {
                source: overovermorgenicoon
                height: units.gu(3)
                width: units.gu(3)
              }
              Rectangle {
                color: "transparent"
                width: parent.width
                height: units.gu(1.70)
              }
              Image {
                source: overoverovermorgenicoon
                height: units.gu(3)
                width: units.gu(3)
              }
              Rectangle {
                color: "transparent"
                width: parent.width
                height: units.gu(1.70)
              }
              Image {
                source: overoveroverovermorgenicoon
                height: units.gu(3)
                width: units.gu(3)
              }
            }
          }
        }
      }

      Rectangle {
        width: parent.width / 16
        height: parent.height
        color: "transparent"
      }

      Rectangle {
        width: parent.width / 5.5
        height: parent.height
        color: "transparent"

        Column {
          anchors.fill: parent

          ListView {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - units.gu(2);
            height: Text.paintedHeight
            model: xmlModel
            delegate: Text {
              id: text
              width: parent.width
              textFormat: Text.StyledText
              font.pointSize: units.gu(1.5)
              text:  '<p><font color="#19b6ee">' + i18n.tr('Dag') + '</font></p><p>&nbsp;</p><font color="' + theme.palette.normal.baseText + '">' + morgen + '<p>&nbsp;</p><p>' + overmorgen +  '<p>&nbsp;</p><p>' + overovermorgen + '<p>&nbsp;</p><p>' + overoverovermorgen + '<p>&nbsp;</p><p>' + overoveroverovermorgen + '</font><p>&nbsp;</p>'
              wrapMode: Text.WordWrap
            }
          }
        }
      }

      Rectangle {
        width: parent.width / 5.5
        height: parent.height
        color: "transparent"

        Column {
          anchors.fill: parent

          ListView {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - units.gu(2);
            height: Text.paintedHeight
            model: xmlModel
            delegate: Text {
              id: text
              width: parent.width
              textFormat: Text.StyledText
              font.pointSize: units.gu(1.5)
              text:  '<p><font color="#19b6ee">' + i18n.tr('Max') + '</font></p><p>&nbsp;</p><font color="' + theme.palette.normal.baseText + '">' + tempmorgenmax + '<p>&nbsp;</p><p>' + tempovermorgenmax +  '<p>&nbsp;</p><p>' + tempoverovermorgenmax + '<p>&nbsp;</p><p>' + tempoveroverovermorgenmax + '<p>&nbsp;</p><p>' + tempoveroveroverovermorgenmax + '</font><p>&nbsp;</p>'
              wrapMode: Text.WordWrap
            }
          }
        }
      }

      Rectangle {
        width: parent.width / 5.5
        height: parent.height
        color: "transparent"

        Column {
          anchors.fill: parent

          ListView {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - units.gu(2);
            height: Text.paintedHeight
            model: xmlModel
            delegate: Text {
              id: text
              width: parent.width
              textFormat: Text.StyledText
              font.pointSize: units.gu(1.5)
              text:  '<p><font color="#19b6ee">' + i18n.tr('Min') + '</font></p><p>&nbsp;</p><font color="' + theme.palette.normal.baseText + '">' + tempmorgenmin + '<p>&nbsp;</p><p>' + tempovermorgenmin +  '<p>&nbsp;</p><p>' + tempoverovermorgenmin + '<p>&nbsp;</p><p>' + tempoveroverovermorgenmin + '<p>&nbsp;</p><p>' + tempoveroveroverovermorgenmin + '</font><p>&nbsp;</p>'
              wrapMode: Text.WordWrap
            }
          }
        }
      }

      Rectangle {
        width: parent.width / 5.5 * 2
        height: parent.height
        color: "transparent"

        Column {
          anchors.fill: parent

          ListView {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - units.gu(2);
            height: Text.paintedHeight
            model: xmlModel
            delegate: Text {
              id: text
              width: parent.width
              textFormat: Text.StyledText
              font.pointSize: units.gu(1.5)
              text:  '<p><font color="#19b6ee">' + i18n.tr('Neerslag') + '</font></p><p>&nbsp;</p><font color="' + theme.palette.normal.baseText + '">' + kansregenmorgen + '%<p>&nbsp;</p><p>' + kansregenovermorgen +  '%<p>&nbsp;</p><p>' + kansregenoverovermorgen + '%<p>&nbsp;</p><p>' + kansregenoveroverovermorgen + '%<p>&nbsp;</p><p>' + kansregenoveroveroverovermorgen + '%</font><p>&nbsp;</p>'
              wrapMode: Text.WordWrap
            }
          }
        }
      }
    }

    Rectangle {
      id: bottomPart
      width: parent.width
      height: root.height / 1.5
      color: "transparent"
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottom: parent.bottom

      Icon {
        id: info
        name: "info"
        width: units.gu(4)
        height: width
        color: theme.palette.normal.baseText
        anchors {
          left: parent.left
          leftMargin: {
            if (root.width > units.gu(90)) {
              parent.width / 5.6
            }
            else {
              units.gu(1)
            }
          }
          verticalCenter: parent.verticalCenter
        }
      }

      ListView {
        anchors {
          left: info.right
          leftMargin: units.gu(1)
          top: info.top
        }
        width: {
          if (root.width > units.gu(90)) {
            parent.width / 2
          }
          else {
            parent.width - units.gu(8)
          }
        }
        height: Text.paintedHeight
        model: xmlModel
        delegate: Text {
          id: text
          width: parent.width
          textFormat: Text.StyledText
          text: titel
          color: theme.palette.normal.baseText
          wrapMode: Text.WordWrap
          horizontalAlignment: Text.AlignJustify
        }
      }
    }

  }

  Item {
    id: radarItem
    width: tabView.width
    height: tabView.height

    Behavior on opacity {
      NumberAnimation {duration: 230; easing.type: Easing.InOutCubic }
    }

    Rectangle {
      id: radarItemRectangle
      color: "transparent"
      width: parent.width
      height: {
        if (root.width > units.gu(60)) {
          if (root.height > units.gu(100)) {
            parent.height / 10
          }
          else {
            units.gu(1)
          }
        }
        else {
          0
        }
      }
    }

    Rectangle {
      id: radarRectangle
      color: "transparent"
      height: width
      width: {
        if (root.width > units.gu(60)) {
          units.gu(50)
        }
        else {
          parent.width
        }
      }

      anchors.top: radarItemRectangle.bottom
      anchors.horizontalCenter: parent.horizontalCenter

      AnimatedImage {
        id: nederlandRadar
        z: 1
        height: width
        width: parent.width

        visible: true

        source: "http://api.buienradar.nl/image/1.0/RadarMapNL?w=512&h=512"

        ActivityIndicator {
          id: nederlandActivityRadar
          running: {
            if (nederlandRadar.status == 2) {
              true
            }
            else {
              false
            }
          }
          anchors.centerIn: parent
        }
      }

      AnimatedImage {
        id: europaRadar
        z: 1
        height: width
        width: parent.width

        visible: false

        source: "https://api.buienradar.nl/image/1.0/radarmapeu/?ext=gif"

        Rectangle {
          z:2
          id: europaOverlay
          visible: false
          color: theme.palette.normal.background
          anchors.fill: parent

          Label {
            anchors.centerIn: parent
            text: i18n.tr("Deze radar is helaas niet beschikbaar voor Europa")
            textSize: Label.Medium
          }
        }

        ActivityIndicator {
          id: europaActivityRadar
          running: {
            if (europaRadar.status == 2) {
              true
            }
            else {
              false
            }
          }
          anchors.centerIn: parent
        }
      }

    }

    OptionSelector {
      z: 2
      id: areaSelector
      width: units.gu(16)
      anchors {
        right: radarRectangle.right
        rightMargin: units.gu(1)
        bottom: radarRectangle.bottom
        bottomMargin: units.gu(1)
      }
      expanded: true
      model: [i18n.tr("Nederland"),i18n.tr("Europa")]
      onSelectedIndexChanged: {
        switch(areaSelector.selectedIndex) {
        case 0: {
          nederlandRadar.visible = true
          europaRadar.visible = false
          break;
        }
      case 1: {
        europaRadar.visible = true
        nederlandRadar.visible = false
        break;
      }
    }
  }
}

OptionSelector {
  id: radarSelector
  width: radarRectangle.width - units.gu(2)
  height: parent.height - radarRectangle.height - radarItemRectangle.height - units.gu(2)
  containerHeight: height
  anchors {
    horizontalCenter: parent.horizontalCenter
    top: radarRectangle.bottom
    topMargin: units.gu(1)
  }
  expanded: true
  model: [i18n.tr("Radarbeelden"),i18n.tr("Onweer"),i18n.tr("Hagel"),i18n.tr("Motregen"),i18n.tr("Sneeuw"),i18n.tr("Satellietbeelden")]
  onSelectedIndexChanged: {
    switch(radarSelector.selectedIndex) {
    case 0:
      nederlandRadar.source = "http://api.buienradar.nl/image/1.0/RadarMapNL?w=512&h=512"
      europaRadar.source = "https://api.buienradar.nl/image/1.0/radarmapeu/?ext=gif"
      europaOverlay.visible = false
      break;
    case 1:
      nederlandRadar.source = "https://api.buienradar.nl/image/1.0/lightningnl/?ext=gif"
      europaRadar.source = "https://api.buienradar.nl/image/1.0/radarcloudseu/?ext=gif"
      europaOverlay.visible = false
      break;
    case 2:
      nederlandRadar.source = "https://api.buienradar.nl/image/1.0/hailnl/?ext=gif"
      europaOverlay.visible = true
      break;
    case 3:
      nederlandRadar.source = "https://api.buienradar.nl/image/1.0/drizzlemapnl/?ext=gif"
      europaOverlay.visible = true
      break;
    case 4:
      nederlandRadar.source = "https://api.buienradar.nl/image/1.0/snowmapnl/?ext=gif"
      europaOverlay.visible = true
      break;
    case 5:
      nederlandRadar.source = "https://api.buienradar.nl/image/1.0/satvisual/?ext=gif&type=NL"
      europaRadar.source = "https://api.buienradar.nl/image/1.0/satvisual/?ext=gif&type=EU"
      europaOverlay.visible = false
      break;
    }
  }
}
}

Item {
  id: kaartenItem
  width: tabView.width
  height: tabView.height

  Behavior on opacity {
    NumberAnimation {duration: 230; easing.type: Easing.InOutCubic }
  }

  Rectangle {
    id: kaartenItemRectangle
    color: "transparent"
    width: parent.width
    height: {
      if (root.width > units.gu(60)) {
        units.gu(1)
      }
      else {
        0
      }
    }
  }

  Image {
    id: kaart
    height: width * 1.2
    width: {
      if (root.width > units.gu(60)) {
        units.gu(50)
      }
      else {
        parent.width
      }
    }

    anchors.top: kaartenItemRectangle.bottom
    anchors.horizontalCenter: parent.horizontalCenter

    source: "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=temperatuur"

    Rectangle {
      id: kaartOverlay //verbergt Buienradar logo
      color: "white"
      width: parent.width / 2
      height: width / 3.5
      visible: {
        if (kaart.status == 1) {
          true
        }
        else {
          false
        }
      }
      anchors {
        left: parent.left
        leftMargin: units.gu(0.5)
        bottom: parent.bottom
        bottomMargin: units.gu(0.5)
      }
    }

    Rectangle {
      z: 2
      id: legendaHolder
      width: legendaButton.width * 2
      height: width * 1.18
      color: "transparent"
      visible: false
      anchors {
        right: legendaButton.right
        bottom: legendaButton.top
        bottomMargin: units.gu(0.5)
      }

      Image {
        id: legenda
        visible: {
          if (kaart.status == 1) {
            true
          }
          else {
            false
          }
        }
        source: "legenda/temperatuur.png"
        width: parent.width
        height: parent.height
      }
    }

    Button {
      id: legendaButton
      color: "#19b6ee"
      text: i18n.tr("Legenda")
      visible: {
        if (kaart.status == 1) {
          true
        }
        else {
          false
        }
      }
      anchors {
        right: parent.right
        rightMargin: units.gu(1)
        bottom: parent.bottom
        bottomMargin: units.gu(1)
      }

      onClicked: {
        if (legendaHolder.visible == false) {
          legendaHolder.visible = true
        }
        else {
          legendaHolder.visible = false
        }
      }
    }

    ActivityIndicator {
      id: kaartActivity
      running: {
        if (kaart.status == 2) {
          true
        }
        else {
          false
        }
      }
      anchors.centerIn: parent
    }
  }

  Button {
    z: 3
    id: expander
    color: theme.palette.normal.base
    width: height
    anchors {
      top: kaartSelector.top
      topMargin: units.gu(-5.8)
      left: kaartSelector.left
    }
    onClicked: {
      if (kaartSelector.anchors.topMargin == units.gu(1)) {
        kaartSelector.anchors.topMargin = units.gu(-20)
      }
      else {
        kaartSelector.anchors.topMargin = units.gu(1)
      }
    }

    Icon {
      width: parent.width - units.gu(1.5)
      height: parent.height - units.gu(1.5)
      color: theme.palette.normal.baseText
      name: {
        if (kaartSelector.anchors.topMargin == units.gu(1)) {
          "go-up"
        }
        else {
          "go-down"
        }
      }
      anchors.centerIn: parent
    }
  }

  OptionSelector {
    id: kaartSelector
    width: kaart.width - units.gu(2)
    containerHeight: height
    anchors {
      horizontalCenter: parent.horizontalCenter
      bottom: parent.bottom
      bottomMargin: units.gu(1)
      top: kaart.bottom
      topMargin: units.gu(1)
    }
    expanded: true
    model: [i18n.tr("Actuele temperatuur"),i18n.tr("Gevoelstemperatuur"),i18n.tr("Grondtemperatuur"),i18n.tr("Minimum grondtemperatuur"),i18n.tr("Minimumtemperatuur"),i18n.tr("Maximumtemperatuur"),i18n.tr("Actuele wind"),i18n.tr("Maximale wind"),i18n.tr("Actuele windstoten"),i18n.tr("Zwaarste windstoten"),i18n.tr("Neerslag afgelopen uur"),i18n.tr("Dagelijkse neerslagsom"),i18n.tr("Totaal aantal zonuren"),i18n.tr("Zicht en mist"),i18n.tr("Luchtvochtigheid"),i18n.tr("Luchtkwaliteitsindex"),i18n.tr("Actuele ozon"),i18n.tr("Actuele stikstofdioxide"),i18n.tr("Actuele fijnstof"),i18n.tr("Pollen en hooikoorts"),i18n.tr("Muggenradar")]
    onSelectedIndexChanged: {
      switch(kaartSelector.selectedIndex) {
      case 0:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=temperatuur"
        legendaHolder.height = legendaHolder.width * 1.18
        legenda.source = "legenda/temperatuur.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 1:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=gevoelstemperatuur"
        legendaHolder.height = legendaHolder.width * 1.18
        legenda.source = "legenda/temperatuur.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 2:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=temperatuurgrond"
        legendaHolder.height = legendaHolder.width * 1.18
        legenda.source = "legenda/temperatuur.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 3:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=temperatuurgrondmin"
        legendaHolder.height = legendaHolder.width * 1.18
        legenda.source = "legenda/temperatuur.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 4:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=temperatuurmin"
        legendaHolder.height = legendaHolder.width * 1.18
        legenda.source = "legenda/temperatuur.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 5:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=temperatuurmax"
        legendaHolder.height = legendaHolder.width * 1.18
        legenda.source = "legenda/temperatuur.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 6:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=wind"
        legendaHolder.height = legendaHolder.width * 0.88
        legenda.source = "legenda/windsnelheid.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 7:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=windmax"
        legendaHolder.height = legendaHolder.width * 0.88
        legenda.source = "legenda/windsnelheid.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 8:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=windstotenactueel"
        legendaHolder.height = legendaHolder.width * 0.84
        legenda.source = "legenda/windstoten.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 9:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=windstoten"
        legendaHolder.height = legendaHolder.width * 0.84
        legenda.source = "legenda/windstoten.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 10:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=neerslaguur"
        legendaHolder.height = legendaHolder.width * 1.04
        legenda.source = "legenda/neerslag.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 11:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=neerslag24uur"
        legendaHolder.height = legendaHolder.width * 1.04
        legenda.source = "legenda/neerslag.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 12:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=zonneschijn"
        legendaHolder.height = legendaHolder.width * 1.04
        legenda.source = "legenda/zonuren.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 13:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=zicht"
        legendaHolder.height = legendaHolder.width * 0.54
        legenda.source = "legenda/zicht.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 14:
        kaart.source = "https://api.buienradar.nl/image/1.0/weathermapnl/?ext=png&width=500&type=luchtvochtigheid"
        legendaHolder.height = legendaHolder.width * 0.71
        legenda.source = "legenda/luchtvochtigheid.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 15:
        kaart.source = "https://api.buienradar.nl/image/1.0/airqualitymapnl/?ext=png&width=500&type=lki"
        legendaHolder.height = legendaHolder.width * 0.74
        legenda.source = "legenda/luchtkwaliteitsindex.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 16:
        kaart.source = "https://api.buienradar.nl/image/1.0/airqualitymapnl/?ext=png&width=500&type=ozon"
        legendaHolder.height = legendaHolder.width * 0.59
        legenda.source = "legenda/ozon.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 17:
        kaart.source = "https://api.buienradar.nl/image/1.0/airqualitymapnl/?ext=png&width=500&type=no2"
        legendaHolder.height = legendaHolder.width * 0.45
        legenda.source = "legenda/stikstofdioxide.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 18:
        kaart.source = "https://api.buienradar.nl/image/1.0/airqualitymapnl/?ext=png&width=500&type=pm10"
        legendaHolder.height = legendaHolder.width * 0.54
        legenda.source = "legenda/fijnstof.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 19:
        kaart.source = "https://api.buienradar.nl/image/1.0/pollenradarnl/?ext=png&w=500"
        legendaHolder.height = legendaHolder.width * 0.71
        legenda.source = "legenda/pollen.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      case 20:
        kaart.source = "https://api.buienradar.nl/image/1.0/mosquitoradarnl/?ext=png&width=500"
        legendaHolder.height = legendaHolder.width * 0.67
        legenda.source = "legenda/muggen.png"
        kaartSelector.anchors.topMargin = units.gu(1)
        break;
      }
    }
  }

}

}

ListView {
  id: tabView

  width: {
    if (root.width > units.gu(60)) {
      root.width - units.gu(10)
    }
    else {
      root.width
    }
  }

  anchors {
    top: mainPage.header.bottom
    bottom: parent.bottom
    right: parent.right
  }
  model: tabs
  currentIndex: 0

  orientation: Qt.Horizontal
  snapMode: ListView.SnapOneItem
  highlightRangeMode: ListView.StrictlyEnforceRange
  highlightMoveDuration: UbuntuAnimation.FastDuration

  onCurrentIndexChanged: {
    sections.selectedIndex = currentIndex
  }

}
}

AboutDialog {
  id: aboutDialog
}

NoConnectionDialog {
  id: noConnectionDialog
}
}
