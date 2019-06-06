import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Component {
  id: aboutDialog
  Dialog {
    signal closed();
    id: dialogue
    title: "Over Radar"
    theme: ThemeSettings {
      name: settings.thema
    }


    Rectangle {
      color: "transparent"
      width: parent.width
      height: width / 2
      Image {
        width: parent.width / 2
        height: width
        anchors.centerIn: parent
        source: "img/welcome.svg"
      }
    }

    Label {
      width: parent.width
      wrapMode: Text.WordWrap
      horizontalAlignment: Text.AlignHCenter
      text: "<p>Radar geeft duidelijke en betrouwbare weersinfo zodat je droog en voorbereid op pad gaat!</p>&nbsp;<p>Disclaimer: Deze applicatie is zelfstandig ontwikkeld. Alle logo's en namen in deze toepassing zijn handelsmerken van hun respectievelijke eigenaars.</p>"
    }

    Label {
      linkColor: "#19b6ee"
      width: parent.width
      wrapMode: Text.Wrap
      text: 'Auteur: Sander Klootwijk<br/>Telegram: <a href="https://www.t.me/SanderKlootwijk">@SanderKlootwijk</a><br/>Licentie: <a href="https://www.gnu.org/licenses/gpl.html">GNU GPL v3</a><br/>Broncode: <a href="https://github.com/SanderKlootwijk/Radar">GitHub</a>'
      onLinkActivated: Qt.openUrlExternally(link)
    }

    Button {
      width: parent.width
      color: "#19b6ee"
      text: "Sluiten"

      onClicked: {
        PopupUtils.close(dialogue);
        closed();
      }
    }
  }
}
