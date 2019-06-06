import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Rectangle {
  color: "transparent"
  width: parent.width
  height: units.gu(7)

  property alias naam: naam.text
  property alias informatie: informatie.text
  property alias stationnummer: stationnummer.text

  Rectangle {
    width: parent.width
    height: units.gu(0.1)
    color: theme.palette.normal.base
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
  }

  Label {
    id: naam
    anchors {
      left: parent.left
      leftMargin: units.gu(1)
      top: parent.top
      topMargin: units.gu(1)
    }
    text: ""
    textSize: Label.Medium
  }

  Label {
    id: informatie
    anchors {
      left: parent.left
      leftMargin: units.gu(1)
      top: naam.bottom
      topMargin: units.gu(0.5)
    }
    text: ""
    color: theme.palette.normal.baseText
    textSize: Label.Small
  }

  Icon {
    name: "go-next"
    height: units.gu(2)
    color: theme.palette.normal.baseText
    anchors {
      verticalCenter: parent.verticalCenter
      right: parent.right
      rightMargin: units.gu(2)
    }
  }

  Text {
    id: stationnummer
    color: "transparent"
    text: ""
  }

  MouseArea {
      anchors.fill: parent
      onClicked: {
        settings.weerstation = stationnummer.text
        Qt.inputMethod.hide()
        PopupUtils.open(settingsDialog)
      }
  }
}
