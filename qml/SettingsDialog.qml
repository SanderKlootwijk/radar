import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Component {
  id: settingsDialog
  Dialog {
    signal closed();
    id: dialogue

    Component.onCompleted: {
      selector.selectedIndex = settings.selectedIndex
    }

    Label {
      id: info
      width: parent.width
      wrapMode: Text.Wrap
      horizontalAlignment: Text.AlignHCenter
      text: "Om de instellingen toe te passen zal de app worden gesloten. U dient de app zelf, handmatig opnieuw te openen."
    }

    Button {
      width: parent.width
      id: toepassen
      text: "Toepassen"
      color: "#19b6ee"

      onClicked: {
        Qt.quit()
      }
    }
}
}
