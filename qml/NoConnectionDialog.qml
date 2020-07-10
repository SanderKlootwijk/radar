import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Component {
  id: noConnectionDialog
  Dialog {
    signal closed();
    id: dialogue
    title: "Oeps!"
    theme: ThemeSettings {
      name: settings.thema
    }

    Label {
      text: "Geen verbinding"
      horizontalAlignment: Text.AlignHCenter
    }

    Rectangle {
      color: "transparent"
      width: parent.width
      height: width / 2
      Image {
        width: parent.width / 2
        height: width
        anchors.centerIn: parent
        source: "img/offline.svg"
      }
    }

    Label {
      width: parent.width
      wrapMode: Text.WordWrap
      horizontalAlignment: Text.AlignHCenter
      text: "Radar vereist een actieve internetverbinding! Controleer je netwerkinstellingen en probeer het opnieuw."
    }

    Button {
      text: "Sluiten"
      color: theme.palette.normal.activity
      onClicked: Qt.quit()
    }

    Button {
      text: "Toch proberen..."
      color: "#888888"
      onClicked: PopupUtils.close(dialogue)
    }
  }
}
