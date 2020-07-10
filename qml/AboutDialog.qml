import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Component {
  id: aboutDialog
  Dialog {
    signal closed();
    id: dialogue
    title: i18n.tr("Over Radar")
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
      text: "<p>" + i18n.tr("Radar geeft duidelijke en betrouwbare weersinfo zodat je droog en voorbereid op pad gaat!") + "</p>&nbsp;<p>" + i18n.tr("Disclaimer: Deze applicatie is zelfstandig ontwikkeld. Alle logo's en namen in deze toepassing zijn handelsmerken van hun respectievelijke eigenaars.") + "</p>"
    }

    Label {
      linkColor: theme.palette.normal.activity
      width: parent.width
      wrapMode: Text.Wrap
      text: i18n.tr('Auteur') + ': Sander Klootwijk<br/>Telegram: <a href="https://www.t.me/SanderKlootwijk">@SanderKlootwijk</a><br/>' + i18n.tr('Licentie') + ': <a href="https://www.gnu.org/licenses/gpl.html">GNU GPL v3</a><br/>' + i18n.tr('Broncode') + ': <a href="https://github.com/SanderKlootwijk/Radar">GitHub</a>'
      onLinkActivated: Qt.openUrlExternally(link)
    }

    Button {
      width: parent.width
      color: theme.palette.normal.activity
      text: i18n.tr("Sluiten")

      onClicked: {
        PopupUtils.close(dialogue);
        closed();
      }
    }
  }
}
