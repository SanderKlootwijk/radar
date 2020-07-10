import QtQuick 2.4
import Ubuntu.Components 1.3

Page {
  id: welcomeWizard
  visible: false

  Item {
    id: slide1
    anchors.fill: parent

    Image {
      anchors {
        top: parent.top
        topMargin: units.gu(6)
        bottom: introductieText.top
        bottomMargin: units.gu(6)
        horizontalCenter: parent.horizontalCenter
      }

      Image {
        width: units.gu(20)
        height: units.gu(20)

        anchors.centerIn: parent

        source: Qt.resolvedUrl("img/welcome.svg")
        fillMode: Image.PreserveAspectFit
        antialiasing: true
      }
    }

    Label {
      id: introductieText
      text: i18n.tr("Welkom bij Radar!")
      textSize: Label.XLarge
      height: contentHeight
      anchors.centerIn: parent
    }

    Label {
      id: infoText
      text: i18n.tr("Radar geeft duidelijke en betrouwbare weersinfo zodat je droog en voorbereid op pad gaat!\n\nIn één oogopslag zie je of het de komende twee uur gaat regenen. Op deze manier hoef je nooit nat te worden!")
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.margins: units.gu(1)
      anchors.top: introductieText.bottom
      anchors.topMargin: units.gu(4)
      wrapMode: Text.WordWrap
      horizontalAlignment: Text.AlignHCenter
    }

    Button {
      color: theme.palette.normal.activity
      text: i18n.tr("Verder")
      anchors.top: infoText.bottom
      anchors.topMargin: units.gu(5)
      anchors.horizontalCenter: parent.horizontalCenter

      onClicked: {
        slide1.visible = false
        slide2.visible = true
      }
    }
  }

  Item {
    id: slide2
    anchors.fill: parent
    visible: false

    Rectangle {
      id: container
      width: {
        if (parent.width > units.gu(65)) {
          parent.width / 1.5
        }
        else {
          parent.width
        }
      }
      height: parent.height
      anchors.horizontalCenter: parent.horizontalCenter

      color: "transparent"

      Label {
        id: titel
        text: i18n.tr("Kies een thema")
        textSize: Label.XLarge
        height: contentHeight
        anchors.top: parent.top
        anchors.topMargin: units.gu(6)
        anchors.horizontalCenter: parent.horizontalCenter
      }

      Label {
        id: ondertitel
        text: i18n.tr("Je kunt kiezen tussen een donker\nof een licht thema...")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: units.gu(1)
        anchors.top: titel.bottom
        anchors.topMargin: units.gu(1)
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
      }

      Rectangle {
        color: "grey"
        width: darkRectangle.width + units.gu(0.5)
        height: darkRectangle.height + units.gu(0.5)
        anchors.centerIn: darkRectangle
      }

      Rectangle {
        id: darkRectangle
        color: "#111111"
        width: height / 1.75
        height: parent.height / 2.3
        anchors {
          bottom: donker.top
          bottomMargin: units.gu(2)
          horizontalCenter: donker.horizontalCenter
        }

        Text {
          text: "Meetstation De Bilt - 8.0 °C"
          color: "white"
          font.pixelSize: parent.width / 14
          anchors.top: parent.top
          anchors.left: parent.left
          anchors.topMargin: units.gu(0.9)
          anchors.leftMargin: units.gu(0.9)
        }

        Rectangle {
          id: lineDark
          width: parent.width
          height: units.gu(0.1)
          anchors {
            top: parent.top
            topMargin: units.gu(3.5)
            horizontalCenter: parent.horizontalCenter
          }

          color: "grey"
        }

        Image {
          width: parent.width
          height: width
          anchors {
            top: lineDark.bottom
            horizontalCenter: parent.horizontalCenter
          }
          source: "img/radar.jpg"

          Image {
            width: parent.width - units.gu(1)
            height: width * 0.25
            fillMode: Image.PreserveAspectFit
            anchors {
              top: parent.bottom
              topMargin: units.gu(0.5)
              horizontalCenter: parent.horizontalCenter
            }

            source: "img/donker.jpg"
          }
        }
      }

      Rectangle {
        color: "grey"
        width: lightRectangle.width + units.gu(0.5)
        height: lightRectangle.height + units.gu(0.5)
        anchors.centerIn: lightRectangle
      }

      Rectangle {
        z: 1
        id: lightRectangle
        color: "white"
        width: height / 1.75
        height: parent.height / 2.3
        anchors {
          bottom: licht.top
          bottomMargin: units.gu(2)
          horizontalCenter: licht.horizontalCenter
        }

        Text {
          text: "Meetstation De Bilt - 8.0 °C"
          color: "black"
          font.pixelSize: parent.width / 14
          anchors.top: parent.top
          anchors.left: parent.left
          anchors.topMargin: units.gu(0.9)
          anchors.leftMargin: units.gu(0.9)
        }

        Rectangle {
          id: lineLight
          width: parent.width
          height: units.gu(0.1)
          anchors {
            top: parent.top
            topMargin: units.gu(3.5)
            horizontalCenter: parent.horizontalCenter
          }

          color: "#111111"
        }

        Image {
          width: parent.width
          height: width
          anchors {
            top: lineLight.bottom
            horizontalCenter: parent.horizontalCenter
          }
          source: "img/radar.jpg"

          Image {
            width: parent.width - units.gu(1)
            height: width * 0.25
            anchors {
              top: parent.bottom
              topMargin: units.gu(0.5)
              horizontalCenter: parent.horizontalCenter
            }

            source: "img/licht.jpg"
          }
        }
      }

      Button {
        id: donker
        color: theme.palette.normal.activity
        text: i18n.tr("Donker")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: units.gu(15)
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 7

        onClicked: {
          settings.theme = "SuruDark"
          Theme.name = "Ubuntu.Components.Themes." + settings.theme
          slide2.visible = false
          slide3.visible = true
        }
      }

      Button {
        id: licht
        color: theme.palette.normal.activity
        text: i18n.tr("Licht")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: units.gu(15)
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 7

        onClicked: {
          settings.theme = "Ambiance"
          Theme.name = "Ubuntu.Components.Themes." + settings.theme
          slide2.visible = false
          slide3.visible = true
        }
      }
    }
  }

  Item {
    id: slide3
    visible: false
    anchors.fill: parent

    Rectangle {
      anchors {
        top: parent.top
        topMargin: units.gu(6)
        bottom: locatieText.top
        bottomMargin: units.gu(6)
        horizontalCenter: parent.horizontalCenter
      }

      Image {
        width: units.gu(20)
        height: units.gu(20)

        anchors.centerIn: parent

        source: Qt.resolvedUrl("img/location.svg")
        fillMode: Image.PreserveAspectFit
        antialiasing: true
      }
    }

    Label {
      id: locatieText
      text: i18n.tr("Locatie")
      textSize: Label.XLarge
      height: contentHeight
      anchors.centerIn: parent
    }

    Label {
      id: locatieOndertitel
      text: i18n.tr("Je kunt zo meteen via het menu rechtsboven in beeld een meetstation selecteren.\n\nHet standaard meetstation is De Bilt (Regio Utrecht).")
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.margins: units.gu(1)
      anchors.top: locatieText.bottom
      anchors.topMargin: units.gu(4)
      wrapMode: Text.WordWrap
      horizontalAlignment: Text.AlignHCenter
    }

    Button {
      color: theme.palette.normal.activity
      text: i18n.tr("Verder")
      anchors.top: locatieOndertitel.bottom
      anchors.topMargin: units.gu(5)
      anchors.horizontalCenter: parent.horizontalCenter

      onClicked: {
        slide3.visible = false
        slide4.visible = true
      }
    }
  }

  Item {
    id: slide4
    visible: false
    anchors.fill: parent

    Rectangle {
      anchors {
        top: parent.top
        topMargin: units.gu(6)
        bottom: eindeText.top
        bottomMargin: units.gu(6)
        horizontalCenter: parent.horizontalCenter
      }

      Image {
        width: units.gu(20)
        height: units.gu(20)

        anchors.centerIn: parent

        source: Qt.resolvedUrl("img/checked.svg")
        fillMode: Image.PreserveAspectFit
        antialiasing: true
      }
    }

    Label {
      id: eindeText
      text: i18n.tr("Je bent helemaal klaar!")
      textSize: Label.XLarge
      height: contentHeight
      anchors.centerIn: parent
    }

    Label {
      id: eindeOndertitel
      text: i18n.tr("Je kunt de instellingen altijd wijzigen via het menu rechtsboven in beeld.\n\nVeel plezier bij het gebruik van Radar!")
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.margins: units.gu(1)
      anchors.top: eindeText.bottom
      anchors.topMargin: units.gu(4)
      wrapMode: Text.WordWrap
      horizontalAlignment: Text.AlignHCenter
    }

    Button {
      color: theme.palette.normal.activity
      text: i18n.tr("Sluiten")
      anchors.top: eindeOndertitel.bottom
      anchors.topMargin: units.gu(5)
      anchors.horizontalCenter: parent.horizontalCenter

      onClicked: {
        welcomeWizard.visible = false
        mainPage.visible = true
        settings.firstRun = "false"
      }
    }
  }

}
