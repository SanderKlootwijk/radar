import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Popups 1.3

Page {
  id: settingsPage
  visible: false
  header: PageHeader {
    id: header

    Label {
      id: title
      text: "Instellingen"
      textSize: Label.Large
      anchors.left: actionBar.right
      anchors.verticalCenter: actionBar.verticalCenter
    }

    ActionBar {
        id: actionBar
        anchors.left: parent.left
        height: header.height - units.gu(0.1)
        numberOfSlots: 1
        actions: [
        Action {
          id: infoAction
          text: i18n.tr("Sluiten")
          iconName: "go-previous"
          onTriggered: {
            mainPage.visible = true
            settingsPage.visible = false
          }
        }
        ]
}
  }

  Label {
    z: 2
    id: info
    anchors {
      left: parent.left
      leftMargin: units.gu(1)
      top: header.bottom
      topMargin: units.gu(1)
    }
    width: parent.width - units.gu(2)
    wrapMode: Text.Wrap
    text: 'Kies een meetstation uit de lijst, of gebruik de zoekbalk om naar een stad of dorp te zoeken.'
  }

  TextField {
    z: 2
    id: searchBar
    width: parent.width - units.gu(2)
    height: units.gu(3.5)
    anchors {
      horizontalCenter: parent.horizontalCenter
      top: info.bottom
      topMargin: units.gu(1)
    }
    inputMethodHints: Qt.ImhUrlCharactersOnly | Qt.ImhNoPredictiveText | Qt.ImhNoAutoUppercase
  }

  Rectangle {
    z: 1
    id: bovenstegedeelte
    color: theme.palette.normal.background
    width: parent.width
    anchors {
      top: header.bottom
      bottom: flickable.top
    }
  }

  Scrollbar {
    z: 1
    visible: true
    flickableItem: flickable
    align: Qt.AlignTrailing
  }

  Rectangle {
    width: parent.width
    height: units.gu(0.1)
    color: theme.palette.normal.base
    anchors.top: flickable.top
    anchors.horizontalCenter: parent.horizontalCenter
  }

  Flickable {
    id: flickable
    width: parent.width
    height: parent.height - bovenstegedeelte.height - header.height
    anchors {
      horizontalCenter: parent.horizontalCenter
      top: searchBar.bottom
      topMargin: units.gu(2)
    }
    contentWidth: weerstationsColumn.width
    contentHeight: weerstationsColumn.height

    Column {
      id: weerstationsColumn
      width: settingsPage.width

      Weerstation {
        naam: "Arcen"
        informatie: "Regio Venlo"
        stationnummer: "1"
        visible: {
          if (searchBar.text == "Arcen") {
            true
          }
          else if (searchBar.text == "arcen") {
            true
          }
          else if (searchBar.text == "Venlo") {
            true
          }
          else if (searchBar.text == "venlo") {
            true
          }
          else if (searchBar.text == "Venray") {
            true
          }
          else if (searchBar.text == "venray") {
            true
          }
          else if (searchBar.text == "Horst") {
            true
          }
          else if (searchBar.text == "horst") {
            true
          }
          else if (searchBar.text == "Sevenum") {
            true
          }
          else if (searchBar.text == "sevenum") {
            true
          }
          else if (searchBar.text == "America") {
            true
          }
          else if (searchBar.text == "america") {
            true
          }
          else if (searchBar.text == "Limburg") {
            true
          }
          else if (searchBar.text == "limburg") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Arnhem"
        informatie: "Regio Arnhem"
        stationnummer: "2"
        visible: {
          if (searchBar.text == "Arnhem") {
            true
          }
          else if (searchBar.text == "arnhem") {
            true
          }
          else if (searchBar.text == "Elst") {
            true
          }
          else if (searchBar.text == "elst") {
            true
          }
          else if (searchBar.text == "Ede") {
            true
          }
          else if (searchBar.text == "ede") {
            true
          }
          else if (searchBar.text == "Wageningen") {
            true
          }
          else if (searchBar.text == "wageningen") {
            true
          }
          else if (searchBar.text == "Veenendaal") {
            true
          }
          else if (searchBar.text == "veenendaal") {
            true
          }
          else if (searchBar.text == "Velp") {
            true
          }
          else if (searchBar.text == "velp") {
            true
          }
          else if (searchBar.text == "Huissen") {
            true
          }
          else if (searchBar.text == "huissen") {
            true
          }
          else if (searchBar.text == "Duiven") {
            true
          }
          else if (searchBar.text == "duiven") {
            true
          }
          else if (searchBar.text == "Hoenderloo") {
            true
          }
          else if (searchBar.text == "hoenderloo") {
            true
          }
          else if (searchBar.text == "Apeldoorn") {
            true
          }
          else if (searchBar.text == "apeldoorn") {
            true
          }
          else if (searchBar.text == "Deventer") {
            true
          }
          else if (searchBar.text == "deventer") {
            true
          }
          else if (searchBar.text == "Gelderland") {
            true
          }
          else if (searchBar.text == "gelderland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Berkhout"
        informatie: "Regio Berkhout"
        stationnummer: "3"
        visible: {
          if (searchBar.text == "Berkhout") {
            true
          }
          else if (searchBar.text == "berkhout") {
            true
          }
          else if (searchBar.text == "berkhout") {
            true
          }
          else if (searchBar.text == "Hoorn") {
            true
          }
          else if (searchBar.text == "hoorn") {
            true
          }
          else if (searchBar.text == "Scharwoude") {
            true
          }
          else if (searchBar.text == "scharwoude") {
            true
          }
          else if (searchBar.text == "De Goorn") {
            true
          }
          else if (searchBar.text == "de goorn") {
            true
          }
          else if (searchBar.text == "De goorn") {
            true
          }
          else if (searchBar.text == "Wognum") {
            true
          }
          else if (searchBar.text == "wognum") {
            true
          }
          else if (searchBar.text == "Avenhorn") {
            true
          }
          else if (searchBar.text == "avenhorn") {
            true
          }
          else if (searchBar.text == "Noord-Holland") {
            true
          }
          else if (searchBar.text == "Noord-holland") {
            true
          }
          else if (searchBar.text == "noord-holland") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Cadzand"
        informatie: "Regio Cadzand"
        stationnummer: "4"
        visible: {
          if (searchBar.text == "Cadzand") {
            true
          }
          else if (searchBar.text == "cadzand") {
            true
          }
          else if (searchBar.text == "Nieuwvliet") {
            true
          }
          else if (searchBar.text == "nieuwvliet") {
            true
          }
          else if (searchBar.text == "Oostburg") {
            true
          }
          else if (searchBar.text == "oostburg") {
            true
          }
          else if (searchBar.text == "Sluis") {
            true
          }
          else if (searchBar.text == "sluis") {
            true
          }
          else if (searchBar.text == "Breskens") {
            true
          }
          else if (searchBar.text == "breskens") {
            true
          }
          else if (searchBar.text == "Zeeland") {
            true
          }
          else if (searchBar.text == "zeeland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "De Bilt"
        informatie: "Regio Utrecht"
        stationnummer: "5"
        visible: {
          if (searchBar.text == "De") {
            true
          }
          if (searchBar.text == "de") {
            true
          }
          if (searchBar.text == "De Bilt") {
            true
          }
          else if (searchBar.text == "De bilt") {
            true
          }
          else if (searchBar.text == "de Bilt") {
            true
          }
          else if (searchBar.text == "de bilt") {
            true
          }
          else if (searchBar.text == "Bilt") {
            true
          }
          else if (searchBar.text == "bilt") {
            true
          }
          else if (searchBar.text == "Utrecht") {
            true
          }
          else if (searchBar.text == "utrecht") {
            true
          }
          else if (searchBar.text == "Zeist") {
            true
          }
          else if (searchBar.text == "zeist") {
            true
          }
          else if (searchBar.text == "Voordorp") {
            true
          }
          else if (searchBar.text == "voordorp") {
            true
          }
          else if (searchBar.text == "Bunnik") {
            true
          }
          else if (searchBar.text == "bunnik") {
            true
          }
          else if (searchBar.text == "nieuwegein") {
            true
          }
          else if (searchBar.text == "Nieuwegein") {
            true
          }
          else if (searchBar.text == "Houten") {
            true
          }
          else if (searchBar.text == "houten") {
            true
          }
          else if (searchBar.text == "bilthoven") {
            true
          }
          else if (searchBar.text == "Bilthoven") {
            true
          }
          else if (searchBar.text == "Den Dolder") {
            true
          }
          else if (searchBar.text == "Den dolder") {
            true
          }
          else if (searchBar.text == "den dolder") {
            true
          }
          else if (searchBar.text == "soest") {
            true
          }
          else if (searchBar.text == "Soest") {
            true
          }
          else if (searchBar.text == "Amersfoort") {
            true
          }
          else if (searchBar.text == "amersfoort") {
            true
          }
          else if (searchBar.text == "Driebergen") {
            true
          }
          else if (searchBar.text == "driebergen") {
            true
          }
          else if (searchBar.text == "Soesterberg") {
            true
          }
          else if (searchBar.text == "soesterberg") {
            true
          }
          else if (searchBar.text == "Woudenberg") {
            true
          }
          else if (searchBar.text == "woudenberg") {
            true
          }
          else if (searchBar.text == "Leusden") {
            true
          }
          else if (searchBar.text == "leusden") {
            true
          }
          else if (searchBar.text == "scherpenzeel") {
            true
          }
          else if (searchBar.text == "Scherpenzeel") {
            true
          }
          else if (searchBar.text == "IJsselstein") {
            true
          }
          else if (searchBar.text == "ijsselstein") {
            true
          }
          else if (searchBar.text == "Ijsselstein") {
            true
          }
          else if (searchBar.text == "Vianen") {
            true
          }
          else if (searchBar.text == "vianen") {
            true
          }
          else if (searchBar.text == "Maarssen") {
            true
          }
          else if (searchBar.text == "maarssen") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Den Helder"
        informatie: "Regio Den Helder"
        stationnummer: "6"
        visible: {
          if (searchBar.text == "Den Helder") {
            true
          }
          else if (searchBar.text == "Den helder") {
            true
          }
          else if (searchBar.text == "den helder") {
            true
          }
          else if (searchBar.text == "den Helder") {
            true
          }
          else if (searchBar.text == "Julianadorp") {
            true
          }
          else if (searchBar.text == "julianadorp") {
            true
          }
          else if (searchBar.text == "Breezand") {
            true
          }
          else if (searchBar.text == "breezand") {
            true
          }
          else if (searchBar.text == "den oever") {
            true
          }
          else if (searchBar.text == "Den oever") {
            true
          }
          else if (searchBar.text == "Den Oever") {
            true
          }
          else if (searchBar.text == "Texel") {
            true
          }
          else if (searchBar.text == "texel") {
            true
          }
          else if (searchBar.text == "wadden") {
            true
          }
          else if (searchBar.text == "Wadden") {
            true
          }
          else if (searchBar.text == "Anna paulowna") {
            true
          }
          else if (searchBar.text == "anna paulowna") {
            true
          }
          else if (searchBar.text == "Anna Paulowna") {
            true
          }
          else if (searchBar.text == "Hippolytushoef") {
            true
          }
          else if (searchBar.text == "hippolytushoef") {
            true
          }
          else if (searchBar.text == "Callantsoog") {
            true
          }
          else if (searchBar.text == "callantsoog") {
            true
          }
          else if (searchBar.text == "Schagen") {
            true
          }
          else if (searchBar.text == "schagen") {
            true
          }
          else if (searchBar.text == "Noord-Holland") {
            true
          }
          else if (searchBar.text == "Noord-holland") {
            true
          }
          else if (searchBar.text == "noord-holland") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Eindhoven"
        informatie: "Regio Eindhoven"
        stationnummer: "7"
        visible: {
          if (searchBar.text == "Eindhoven") {
            true
          }
          else if (searchBar.text == "eindhoven") {
            true
          }
          else if (searchBar.text == "Geldrop") {
            true
          }
          else if (searchBar.text == "geldrop") {
            true
          }
          else if (searchBar.text == "Helmond") {
            true
          }
          else if (searchBar.text == "helmond") {
            true
          }
          else if (searchBar.text == "Best") {
            true
          }
          else if (searchBar.text == "best") {
            true
          }
          else if (searchBar.text == "Veldhoven") {
            true
          }
          else if (searchBar.text == "veldhoven") {
            true
          }
          else if (searchBar.text == "Aalst") {
            true
          }
          else if (searchBar.text == "aalst") {
            true
          }
          else if (searchBar.text == "Nuenen") {
            true
          }
          else if (searchBar.text == "nuenen") {
            true
          }
          else if (searchBar.text == "Valkenswaard") {
            true
          }
          else if (searchBar.text == "valkenswaard") {
            true
          }
          else if (searchBar.text == "Son") {
            true
          }
          else if (searchBar.text == "son") {
            true
          }
          else if (searchBar.text == "Mierlo") {
            true
          }
          else if (searchBar.text == "mierlo") {
            true
          }
          else if (searchBar.text == "Oirschot") {
            true
          }
          else if (searchBar.text == "oirschot") {
            true
          }
          else if (searchBar.text == "Brabant") {
            true
          }
          else if (searchBar.text == "brabant") {
            true
          }
          else if (searchBar.text == "Noord-Brabant") {
            true
          }
          else if (searchBar.text == "Noord-brabant") {
            true
          }
          else if (searchBar.text == "noord-brabant") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Ell"
        informatie: "Regio Weert"
        stationnummer: "8"
        visible: {
          if (searchBar.text == "Ell") {
            true
          }
          else if (searchBar.text == "ell") {
            true
          }
          else if (searchBar.text == "Weert") {
            true
          }
          else if (searchBar.text == "weert") {
            true
          }
          else if (searchBar.text == "Biest") {
            true
          }
          else if (searchBar.text == "biest") {
            true
          }
          else if (searchBar.text == "Kelpen-oler") {
            true
          }
          else if (searchBar.text == "Kelpen-Oler") {
            true
          }
          else if (searchBar.text == "kelpen-oler") {
            true
          }
          else if (searchBar.text == "Stramproy") {
            true
          }
          else if (searchBar.text == "stramproy") {
            true
          }
          else if (searchBar.text == "Grathem") {
            true
          }
          else if (searchBar.text == "grathem") {
            true
          }
          else if (searchBar.text == "Roermond") {
            true
          }
          else if (searchBar.text == "roermond") {
            true
          }
          else if (searchBar.text == "Herten") {
            true
          }
          else if (searchBar.text == "herten") {
            true
          }
          else if (searchBar.text == "Baexem") {
            true
          }
          else if (searchBar.text == "baexem") {
            true
          }
          else if (searchBar.text == "Nederweert") {
            true
          }
          else if (searchBar.text == "nederweert") {
            true
          }
          else if (searchBar.text == "Leveroy") {
            true
          }
          else if (searchBar.text == "leveroy") {
            true
          }
          else if (searchBar.text == "Ittervoort") {
            true
          }
          else if (searchBar.text == "ittervoort") {
            true
          }
          else if (searchBar.text == "Limburg") {
            true
          }
          else if (searchBar.text == "limburg") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Euro platform"
        informatie: "Regio Noordzee"
        stationnummer: "9"
        visible: {
          if (searchBar.text == "Euro platform") {
            true
          }
          else if (searchBar.text == "euro platform") {
            true
          }
          else if (searchBar.text == "Noordzee") {
            true
          }
          else if (searchBar.text == "noordzee") {
            true
          }
          else if (searchBar.text == "Noord") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "Zee") {
            true
          }
          else if (searchBar.text == "zee") {
            true
          }
          else if (searchBar.text == "Europlatform") {
            true
          }
          else if (searchBar.text == "Euro Platform") {
            true
          }
          else if (searchBar.text == "zeeplatform") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Gilze Rijen"
        informatie: "Regio Gilze Rijen"
        stationnummer: "10"
        visible: {
          if (searchBar.text == "Gilze Rijen") {
            true
          }
          else if (searchBar.text == "gilze Rijen") {
            true
          }
          else if (searchBar.text == "Gilze rijen") {
            true
          }
          else if (searchBar.text == "gilze rijen") {
            true
          }
          else if (searchBar.text == "Oosterhout") {
            true
          }
          else if (searchBar.text == "oosterhout") {
            true
          }
          else if (searchBar.text == "Breda") {
            true
          }
          else if (searchBar.text == "breda") {
            true
          }
          else if (searchBar.text == "Tilburg") {
            true
          }
          else if (searchBar.text == "tilburg") {
            true
          }
          else if (searchBar.text == "Rijen") {
            true
          }
          else if (searchBar.text == "rijen") {
            true
          }
          else if (searchBar.text == "Gilze") {
            true
          }
          else if (searchBar.text == "gilze") {
            true
          }
          else if (searchBar.text == "Waalwijk") {
            true
          }
          else if (searchBar.text == "waalwijk") {
            true
          }
          else if (searchBar.text == "Kaatsheuvel") {
            true
          }
          else if (searchBar.text == "kaatsheuvel") {
            true
          }
          else if (searchBar.text == "Bavel") {
            true
          }
          else if (searchBar.text == "bavel") {
            true
          }
          else if (searchBar.text == "Goirle") {
            true
          }
          else if (searchBar.text == "goirle") {
            true
          }
          else if (searchBar.text == "Alphen") {
            true
          }
          else if (searchBar.text == "alphen") {
            true
          }
          else if (searchBar.text == "Brabant") {
            true
          }
          else if (searchBar.text == "brabant") {
            true
          }
          else if (searchBar.text == "Noord-Brabant") {
            true
          }
          else if (searchBar.text == "Noord-brabant") {
            true
          }
          else if (searchBar.text == "noord-brabant") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Goes"
        informatie: "Regio Goes"
        stationnummer: "11"
        visible: {
          if (searchBar.text == "Goes") {
            true
          }
          else if (searchBar.text == "goes") {
            true
          }
          else if (searchBar.text == "Kapelle") {
            true
          }
          else if (searchBar.text == "kapelle") {
            true
          }
          else if (searchBar.text == "Sint-Maartensdijk") {
            true
          }
          else if (searchBar.text == "Sint-maartensdijk") {
            true
          }
          else if (searchBar.text == "sint-maartensdijk") {
            true
          }
          else if (searchBar.text == "Middelburg") {
            true
          }
          else if (searchBar.text == "middelburg") {
            true
          }
          else if (searchBar.text == "Heikenszand") {
            true
          }
          else if (searchBar.text == "heikenszand") {
            true
          }
          else if (searchBar.text == "Kortgene") {
            true
          }
          else if (searchBar.text == "kortgene") {
            true
          }
          else if (searchBar.text == "Wemeldinge") {
            true
          }
          else if (searchBar.text == "wemeldinge") {
            true
          }
          else if (searchBar.text == "Yerseke") {
            true
          }
          else if (searchBar.text == "yerseke") {
            true
          }
          else if (searchBar.text == "Bergen op zoom") {
            true
          }
          else if (searchBar.text == "Bergen op Zoom") {
            true
          }
          else if (searchBar.text == "bergen op zoom") {
            true
          }
          else if (searchBar.text == "Kruiningen") {
            true
          }
          else if (searchBar.text == "kruiningen") {
            true
          }
          else if (searchBar.text == "Zeeland") {
            true
          }
          else if (searchBar.text == "zeeland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Groenlo-Hupsel"
        informatie: "Regio Oost-Overijssel"
        stationnummer: "12"
        visible: {
          if (searchBar.text == "Groenlo-Hupsel") {
            true
          }
          else if (searchBar.text == "groenlo-hupsel") {
            true
          }
          else if (searchBar.text == "Groenlo-hupsel") {
            true
          }
          else if (searchBar.text == "groenlo") {
            true
          }
          else if (searchBar.text == "Groenlo") {
            true
          }
          else if (searchBar.text == "Hupsel") {
            true
          }
          else if (searchBar.text == "hupsel") {
            true
          }
          else if (searchBar.text == "Overijssel") {
            true
          }
          else if (searchBar.text == "overijssel") {
            true
          }
          else if (searchBar.text == "Oost-Overijssel") {
            true
          }
          else if (searchBar.text == "oost-Overijssel") {
            true
          }
          else if (searchBar.text == "Oost-overijssel") {
            true
          }
          else if (searchBar.text == "Oost") {
            true
          }
          else if (searchBar.text == "oost") {
            true
          }
          else if (searchBar.text == "Lichtenvoorde") {
            true
          }
          else if (searchBar.text == "lichtenvoorde") {
            true
          }
          else if (searchBar.text == "Eibergen") {
            true
          }
          else if (searchBar.text == "eibergen") {
            true
          }
          else if (searchBar.text == "Haaksbergen") {
            true
          }
          else if (searchBar.text == "haaksbergen") {
            true
          }
          else if (searchBar.text == "Ruurlo") {
            true
          }
          else if (searchBar.text == "ruurlo") {
            true
          }
          else if (searchBar.text == "Hengelo") {
            true
          }
          else if (searchBar.text == "hengelo") {
            true
          }
          else if (searchBar.text == "Winterswijk") {
            true
          }
          else if (searchBar.text == "winterswijk") {
            true
          }
          else if (searchBar.text == "Enschede") {
            true
          }
          else if (searchBar.text == "enschede") {
            true
          }
          else if (searchBar.text == "Goor") {
            true
          }
          else if (searchBar.text == "goor") {
            true
          }
          else if (searchBar.text == "Rekken") {
            true
          }
          else if (searchBar.text == "rekken") {
            true
          }
          else if (searchBar.text == "Doetinchem") {
            true
          }
          else if (searchBar.text == "doetinchem") {
            true
          }
          else if (searchBar.text == "Lochem") {
            true
          }
          else if (searchBar.text == "lochem") {
            true
          }
          else if (searchBar.text == "Varsseveld") {
            true
          }
          else if (searchBar.text == "varsseveld") {
            true
          }
          else if (searchBar.text == "Almelo") {
            true
          }
          else if (searchBar.text == "almelo") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Groningen"
        informatie: "Regio Groningen"
        stationnummer: "13"
        visible: {
          if (searchBar.text == "Groningen") {
            true
          }
          else if (searchBar.text == "groningen") {
            true
          }
          else if (searchBar.text == "Winsum") {
            true
          }
          else if (searchBar.text == "winsum") {
            true
          }
          else if (searchBar.text == "Bedum") {
            true
          }
          else if (searchBar.text == "bedum") {
            true
          }
          else if (searchBar.text == "Loppersum") {
            true
          }
          else if (searchBar.text == "loppersum") {
            true
          }
          else if (searchBar.text == "Grijpskerk") {
            true
          }
          else if (searchBar.text == "grijpskerk") {
            true
          }
          else if (searchBar.text == "Aduard") {
            true
          }
          else if (searchBar.text == "aduard") {
            true
          }
          else if (searchBar.text == "Zuidhorn") {
            true
          }
          else if (searchBar.text == "zuidhoorn") {
            true
          }
          else if (searchBar.text == "Siddeburen") {
            true
          }
          else if (searchBar.text == "siddeburen") {
            true
          }
          else if (searchBar.text == "Harkstede") {
            true
          }
          else if (searchBar.text == "harkstede") {
            true
          }
          else if (searchBar.text == "Slochteren") {
            true
          }
          else if (searchBar.text == "slochteren") {
            true
          }
          else if (searchBar.text == "Hoogezand") {
            true
          }
          else if (searchBar.text == "hoogezand") {
            true
          }
          else if (searchBar.text == "Haren") {
            true
          }
          else if (searchBar.text == "haren") {
            true
          }
          else if (searchBar.text == "Eelde") {
            true
          }
          else if (searchBar.text == "eelde") {
            true
          }
          else if (searchBar.text == "Roden") {
            true
          }
          else if (searchBar.text == "roden") {
            true
          }
          else if (searchBar.text == "Leek") {
            true
          }
          else if (searchBar.text == "leek") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Hansweert"
        informatie: "Regio Oost-Zeeland"
        stationnummer: "14"
        visible: {
          if (searchBar.text == "Hansweert") {
            true
          }
          else if (searchBar.text == "hansweert") {
            true
          }
          else if (searchBar.text == "Oost-Zeeland") {
            true
          }
          else if (searchBar.text == "oost-Zeeland") {
            true
          }
          else if (searchBar.text == "Oost-zeeland") {
            true
          }
          else if (searchBar.text == "oost-zeeland") {
            true
          }
          else if (searchBar.text == "zeeland") {
            true
          }
          else if (searchBar.text == "Zeeland") {
            true
          }
          else if (searchBar.text == "Middelburg") {
            true
          }
          else if (searchBar.text == "middelburg") {
            true
          }
          else if (searchBar.text == "Renesse") {
            true
          }
          else if (searchBar.text == "renesse") {
            true
          }
          else if (searchBar.text == "Westenschouwen") {
            true
          }
          else if (searchBar.text == "westenschouwen") {
            true
          }
          else if (searchBar.text == "Domburg") {
            true
          }
          else if (searchBar.text == "domburg") {
            true
          }
          else if (searchBar.text == "Westkapelle") {
            true
          }
          else if (searchBar.text == "westkapelle") {
            true
          }
          else if (searchBar.text == "Zoutelande") {
            true
          }
          else if (searchBar.text == "zoutelande") {
            true
          }
          else if (searchBar.text == "Vlissingen") {
            true
          }
          else if (searchBar.text == "vlissingen") {
            true
          }
          else if (searchBar.text == "Breskens") {
            true
          }
          else if (searchBar.text == "breskens") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Heino"
        informatie: "Regio Zwolle"
        stationnummer: "15"
        visible: {
          if (searchBar.text == "Heino") {
            true
          }
          else if (searchBar.text == "heino") {
            true
          }
          else if (searchBar.text == "Zwolle") {
            true
          }
          else if (searchBar.text == "zwolle") {
            true
          }
          else if (searchBar.text == "Kampen") {
            true
          }
          else if (searchBar.text == "kampen") {
            true
          }
          else if (searchBar.text == "Ommen") {
            true
          }
          else if (searchBar.text == "ommen") {
            true
          }
          else if (searchBar.text == "Meppel") {
            true
          }
          else if (searchBar.text == "meppel") {
            true
          }
          else if (searchBar.text == "Staphorst") {
            true
          }
          else if (searchBar.text == "staphorst") {
            true
          }
          else if (searchBar.text == "Hattem") {
            true
          }
          else if (searchBar.text == "hattem") {
            true
          }
          else if (searchBar.text == "Wezep") {
            true
          }
          else if (searchBar.text == "wezep") {
            true
          }
          else if (searchBar.text == "Dalfsen") {
            true
          }
          else if (searchBar.text == "dalfsen") {
            true
          }
          else if (searchBar.text == "Raalte") {
            true
          }
          else if (searchBar.text == "raalte") {
            true
          }
          else if (searchBar.text == "Wijhe") {
            true
          }
          else if (searchBar.text == "wijhe") {
            true
          }
          else if (searchBar.text == "Heeten") {
            true
          }
          else if (searchBar.text == "heeten") {
            true
          }
          else if (searchBar.text == "Elburg") {
            true
          }
          else if (searchBar.text == "elburg") {
            true
          }
          else if (searchBar.text == "Balkbrug") {
            true
          }
          else if (searchBar.text == "balkbrug") {
            true
          }
          else if (searchBar.text == "Hellendoorn") {
            true
          }
          else if (searchBar.text == "hellendoorn") {
            true
          }
          else if (searchBar.text == "Nieuwleusen") {
            true
          }
          else if (searchBar.text == "nieuwleusen") {
            true
          }
          else if (searchBar.text == "Epe") {
            true
          }
          else if (searchBar.text == "epe") {
            true
          }
          else if (searchBar.text == "Nunspeet") {
            true
          }
          else if (searchBar.text == "nunspeet") {
            true
          }
          else if (searchBar.text == "Harderwijk") {
            true
          }
          else if (searchBar.text == "harderwijk") {
            true
          }
          else if (searchBar.text == "Hasselt") {
            true
          }
          else if (searchBar.text == "hasselt") {
            true
          }
          else if (searchBar.text == "Overijssel") {
            true
          }
          else if (searchBar.text == "overijssel") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Herwijnen"
        informatie: "Regio Gorinchem"
        stationnummer: "16"
        visible: {
          if (searchBar.text == "Herwijnen") {
            true
          }
          else if (searchBar.text == "herwijnen") {
            true
          }
          else if (searchBar.text == "Gorinchem") {
            true
          }
          else if (searchBar.text == "gorinchem") {
            true
          }
          else if (searchBar.text == "Dordrecht") {
            true
          }
          else if (searchBar.text == "dordrecht") {
            true
          }
          else if (searchBar.text == "'s-Hertogenbosch") {
            true
          }
          else if (searchBar.text == "'s-hertogenbosch") {
            true
          }
          else if (searchBar.text == "Den Bosch") {
            true
          }
          else if (searchBar.text == "Den bosch") {
            true
          }
          else if (searchBar.text == "den bosch") {
            true
          }
          else if (searchBar.text == "Den") {
            true
          }
          else if (searchBar.text == "den") {
            true
          }
          else if (searchBar.text == "Den ") {
            true
          }
          else if (searchBar.text == "den ") {
            true
          }
          else if (searchBar.text == "Vuren") {
            true
          }
          else if (searchBar.text == "vuren") {
            true
          }
          else if (searchBar.text == "Werkendam") {
            true
          }
          else if (searchBar.text == "werkendam") {
            true
          }
          else if (searchBar.text == "Leerdam") {
            true
          }
          else if (searchBar.text == "leerdam") {
            true
          }
          else if (searchBar.text == "Asperen") {
            true
          }
          else if (searchBar.text == "asperen") {
            true
          }
          else if (searchBar.text == "Meerkerk") {
            true
          }
          else if (searchBar.text == "meerkerk") {
            true
          }
          else if (searchBar.text == "Schoonhoven") {
            true
          }
          else if (searchBar.text == "schoonhoven") {
            true
          }
          else if (searchBar.text == "Waardenburg") {
            true
          }
          else if (searchBar.text == "waardenburg") {
            true
          }
          else if (searchBar.text == "Zaltbommel") {
            true
          }
          else if (searchBar.text == "zaltbommel") {
            true
          }
          else if (searchBar.text == "Beesd") {
            true
          }
          else if (searchBar.text == "beesd") {
            true
          }
          else if (searchBar.text == "Geldermalsen") {
            true
          }
          else if (searchBar.text == "geldermalsen") {
            true
          }
          else if (searchBar.text == "Waalwijk") {
            true
          }
          else if (searchBar.text == "waalwijk") {
            true
          }
          else if (searchBar.text == "Drunen") {
            true
          }
          else if (searchBar.text == "drunen") {
            true
          }
          else if (searchBar.text == "De Biesbosch") {
            true
          }
          else if (searchBar.text == "de Biesbosch") {
            true
          }
          else if (searchBar.text == "De biesbosch") {
            true
          }
          else if (searchBar.text == "de biesbosch") {
            true
          }
          else if (searchBar.text == "Noordeloos") {
            true
          }
          else if (searchBar.text == "noordeloos") {
            true
          }
          else if (searchBar.text == "Woudrichem") {
            true
          }
          else if (searchBar.text == "woudrichem") {
            true
          }
          else if (searchBar.text == "Zuid-Holland") {
            true
          }
          else if (searchBar.text == "Zuid-holland") {
            true
          }
          else if (searchBar.text == "zuid-holland") {
            true
          }
          else if (searchBar.text == "zuid") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Hoek van Holland"
        informatie: "Regio Hoek van Holland"
        stationnummer: "17"
        visible: {
          if (searchBar.text == "Hoek van Holland") {
            true
          }
          else if (searchBar.text == "hoek van Holland") {
            true
          }
          else if (searchBar.text == "hoek van holland") {
            true
          }
          else if (searchBar.text == "Hoek van holland") {
            true
          }
          else if (searchBar.text == "holland") {
            true
          }
          else if (searchBar.text == "Holland") {
            true
          }
          else if (searchBar.text == "'s-Gravenzande") {
            true
          }
          else if (searchBar.text == "'s-gravenzande") {
            true
          }
          else if (searchBar.text == "Heenweg") {
            true
          }
          else if (searchBar.text == "heenweg") {
            true
          }
          else if (searchBar.text == "Maasdijk") {
            true
          }
          else if (searchBar.text == "maasdijk") {
            true
          }
          else if (searchBar.text == "Europoort") {
            true
          }
          else if (searchBar.text == "europoort") {
            true
          }
          else if (searchBar.text == "Rotterdam") {
            true
          }
          else if (searchBar.text == "rotterdam") {
            true
          }
          else if (searchBar.text == "Den Haag") {
            true
          }
          else if (searchBar.text == "Den haag") {
            true
          }
          else if (searchBar.text == "den Haag") {
            true
          }
          else if (searchBar.text == "den haag") {
            true
          }
          else if (searchBar.text == "Den") {
            true
          }
          else if (searchBar.text == "den") {
            true
          }
          else if (searchBar.text == "Den ") {
            true
          }
          else if (searchBar.text == "den ") {
            true
          }
          else if (searchBar.text == "'s-Gravenhage") {
            true
          }
          else if (searchBar.text == "'s-gravenhage") {
            true
          }
          else if (searchBar.text == "Naaldwijk") {
            true
          }
          else if (searchBar.text == "naaldwijk") {
            true
          }
          else if (searchBar.text == "Monster") {
            true
          }
          else if (searchBar.text == "monster") {
            true
          }
          else if (searchBar.text == "Poeldijk") {
            true
          }
          else if (searchBar.text == "poeldijk") {
            true
          }
          else if (searchBar.text == "Honselersdijk") {
            true
          }
          else if (searchBar.text == "honselersdijk") {
            true
          }
          else if (searchBar.text == "Maasland") {
            true
          }
          else if (searchBar.text == "maasland") {
            true
          }
          else if (searchBar.text == "Maassluis") {
            true
          }
          else if (searchBar.text == "maassluis") {
            true
          }
          else if (searchBar.text == "Brielle") {
            true
          }
          else if (searchBar.text == "brielle") {
            true
          }
          else if (searchBar.text == "Vlaardingen") {
            true
          }
          else if (searchBar.text == "vlaardingen") {
            true
          }
          else if (searchBar.text == "Rozenburg") {
            true
          }
          else if (searchBar.text == "rozenburg") {
            true
          }
          else if (searchBar.text == "Den Hoorn") {
            true
          }
          else if (searchBar.text == "Den hoorn") {
            true
          }
          else if (searchBar.text == "den hoorn") {
            true
          }
          else if (searchBar.text == "den Hoorn") {
            true
          }
          else if (searchBar.text == "Schiedam") {
            true
          }
          else if (searchBar.text == "schiedam") {
            true
          }
          else if (searchBar.text == "Schipluiden") {
            true
          }
          else if (searchBar.text == "schipluiden") {
            true
          }
          else if (searchBar.text == "Maasvlakte") {
            true
          }
          else if (searchBar.text == "maasvlakte") {
            true
          }
          else if (searchBar.text == "Hellevoetsluis") {
            true
          }
          else if (searchBar.text == "hellevoetsluis") {
            true
          }
          else if (searchBar.text == "Oostvoorne") {
            true
          }
          else if (searchBar.text == "oostvoorne") {
            true
          }
          else if (searchBar.text == "Heenvliet") {
            true
          }
          else if (searchBar.text == "heenvliet") {
            true
          }
          else if (searchBar.text == "Spijkenisse") {
            true
          }
          else if (searchBar.text == "spijkenisse") {
            true
          }
          else if (searchBar.text == "Zuid-Holland") {
            true
          }
          else if (searchBar.text == "Zuid-holland") {
            true
          }
          else if (searchBar.text == "zuid-holland") {
            true
          }
          else if (searchBar.text == "zuid") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Hoogeveen"
        informatie: "Regio Hoogeveen"
        stationnummer: "18"
        visible: {
          if (searchBar.text == "Hoogeveen") {
            true
          }
          else if (searchBar.text == "hoogeveen") {
            true
          }
          else if (searchBar.text == "Echten") {
            true
          }
          else if (searchBar.text == "echten") {
            true
          }
          else if (searchBar.text == "Hollandscheveld") {
            true
          }
          else if (searchBar.text == "hollandscheveld") {
            true
          }
          else if (searchBar.text == "Zuidwolde") {
            true
          }
          else if (searchBar.text == "zuidwolde") {
            true
          }
          else if (searchBar.text == "Pesse") {
            true
          }
          else if (searchBar.text == "pesse") {
            true
          }
          else if (searchBar.text == "Ruinen") {
            true
          }
          else if (searchBar.text == "ruinen") {
            true
          }
          else if (searchBar.text == "Meppel") {
            true
          }
          else if (searchBar.text == "meppel") {
            true
          }
          else if (searchBar.text == "Slagharen") {
            true
          }
          else if (searchBar.text == "slagharen") {
            true
          }
          else if (searchBar.text == "Balkbrug") {
            true
          }
          else if (searchBar.text == "balkbrug") {
            true
          }
          else if (searchBar.text == "Dedemsvaart") {
            true
          }
          else if (searchBar.text == "dedemsvaart") {
            true
          }
          else if (searchBar.text == "Staphorst") {
            true
          }
          else if (searchBar.text == "staphorst") {
            true
          }
          else if (searchBar.text == "Dalen") {
            true
          }
          else if (searchBar.text == "dalen") {
            true
          }
          else if (searchBar.text == "Coevorden") {
            true
          }
          else if (searchBar.text == "coevorden") {
            true
          }
          else if (searchBar.text == "Aalden") {
            true
          }
          else if (searchBar.text == "aalden") {
            true
          }
          else if (searchBar.text == "Emmen") {
            true
          }
          else if (searchBar.text == "emmen") {
            true
          }
          else if (searchBar.text == "Westerbork") {
            true
          }
          else if (searchBar.text == "westerbork") {
            true
          }
          else if (searchBar.text == "Orvelte") {
            true
          }
          else if (searchBar.text == "orvelte") {
            true
          }
          else if (searchBar.text == "Beilen") {
            true
          }
          else if (searchBar.text == "beilen") {
            true
          }
          else if (searchBar.text == "Dwingeloo") {
            true
          }
          else if (searchBar.text == "dwingeloo") {
            true
          }
          else if (searchBar.text == "De Wijk") {
            true
          }
          else if (searchBar.text == "de wijk") {
            true
          }
          else if (searchBar.text == "De wijk") {
            true
          }
          else if (searchBar.text == "Lutten") {
            true
          }
          else if (searchBar.text == "lutten") {
            true
          }
          else if (searchBar.text == "Hardenberg") {
            true
          }
          else if (searchBar.text == "hardenberg") {
            true
          }
          else if (searchBar.text == "Gramsbergen") {
            true
          }
          else if (searchBar.text == "gramsbergen") {
            true
          }
          else if (searchBar.text == "Drenthe") {
            true
          }
          else if (searchBar.text == "drenthe") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Hoorn Terschelling"
        informatie: "Regio Wadden"
        stationnummer: "19"
        visible: {
          if (searchBar.text == "Hoorn Terschelling") {
            true
          }
          else if (searchBar.text == "Hoorn Terschelling") {
            true
          }
          else if (searchBar.text == "hoorn Terschelling") {
            true
          }
          else if (searchBar.text == "hoorn terschelling") {
            true
          }
          else if (searchBar.text == "Hoorn") {
            true
          }
          else if (searchBar.text == "hoorn") {
            true
          }
          else if (searchBar.text == "Terschelling") {
            true
          }
          else if (searchBar.text == "terschelling") {
            true
          }
          else if (searchBar.text == "wadden") {
            true
          }
          else if (searchBar.text == "Wadden") {
            true
          }
          else if (searchBar.text == "Vlieland") {
            true
          }
          else if (searchBar.text == "vlieland") {
            true
          }
          else if (searchBar.text == "Ameland") {
            true
          }
          else if (searchBar.text == "ameland") {
            true
          }
          else if (searchBar.text == "Harlingen") {
            true
          }
          else if (searchBar.text == "harlingen") {
            true
          }
          else if (searchBar.text == "Friesland") {
            true
          }
          else if (searchBar.text == "friesland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Houtribdijk"
        informatie: "Regio Enkhuizen-Lelystad"
        stationnummer: "20"
        visible: {
          if (searchBar.text == "Houtribdijk") {
            true
          }
          else if (searchBar.text == "houtribdijk") {
            true
          }
          else if (searchBar.text == "enkhuizen") {
            true
          }
          else if (searchBar.text == "Enkhuizen") {
            true
          }
          else if (searchBar.text == "lelystad") {
            true
          }
          else if (searchBar.text == "Lelystad") {
            true
          }
          else if (searchBar.text == "Enkhuizen") {
            true
          }
          else if (searchBar.text == "enkhuizen") {
            true
          }
          else if (searchBar.text == "Andijk") {
            true
          }
          else if (searchBar.text == "andijk") {
            true
          }
          else if (searchBar.text == "Medemblik") {
            true
          }
          else if (searchBar.text == "medemblik") {
            true
          }
          else if (searchBar.text == "Noordersluis") {
            true
          }
          else if (searchBar.text == "noordersluis") {
            true
          }
          else if (searchBar.text == "Waterwijk") {
            true
          }
          else if (searchBar.text == "waterwijk") {
            true
          }
          else if (searchBar.text == "Urk") {
            true
          }
          else if (searchBar.text == "urk") {
            true
          }
          else if (searchBar.text == "Emmeloord") {
            true
          }
          else if (searchBar.text == "emmeloord") {
            true
          }
          else if (searchBar.text == "Espel") {
            true
          }
          else if (searchBar.text == "espel") {
            true
          }
          else if (searchBar.text == "Tollebeek") {
            true
          }
          else if (searchBar.text == "tollebeek") {
            true
          }
          else if (searchBar.text == "Nagele") {
            true
          }
          else if (searchBar.text == "nagele") {
            true
          }
          else if (searchBar.text == "Schokland") {
            true
          }
          else if (searchBar.text == "schokland") {
            true
          }
          else if (searchBar.text == "Creil") {
            true
          }
          else if (searchBar.text == "creil") {
            true
          }
          else if (searchBar.text == "Bant") {
            true
          }
          else if (searchBar.text == "bant") {
            true
          }
          else if (searchBar.text == "Rutten") {
            true
          }
          else if (searchBar.text == "rutten") {
            true
          }
          else if (searchBar.text == "Swifterbant") {
            true
          }
          else if (searchBar.text == "swifterbant") {
            true
          }
          else if (searchBar.text == "Dronten") {
            true
          }
          else if (searchBar.text == "dronten") {
            true
          }
          else if (searchBar.text == "Landmaten") {
            true
          }
          else if (searchBar.text == "landmaten") {
            true
          }
          else if (searchBar.text == "Biddinghuizen") {
            true
          }
          else if (searchBar.text == "biddinghuizen") {
            true
          }
          else if (searchBar.text == "Almere") {
            true
          }
          else if (searchBar.text == "almere") {
            true
          }
          else if (searchBar.text == "IJsselmeer") {
            true
          }
          else if (searchBar.text == "Ijsselmeer") {
            true
          }
          else if (searchBar.text == "ijsselmeer") {
            true
          }
          else if (searchBar.text == "Markermeer") {
            true
          }
          else if (searchBar.text == "markermeer") {
            true
          }
          else if (searchBar.text == "Bovenkarspel") {
            true
          }
          else if (searchBar.text == "bovenkarspel") {
            true
          }
          else if (searchBar.text == "Oosterdijk") {
            true
          }
          else if (searchBar.text == "oosterdijk") {
            true
          }
          else if (searchBar.text == "Hoogkarspel") {
            true
          }
          else if (searchBar.text == "hoogkarspel") {
            true
          }
          else if (searchBar.text == "Hoorn") {
            true
          }
          else if (searchBar.text == "hoorn") {
            true
          }
          else if (searchBar.text == "Venhuizen") {
            true
          }
          else if (searchBar.text == "venhuizen") {
            true
          }
          else if (searchBar.text == "Oosterleek") {
            true
          }
          else if (searchBar.text == "oosterleek") {
            true
          }
          else if (searchBar.text == "Hem") {
            true
          }
          else if (searchBar.text == "hem") {
            true
          }
          else if (searchBar.text == "Oosterblokker") {
            true
          }
          else if (searchBar.text == "oosterblokker") {
            true
          }
          else if (searchBar.text == "Zwaagdijk") {
            true
          }
          else if (searchBar.text == "zwaagdijk") {
            true
          }
          else if (searchBar.text == "Wevershoof") {
            true
          }
          else if (searchBar.text == "wevershoof") {
            true
          }
          else if (searchBar.text == "Zwaag") {
            true
          }
          else if (searchBar.text == "zwaag") {
            true
          }
          else if (searchBar.text == "Opperdoes") {
            true
          }
          else if (searchBar.text == "opperdoes") {
            true
          }
          else if (searchBar.text == "Kraaienburg") {
            true
          }
          else if (searchBar.text == "kraaienburg") {
            true
          }
          else if (searchBar.text == "Flevoland") {
            true
          }
          else if (searchBar.text == "flevoland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Huibertgat"
        informatie: "Regio Schiermonnikoog"
        stationnummer: "21"
        visible: {
          if (searchBar.text == "Huibertgat") {
            true
          }
          else if (searchBar.text == "huibertgat") {
            true
          }
          else if (searchBar.text == "Schiermonnikoog") {
            true
          }
          else if (searchBar.text == "schiermonnikoog") {
            true
          }
          else if (searchBar.text == "Ameland") {
            true
          }
          else if (searchBar.text == "ameland") {
            true
          }
          else if (searchBar.text == "Friesland") {
            true
          }
          else if (searchBar.text == "friesland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "IJmond"
        informatie: "Regio IJmond"
        stationnummer: "22"
        visible: {
          if (searchBar.text == "IJmond") {
            true
          }
          else if (searchBar.text == "Ijmond") {
            true
          }
          else if (searchBar.text == "ijmond") {
            true
          }
          else if (searchBar.text == "IJmuiden") {
            true
          }
          else if (searchBar.text == "Ijmuiden") {
            true
          }
          else if (searchBar.text == "ijmuiden") {
            true
          }
          else if (searchBar.text == "Castricum") {
            true
          }
          else if (searchBar.text == "castricum") {
            true
          }
          else if (searchBar.text == "Uitgeest") {
            true
          }
          else if (searchBar.text == "uitgeest") {
            true
          }
          else if (searchBar.text == "Zaandam") {
            true
          }
          else if (searchBar.text == "zaandam") {
            true
          }
          else if (searchBar.text == "Zaandijk") {
            true
          }
          else if (searchBar.text == "zaandijk") {
            true
          }
          else if (searchBar.text == "Wormerveer") {
            true
          }
          else if (searchBar.text == "wormerveer") {
            true
          }
          else if (searchBar.text == "Beverwijk") {
            true
          }
          else if (searchBar.text == "beverwijk") {
            true
          }
          else if (searchBar.text == "Heemskerk") {
            true
          }
          else if (searchBar.text == "heemskerk") {
            true
          }
          else if (searchBar.text == "Wijk aan zee") {
            true
          }
          else if (searchBar.text == "wijk aan zee") {
            true
          }
          else if (searchBar.text == "Wijk aan Zee") {
            true
          }
          else if (searchBar.text == "Bloemendaal") {
            true
          }
          else if (searchBar.text == "bloemendaal") {
            true
          }
          else if (searchBar.text == "Haarlem") {
            true
          }
          else if (searchBar.text == "haarlem") {
            true
          }
          else if (searchBar.text == "Spaarndam") {
            true
          }
          else if (searchBar.text == "spaarndam") {
            true
          }
          else if (searchBar.text == "Zandvoort") {
            true
          }
          else if (searchBar.text == "zandvoort") {
            true
          }
          else if (searchBar.text == "Velsen") {
            true
          }
          else if (searchBar.text == "velsen") {
            true
          }
          else if (searchBar.text == "Santpoort") {
            true
          }
          else if (searchBar.text == "santpoort") {
            true
          }
          else if (searchBar.text == "Zwanenburg") {
            true
          }
          else if (searchBar.text == "zwanenburg") {
            true
          }
          else if (searchBar.text == "Heemstede") {
            true
          }
          else if (searchBar.text == "heemstede") {
            true
          }
          else if (searchBar.text == "Noord-Holland") {
            true
          }
          else if (searchBar.text == "Noord-holland") {
            true
          }
          else if (searchBar.text == "noord-holland") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "IJmuiden"
        informatie: "Regio IJmuiden"
        stationnummer: "23"
        visible: {
          if (searchBar.text == "IJmuiden") {
            true
          }
          else if (searchBar.text == "Ijmuiden") {
            true
          }
          else if (searchBar.text == "ijmuiden") {
            true
          }
          else if (searchBar.text == "Castricum") {
            true
          }
          else if (searchBar.text == "castricum") {
            true
          }
          else if (searchBar.text == "Uitgeest") {
            true
          }
          else if (searchBar.text == "uitgeest") {
            true
          }
          else if (searchBar.text == "Zaandam") {
            true
          }
          else if (searchBar.text == "zaandam") {
            true
          }
          else if (searchBar.text == "Zaandijk") {
            true
          }
          else if (searchBar.text == "zaandijk") {
            true
          }
          else if (searchBar.text == "Wormerveer") {
            true
          }
          else if (searchBar.text == "wormerveer") {
            true
          }
          else if (searchBar.text == "Beverwijk") {
            true
          }
          else if (searchBar.text == "beverwijk") {
            true
          }
          else if (searchBar.text == "Heemskerk") {
            true
          }
          else if (searchBar.text == "heemskerk") {
            true
          }
          else if (searchBar.text == "Wijk aan zee") {
            true
          }
          else if (searchBar.text == "wijk aan zee") {
            true
          }
          else if (searchBar.text == "Wijk aan Zee") {
            true
          }
          else if (searchBar.text == "Bloemendaal") {
            true
          }
          else if (searchBar.text == "bloemendaal") {
            true
          }
          else if (searchBar.text == "Haarlem") {
            true
          }
          else if (searchBar.text == "haarlem") {
            true
          }
          else if (searchBar.text == "Spaarndam") {
            true
          }
          else if (searchBar.text == "spaarndam") {
            true
          }
          else if (searchBar.text == "Zandvoort") {
            true
          }
          else if (searchBar.text == "zandvoort") {
            true
          }
          else if (searchBar.text == "Velsen") {
            true
          }
          else if (searchBar.text == "velsen") {
            true
          }
          else if (searchBar.text == "Santpoort") {
            true
          }
          else if (searchBar.text == "santpoort") {
            true
          }
          else if (searchBar.text == "Zwanenburg") {
            true
          }
          else if (searchBar.text == "zwanenburg") {
            true
          }
          else if (searchBar.text == "Heemstede") {
            true
          }
          else if (searchBar.text == "heemstede") {
            true
          }
          else if (searchBar.text == "Noord-Holland") {
            true
          }
          else if (searchBar.text == "Noord-holland") {
            true
          }
          else if (searchBar.text == "noord-holland") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Lauwersoog"
        informatie: "Regio Noord-Groningen"
        stationnummer: "24"
        visible: {
          if (searchBar.text == "Lauwersoog") {
            true
          }
          else if (searchBar.text == "lauwersoog") {
            true
          }
          else if (searchBar.text == "noord-groningen") {
            true
          }
          else if (searchBar.text == "Noord-groningen") {
            true
          }
          else if (searchBar.text == "Noord-Groningen") {
            true
          }
          else if (searchBar.text == "Groningen") {
            true
          }
          else if (searchBar.text == "groningen") {
            true
          }
          else if (searchBar.text == "Noord") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "Vierhuizen") {
            true
          }
          else if (searchBar.text == "vierhuizen") {
            true
          }
          else if (searchBar.text == "Anjum") {
            true
          }
          else if (searchBar.text == "anjum") {
            true
          }
          else if (searchBar.text == "Zoutkamp") {
            true
          }
          else if (searchBar.text == "zoutkamp") {
            true
          }
          else if (searchBar.text == "Engwierum") {
            true
          }
          else if (searchBar.text == "engwierum") {
            true
          }
          else if (searchBar.text == "Kollum") {
            true
          }
          else if (searchBar.text == "kollum") {
            true
          }
          else if (searchBar.text == "Moddergat") {
            true
          }
          else if (searchBar.text == "moddergat") {
            true
          }
          else if (searchBar.text == "Wierum") {
            true
          }
          else if (searchBar.text == "wierum") {
            true
          }
          else if (searchBar.text == "Nes") {
            true
          }
          else if (searchBar.text == "nes") {
            true
          }
          else if (searchBar.text == "Lioessens") {
            true
          }
          else if (searchBar.text == "lioessens") {
            true
          }
          else if (searchBar.text == "Morra") {
            true
          }
          else if (searchBar.text == "morra") {
            true
          }
          else if (searchBar.text == "Oosternijkerk") {
            true
          }
          else if (searchBar.text == "oosternijkerk") {
            true
          }
          else if (searchBar.text == "Hantumhuizen") {
            true
          }
          else if (searchBar.text == "hantumhuizen") {
            true
          }
          else if (searchBar.text == "Ee") {
            true
          }
          else if (searchBar.text == "ee") {
            true
          }
          else if (searchBar.text == "Lauwerzijl") {
            true
          }
          else if (searchBar.text == "lauwerzijl") {
            true
          }
          else if (searchBar.text == "Ulrum") {
            true
          }
          else if (searchBar.text == "ulrum") {
            true
          }
          else if (searchBar.text == "Niekerk") {
            true
          }
          else if (searchBar.text == "niekerk") {
            true
          }
          else if (searchBar.text == "Leens") {
            true
          }
          else if (searchBar.text == "leens") {
            true
          }
          else if (searchBar.text == "Schiermonnikoog") {
            true
          }
          else if (searchBar.text == "schiermonnikoog") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      /*/Weerstation {
        naam: "LE Goeree"
        informatie: "Regio Goeree"
        stationnummer: "25"
        visible: {
          if (searchBar.text == "LE Goeree") {
            true
          }
          else if (searchBar.text == "LE goeree") {
            true
          }
          else if (searchBar.text == "le goeree") {
            true
          }
          else if (searchBar.text == "le Goeree") {
            true
          }
          else if (searchBar.text == "goeree") {
            true
          }
          else if (searchBar.text == "Goeree") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }/*/

      Weerstation {
        naam: "Leeuwarden"
        informatie: "Regio Leeuwarden"
        stationnummer: "26"
        visible: {
          if (searchBar.text == "Leeuwarden") {
            true
          }
          else if (searchBar.text == "leeuwarden") {
            true
          }
          else if (searchBar.text == "Stiens") {
            true
          }
          else if (searchBar.text == "stiens") {
            true
          }
          else if (searchBar.text == "Burgum") {
            true
          }
          else if (searchBar.text == "burgum") {
            true
          }
          else if (searchBar.text == "Franeker") {
            true
          }
          else if (searchBar.text == "franeker") {
            true
          }
          else if (searchBar.text == "Harlingen") {
            true
          }
          else if (searchBar.text == "harlingen") {
            true
          }
          else if (searchBar.text == "Sneek") {
            true
          }
          else if (searchBar.text == "sneek") {
            true
          }
          else if (searchBar.text == "Drachten") {
            true
          }
          else if (searchBar.text == "drachten") {
            true
          }
          else if (searchBar.text == "Snakkerburen") {
            true
          }
          else if (searchBar.text == "snakkerburen") {
            true
          }
          else if (searchBar.text == "Lekkum") {
            true
          }
          else if (searchBar.text == "lekkum") {
            true
          }
          else if (searchBar.text == "Marsum") {
            true
          }
          else if (searchBar.text == "marsum") {
            true
          }
          else if (searchBar.text == "Goutum") {
            true
          }
          else if (searchBar.text == "goutum") {
            true
          }
          else if (searchBar.text == "Wirdum") {
            true
          }
          else if (searchBar.text == "wirdum") {
            true
          }
          else if (searchBar.text == "Boksum") {
            true
          }
          else if (searchBar.text == "boksum") {
            true
          }
          else if (searchBar.text == "Hempens") {
            true
          }
          else if (searchBar.text == "hempens") {
            true
          }
          else if (searchBar.text == "Deinum") {
            true
          }
          else if (searchBar.text == "deinum") {
            true
          }
          else if (searchBar.text == "Blessum") {
            true
          }
          else if (searchBar.text == "blessum") {
            true
          }
          else if (searchBar.text == "Grou") {
            true
          }
          else if (searchBar.text == "grou") {
            true
          }
          else if (searchBar.text == "Jelsum") {
            true
          }
          else if (searchBar.text == "jelsum") {
            true
          }
          else if (searchBar.text == "Bitgummole") {
            true
          }
          else if (searchBar.text == "bitgummole") {
            true
          }
          else if (searchBar.text == "Ingelum") {
            true
          }
          else if (searchBar.text == "ingelum") {
            true
          }
          else if (searchBar.text == "Wergea") {
            true
          }
          else if (searchBar.text == "wergea") {
            true
          }
          else if (searchBar.text == "Koarnjum") {
            true
          }
          else if (searchBar.text == "koarnjum") {
            true
          }
          else if (searchBar.text == "Jellum") {
            true
          }
          else if (searchBar.text == "jellum") {
            true
          }
          else if (searchBar.text == "Akkrum") {
            true
          }
          else if (searchBar.text == "akkrum") {
            true
          }
          else if (searchBar.text == "Nes") {
            true
          }
          else if (searchBar.text == "nes") {
            true
          }
          else if (searchBar.text == "Burgum") {
            true
          }
          else if (searchBar.text == "burgum") {
            true
          }
          else if (searchBar.text == "Joure") {
            true
          }
          else if (searchBar.text == "joure") {
            true
          }
          else if (searchBar.text == "Heerenveen") {
            true
          }
          else if (searchBar.text == "heerenveen") {
            true
          }
          else if (searchBar.text == "Gorredijk") {
            true
          }
          else if (searchBar.text == "gorredijk") {
            true
          }
          else if (searchBar.text == "Dokkum") {
            true
          }
          else if (searchBar.text == "dokkum") {
            true
          }
          else if (searchBar.text == "Friesland") {
            true
          }
          else if (searchBar.text == "friesland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Lelystad"
        informatie: "Regio Lelystad"
        stationnummer: "27"
        visible: {
          if (searchBar.text == "Lelystad") {
            true
          }
          else if (searchBar.text == "lelystad") {
            true
          }
          else if (searchBar.text == "Almere") {
            true
          }
          else if (searchBar.text == "almere") {
            true
          }
          else if (searchBar.text == "IJsselmeer") {
            true
          }
          else if (searchBar.text == "Ijsselmeer") {
            true
          }
          else if (searchBar.text == "ijsselmeer") {
            true
          }
          else if (searchBar.text == "Markermeer") {
            true
          }
          else if (searchBar.text == "markermeer") {
            true
          }
          else if (searchBar.text == "Dronten") {
            true
          }
          else if (searchBar.text == "dronten") {
            true
          }
          else if (searchBar.text == "Urk") {
            true
          }
          else if (searchBar.text == "urk") {
            true
          }
          else if (searchBar.text == "Emmeloord") {
            true
          }
          else if (searchBar.text == "emmeloord") {
            true
          }
          else if (searchBar.text == "Swifterbant") {
            true
          }
          else if (searchBar.text == "swifterbant") {
            true
          }
          else if (searchBar.text == "Biddinghuizen") {
            true
          }
          else if (searchBar.text == "biddinghuizen") {
            true
          }
          else if (searchBar.text == "Trekkersveld") {
            true
          }
          else if (searchBar.text == "trekkersveld") {
            true
          }
          else if (searchBar.text == "Zeewolde") {
            true
          }
          else if (searchBar.text == "zeewolde") {
            true
          }
          else if (searchBar.text == "Emmeloord") {
            true
          }
          else if (searchBar.text == "emmeloord") {
            true
          }
          else if (searchBar.text == "Flevoland") {
            true
          }
          else if (searchBar.text == "flevoland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Lopik-Cabauw"
        informatie: "Regio West-Utrecht"
        stationnummer: "28"
        visible: {
          if (searchBar.text == "Lopik-Cabauw") {
            true
          }
          else if (searchBar.text == "lopik-Cabauw") {
            true
          }
          else if (searchBar.text == "Lopik-cabauw") {
            true
          }
          else if (searchBar.text == "lopik-cabauw") {
            true
          }
          else if (searchBar.text == "Lopik") {
            true
          }
          else if (searchBar.text == "lopik") {
            true
          }
          else if (searchBar.text == "cabauw") {
            true
          }
          else if (searchBar.text == "Cabauw") {
            true
          }
          else if (searchBar.text == "West-Utrecht") {
            true
          }
          else if (searchBar.text == "west-utrecht") {
            true
          }
          else if (searchBar.text == "West-utrecht") {
            true
          }
          else if (searchBar.text == "Utrecht") {
            true
          }
          else if (searchBar.text == "utrecht") {
            true
          }
          else if (searchBar.text == "West") {
            true
          }
          else if (searchBar.text == "west") {
            true
          }
          else if (searchBar.text == "IJsselstein") {
            true
          }
          else if (searchBar.text == "Ijsselstein") {
            true
          }
          else if (searchBar.text == "ijsselstein") {
            true
          }
          else if (searchBar.text == "Nieuwegein") {
            true
          }
          else if (searchBar.text == "nieuwegein") {
            true
          }
          else if (searchBar.text == "Vianen") {
            true
          }
          else if (searchBar.text == "vianen") {
            true
          }
          else if (searchBar.text == "Woerden") {
            true
          }
          else if (searchBar.text == "woerden") {
            true
          }
          else if (searchBar.text == "Bodegraven") {
            true
          }
          else if (searchBar.text == "bodegraven") {
            true
          }
          else if (searchBar.text == "Gouda") {
            true
          }
          else if (searchBar.text == "gouda") {
            true
          }
          else if (searchBar.text == "Schoonhoven") {
            true
          }
          else if (searchBar.text == "schoonhoven") {
            true
          }
          else if (searchBar.text == "Vleuten") {
            true
          }
          else if (searchBar.text == "vleuten") {
            true
          }
          else if (searchBar.text == "Houten") {
            true
          }
          else if (searchBar.text == "houten") {
            true
          }
          else if (searchBar.text == "Leerdam") {
            true
          }
          else if (searchBar.text == "leerdam") {
            true
          }
          else if (searchBar.text == "Gorinchem") {
            true
          }
          else if (searchBar.text == "gorinchem") {
            true
          }
          else if (searchBar.text == "Benschop") {
            true
          }
          else if (searchBar.text == "benschop") {
            true
          }
          else if (searchBar.text == "Lexmond") {
            true
          }
          else if (searchBar.text == "lexmond") {
            true
          }
          else if (searchBar.text == "Montfoort") {
            true
          }
          else if (searchBar.text == "montfoort") {
            true
          }
          else if (searchBar.text == "Oudewater") {
            true
          }
          else if (searchBar.text == "oudewater") {
            true
          }
          else if (searchBar.text == "Linschoten") {
            true
          }
          else if (searchBar.text == "linschoten") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Maastricht"
        informatie: "Regio Maastricht"
        stationnummer: "29"
        visible: {
          if (searchBar.text == "Maastricht") {
            true
          }
          else if (searchBar.text == "maastricht") {
            true
          }
          else if (searchBar.text == "Valkenburg") {
            true
          }
          else if (searchBar.text == "valkenburg") {
            true
          }
          else if (searchBar.text == "Eijsden") {
            true
          }
          else if (searchBar.text == "eijsden") {
            true
          }
          else if (searchBar.text == "Stein") {
            true
          }
          else if (searchBar.text == "stein") {
            true
          }
          else if (searchBar.text == "Geleen") {
            true
          }
          else if (searchBar.text == "geleen") {
            true
          }
          else if (searchBar.text == "Sittard") {
            true
          }
          else if (searchBar.text == "sittard") {
            true
          }
          else if (searchBar.text == "Heerlen") {
            true
          }
          else if (searchBar.text == "heerlen") {
            true
          }
          else if (searchBar.text == "Landgraaf") {
            true
          }
          else if (searchBar.text == "landgraaf") {
            true
          }
          else if (searchBar.text == "Brunssum") {
            true
          }
          else if (searchBar.text == "brunssum") {
            true
          }
          else if (searchBar.text == "Vaals") {
            true
          }
          else if (searchBar.text == "vaals") {
            true
          }
          else if (searchBar.text == "Noord") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "Limburg") {
            true
          }
          else if (searchBar.text == "limburg") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Marknesse"
        informatie: "Noordoostpolder"
        stationnummer: "30"
        visible: {
          if (searchBar.text == "Marknesse") {
            true
          }
          else if (searchBar.text == "marknesse") {
            true
          }
          else if (searchBar.text == "Noordoostpolder") {
            true
          }
          else if (searchBar.text == "noordoostpolder") {
            true
          }
          else if (searchBar.text == "Noord") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "Emmeloord") {
            true
          }
          else if (searchBar.text == "emmeloord") {
            true
          }
          else if (searchBar.text == "Luttelgeest") {
            true
          }
          else if (searchBar.text == "luttelgeest") {
            true
          }
          else if (searchBar.text == "Bant") {
            true
          }
          else if (searchBar.text == "bant") {
            true
          }
          else if (searchBar.text == "Ens") {
            true
          }
          else if (searchBar.text == "ens") {
            true
          }
          else if (searchBar.text == "Blokzijl") {
            true
          }
          else if (searchBar.text == "blokzijl") {
            true
          }
          else if (searchBar.text == "Vollenhove") {
            true
          }
          else if (searchBar.text == "vollenhove") {
            true
          }
          else if (searchBar.text == "Blankenham") {
            true
          }
          else if (searchBar.text == "blankenham") {
            true
          }
          else if (searchBar.text == "Kraggenburg") {
            true
          }
          else if (searchBar.text == "kraggenburg") {
            true
          }
          else if (searchBar.text == "Nagele") {
            true
          }
          else if (searchBar.text == "nagele") {
            true
          }
          else if (searchBar.text == "Tollebeek") {
            true
          }
          else if (searchBar.text == "tollebeek") {
            true
          }
          else if (searchBar.text == "Espel") {
            true
          }
          else if (searchBar.text == "espel") {
            true
          }
          else if (searchBar.text == "Urk") {
            true
          }
          else if (searchBar.text == "urk") {
            true
          }
          else if (searchBar.text == "Flevoland") {
            true
          }
          else if (searchBar.text == "flevoland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation { //HIER VERDER MET AANVULLEN!!!!!!!!!!!!!!!!
        naam: "Nieuw Beerta"
        informatie: "Regio Oost-Groningen"
        stationnummer: "31"
        visible: {
          if (searchBar.text == "Nieuw Beerta") {
            true
          }
          else if (searchBar.text == "nieuw beerta") {
            true
          }
          else if (searchBar.text == "nieuw Beerta") {
            true
          }
          else if (searchBar.text == "nieuw") {
            true
          }
          else if (searchBar.text == "beerta") {
            true
          }
          else if (searchBar.text == "Nieuw") {
            true
          }
          else if (searchBar.text == "Beerta") {
            true
          }
          else if (searchBar.text == "Oost-Groningen") {
            true
          }
          else if (searchBar.text == "oost-groningen") {
            true
          }
          else if (searchBar.text == "Oost") {
            true
          }
          else if (searchBar.text == "oost") {
            true
          }
          else if (searchBar.text == "Groningen") {
            true
          }
          else if (searchBar.text == "groningen") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Oosterschelde"
        informatie: "Regio Oosterschelde"
        stationnummer: "32"
        visible: {
          if (searchBar.text == "Oosterschelde") {
            true
          }
          else if (searchBar.text == "oosterschelde") {
            true
          }
          else if (searchBar.text == "Zeeland") {
            true
          }
          else if (searchBar.text == "zeeland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Rotterdam"
        informatie: "Regio Rotterdam"
        stationnummer: "33"
        visible: {
          if (searchBar.text == "Rotterdam") {
            true
          }
          else if (searchBar.text == "rotterdam") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Rotterdam Geulhaven"
        informatie: "Regio Rotterdam Haven"
        stationnummer: "34"
        visible: {
          if (searchBar.text == "Rotterdam Geulhaven") {
            true
          }
          else if (searchBar.text == "Geulhaven") {
            true
          }
          else if (searchBar.text == "Rotterdam geulhaven") {
            true
          }
          else if (searchBar.text == "geulhaven") {
            true
          }
          else if (searchBar.text == "Rotterdam") {
            true
          }
          else if (searchBar.text == "rotterdam") {
            true
          }
          else if (searchBar.text == "haven") {
            true
          }
          else if (searchBar.text == "Haven") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      /*/Weerstation {
        naam: "Schaar"
        informatie: "Regio Schaar"
        stationnummer: "35"
        visible: {
          if (searchBar.text == "Schaar") {
            true
          }
          else if (searchBar.text == "schaar") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }/*/

      Weerstation {
        naam: "Schiphol"
        informatie: "Regio Amsterdam"
        stationnummer: "36"
        visible: {
          if (searchBar.text == "Schiphol") {
            true
          }
          else if (searchBar.text == "schiphol") {
            true
          }
          else if (searchBar.text == "Amsterdam") {
            true
          }
          else if (searchBar.text == "amsterdam") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Stavenisse"
        informatie: "Regio Midden-Zeeland"
        stationnummer: "37"
        visible: {
          if (searchBar.text == "Stavenisse") {
            true
          }
          else if (searchBar.text == "stavenisse") {
            true
          }
          else if (searchBar.text == "Midden-Zeeland") {
            true
          }
          else if (searchBar.text == "midden-Zeeland") {
            true
          }
          else if (searchBar.text == "Midden-zeeland") {
            true
          }
          else if (searchBar.text == "midden-zeeland") {
            true
          }
          else if (searchBar.text == "Zeeland") {
            true
          }
          else if (searchBar.text == "zeeland") {
            true
          }
          else if (searchBar.text == "midden") {
            true
          }
          else if (searchBar.text == "Midden") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Stavoren"
        informatie: "Regio West-Friesland"
        stationnummer: "38"
        visible: {
          if (searchBar.text == "Stavoren") {
            true
          }
          else if (searchBar.text == "stavoren") {
            true
          }
          else if (searchBar.text == "West-Friesland") {
            true
          }
          else if (searchBar.text == "West-friesland") {
            true
          }
          else if (searchBar.text == "west-Friesland") {
            true
          }
          else if (searchBar.text == "west-friesland") {
            true
          }
          else if (searchBar.text == "Friesland") {
            true
          }
          else if (searchBar.text == "friesland") {
            true
          }
          else if (searchBar.text == "West") {
            true
          }
          else if (searchBar.text == "west") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Texelhors"
        informatie: "Regio Texel"
        stationnummer: "39"
        visible: {
          if (searchBar.text == "Texelhors") {
            true
          }
          else if (searchBar.text == "texelhors") {
            true
          }
          else if (searchBar.text == "Texel") {
            true
          }
          else if (searchBar.text == "texel") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Tholen"
        informatie: "Regio Tholen"
        stationnummer: "40"
        visible: {
          if (searchBar.text == "Tholen") {
            true
          }
          else if (searchBar.text == "tholen") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Twente"
        informatie: "Regio Twente"
        stationnummer: "41"
        visible: {
          if (searchBar.text == "Twente") {
            true
          }
          else if (searchBar.text == "twente") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Vlakte aan de Raan"
        informatie: "Regio West-Zeeland"
        stationnummer: "42"
        visible: {
          if (searchBar.text == "Vlakte aan de Raan") {
            true
          }
          else if (searchBar.text == "vlakte aan de raan") {
            true
          }
          else if (searchBar.text == "vlakte aan de Raan") {
            true
          }
          else if (searchBar.text == "Vlakte aan de raan") {
            true
          }
          else if (searchBar.text == "West-Zeeland") {
            true
          }
          else if (searchBar.text == "West-zeeland") {
            true
          }
          else if (searchBar.text == "west-zeeland") {
            true
          }
          else if (searchBar.text == "West") {
            true
          }
          else if (searchBar.text == "west") {
            true
          }
          else if (searchBar.text == "Zeeland") {
            true
          }
          else if (searchBar.text == "zeeland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Vlieland"
        informatie: "Regio Vlieland"
        stationnummer: "43"
        visible: {
          if (searchBar.text == "Vlieland") {
            true
          }
          else if (searchBar.text == "vlieland") {
            true
          }
          else if (searchBar.text == "Waddenzee") {
            true
          }
          else if (searchBar.text == "waddenzee") {
            true
          }
          else if (searchBar.text == "Friesland") {
            true
          }
          else if (searchBar.text == "friesland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Vlissingen"
        informatie: "Regio Vlissingen"
        stationnummer: "44"
        visible: {
          if (searchBar.text == "Vlissingen") {
            true
          }
          else if (searchBar.text == "vlissingen") {
            true
          }
          else if (searchBar.text == "Middelburg") {
            true
          }
          else if (searchBar.text == "middelburg") {
            true
          }
          else if (searchBar.text == "Ritthem") {
            true
          }
          else if (searchBar.text == "ritthem") {
            true
          }
          else if (searchBar.text == "Koudekerke") {
            true
          }
          else if (searchBar.text == "koudekerke") {
            true
          }
          else if (searchBar.text == "Zoutelande") {
            true
          }
          else if (searchBar.text == "zoutelande") {
            true
          }
          else if (searchBar.text == "Oost-Souburg") {
            true
          }
          else if (searchBar.text == "Oost-souburg") {
            true
          }
          else if (searchBar.text == "oost-souburg") {
            true
          }
          else if (searchBar.text == "oost") {
            true
          }
          else if (searchBar.text == "Arnemuiden") {
            true
          }
          else if (searchBar.text == "arnemuiden") {
            true
          }
          else if (searchBar.text == "Zeeland") {
            true
          }
          else if (searchBar.text == "zeeland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Volkel"
        informatie: "Regio Uden"
        stationnummer: "45"
        visible: {
          if (searchBar.text == "Vokel") {
            true
          }
          else if (searchBar.text == "volkel") {
            true
          }
          else if (searchBar.text == "uden") {
            true
          }
          else if (searchBar.text == "Uden") {
            true
          }
          else if (searchBar.text == "Hoogveld") {
            true
          }
          else if (searchBar.text == "hoogveld") {
            true
          }
          else if (searchBar.text == "Odiliapeel") {
            true
          }
          else if (searchBar.text == "odiliapeel") {
            true
          }
          else if (searchBar.text == "Erp") {
            true
          }
          else if (searchBar.text == "erp") {
            true
          }
          else if (searchBar.text == "Boekel") {
            true
          }
          else if (searchBar.text == "boekel") {
            true
          }
          else if (searchBar.text == "Oventje") {
            true
          }
          else if (searchBar.text == "oventje") {
            true
          }
          else if (searchBar.text == "Venhorst") {
            true
          }
          else if (searchBar.text == "venhorst") {
            true
          }
          else if (searchBar.text == "Landhorst") {
            true
          }
          else if (searchBar.text == "landhorst") {
            true
          }
          else if (searchBar.text == "Gemert") {
            true
          }
          else if (searchBar.text == "gemert") {
            true
          }
          else if (searchBar.text == "Elsendorp") {
            true
          }
          else if (searchBar.text == "elsendorp") {
            true
          }
          else if (searchBar.text == "handel") {
            true
          }
          else if (searchBar.text == "handel") {
            true
          }
          else if (searchBar.text == "Lieshout") {
            true
          }
          else if (searchBar.text == "lieshout") {
            true
          }
          else if (searchBar.text == "Veghel") {
            true
          }
          else if (searchBar.text == "veghel") {
            true
          }
          else if (searchBar.text == "Sint") {
            true
          }
          else if (searchBar.text == "sint") {
            true
          }
          else if (searchBar.text == "Sint-Oedenrode") {
            true
          }
          else if (searchBar.text == "Sint-oedenrode") {
            true
          }
          else if (searchBar.text == "sint-oedenrode") {
            true
          }
          else if (searchBar.text == "Schijndel") {
            true
          }
          else if (searchBar.text == "schijndel") {
            true
          }
          else if (searchBar.text == "Nijmegen") {
            true
          }
          else if (searchBar.text == "nijmegen") {
            true
          }
          else if (searchBar.text == "Wijchen") {
            true
          }
          else if (searchBar.text == "wijchen") {
            true
          }
          else if (searchBar.text == "Nederasselt") {
            true
          }
          else if (searchBar.text == "nederasselt") {
            true
          }
          else if (searchBar.text == "Overasselt") {
            true
          }
          else if (searchBar.text == "overasselt") {
            true
          }
          else if (searchBar.text == "Ravenstein") {
            true
          }
          else if (searchBar.text == "ravenstein") {
            true
          }
          else if (searchBar.text == "Oss") {
            true
          }
          else if (searchBar.text == "oss") {
            true
          }
          else if (searchBar.text == "Helmond") {
            true
          }
          else if (searchBar.text == "helmond") {
            true
          }
          else if (searchBar.text == "Deurne") {
            true
          }
          else if (searchBar.text == "deurne") {
            true
          }
          else if (searchBar.text == "Ysselsteyn") {
            true
          }
          else if (searchBar.text == "ysselsteyn") {
            true
          }
          else if (searchBar.text == "Venray") {
            true
          }
          else if (searchBar.text == "venray") {
            true
          }
          else if (searchBar.text == "Afferden") {
            true
          }
          else if (searchBar.text == "afferden") {
            true
          }
          else if (searchBar.text == "Boxmeer") {
            true
          }
          else if (searchBar.text == "boxmeer") {
            true
          }
          else if (searchBar.text == "Heesch") {
            true
          }
          else if (searchBar.text == "heesch") {
            true
          }
          else if (searchBar.text == "Mill") {
            true
          }
          else if (searchBar.text == "mill") {
            true
          }
          else if (searchBar.text == "Overloon") {
            true
          }
          else if (searchBar.text == "overloon") {
            true
          }
          else if (searchBar.text == "Brabant") {
            true
          }
          else if (searchBar.text == "brabant") {
            true
          }
          else if (searchBar.text == "Noord-Brabant") {
            true
          }
          else if (searchBar.text == "Noord-brabant") {
            true
          }
          else if (searchBar.text == "noord-brabant") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Voorschoten"
        informatie: "Regio Voorschoten"
        stationnummer: "46"
        visible: {
          if (searchBar.text == "Voorschoten") {
            true
          }
          else if (searchBar.text == "voorschoten") {
            true
          }
          else if (searchBar.text == "Leiden") {
            true
          }
          else if (searchBar.text == "leiden") {
            true
          }
          else if (searchBar.text == "Wassenaar") {
            true
          }
          else if (searchBar.text == "wassenaar") {
            true
          }
          else if (searchBar.text == "Noordwijk") {
            true
          }
          else if (searchBar.text == "noordwijk") {
            true
          }
          else if (searchBar.text == "Katwijk aan Zee") {
            true
          }
          else if (searchBar.text == "katwijk aan zee") {
            true
          }
          else if (searchBar.text == "Alphen aan den Rijn") {
            true
          }
          else if (searchBar.text == "Alphen aan den rijn") {
            true
          }
          else if (searchBar.text == "alphen aan den rijn") {
            true
          }
          else if (searchBar.text == "Alphen") {
            true
          }
          else if (searchBar.text == "alphen") {
            true
          }
          else if (searchBar.text == "Zoetermeer") {
            true
          }
          else if (searchBar.text == "zoetermeer") {
            true
          }
          else if (searchBar.text == "Maaldrift") {
            true
          }
          else if (searchBar.text == "maaldrift") {
            true
          }
          else if (searchBar.text == "Valkenburg") {
            true
          }
          else if (searchBar.text == "valkenburg") {
            true
          }
          else if (searchBar.text == "Zoeterwoude") {
            true
          }
          else if (searchBar.text == "zoeterwoude") {
            true
          }
          else if (searchBar.text == "Stompwijk") {
            true
          }
          else if (searchBar.text == "stompwijk") {
            true
          }
          else if (searchBar.text == "Voorburg") {
            true
          }
          else if (searchBar.text == "voorburg") {
            true
          }
          else if (searchBar.text == "Nootdorp") {
            true
          }
          else if (searchBar.text == "nootdorp") {
            true
          }
          else if (searchBar.text == "Delft") {
            true
          }
          else if (searchBar.text == "delft") {
            true
          }
          else if (searchBar.text == "Scheveningen") {
            true
          }
          else if (searchBar.text == "scheveningen") {
            true
          }
          else if (searchBar.text == "Sassenheim") {
            true
          }
          else if (searchBar.text == "sassenheim") {
            true
          }
          else if (searchBar.text == "Warmond") {
            true
          }
          else if (searchBar.text == "warmond") {
            true
          }
          else if (searchBar.text == "Zuid-Holland") {
            true
          }
          else if (searchBar.text == "Zuid-holland") {
            true
          }
          else if (searchBar.text == "zuid-holland") {
            true
          }
          else if (searchBar.text == "Zuid") {
            true
          }
          else if (searchBar.text == "zuid") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Westdorpe"
        informatie: "Regio Terneuzen"
        stationnummer: "47"
        visible: {
          if (searchBar.text == "Westdorpe") {
            true
          }
          else if (searchBar.text == "westdorpe") {
            true
          }
          else if (searchBar.text == "terneuzen") {
            true
          }
          else if (searchBar.text == "Terneuzen") {
            true
          }
          else if (searchBar.text == "Axel") {
            true
          }
          else if (searchBar.text == "axel") {
            true
          }
          else if (searchBar.text == "Philippine") {
            true
          }
          else if (searchBar.text == "philippine") {
            true
          }
          else if (searchBar.text == "Hoek") {
            true
          }
          else if (searchBar.text == "hoek") {
            true
          }
          else if (searchBar.text == "Hulst") {
            true
          }
          else if (searchBar.text == "hulst") {
            true
          }
          else if (searchBar.text == "IJzendijke") {
            true
          }
          else if (searchBar.text == "Ijzendijke") {
            true
          }
          else if (searchBar.text == "ijzendijke") {
            true
          }
          else if (searchBar.text == "Zeeland") {
            true
          }
          else if (searchBar.text == "zeeland") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Wijdenes"
        informatie: "Regio Hoorn"
        stationnummer: "48"
        visible: {
          if (searchBar.text == "Wijdenes") {
            true
          }
          else if (searchBar.text == "wijdenes") {
            true
          }
          else if (searchBar.text == "Hoorn") {
            true
          }
          else if (searchBar.text == "hoorn") {
            true
          }
          else if (searchBar.text == "IJsselmeer") {
            true
          }
          else if (searchBar.text == "Ijsselmeer") {
            true
          }
          else if (searchBar.text == "ijsselmeer") {
            true
          }
          else if (searchBar.text == "Zwaag") {
            true
          }
          else if (searchBar.text == "zwaag") {
            true
          }
          else if (searchBar.text == "Enkhuizen") {
            true
          }
          else if (searchBar.text == "enkhuizen") {
            true
          }
          else if (searchBar.text == "Berkhout") {
            true
          }
          else if (searchBar.text == "berkhout") {
            true
          }
          else if (searchBar.text == "Purmerend") {
            true
          }
          else if (searchBar.text == "purmerend") {
            true
          }
          else if (searchBar.text == "Edam") {
            true
          }
          else if (searchBar.text == "edam") {
            true
          }
          else if (searchBar.text == "Volendam") {
            true
          }
          else if (searchBar.text == "volendam") {
            true
          }
          else if (searchBar.text == "Markermeer") {
            true
          }
          else if (searchBar.text == "markermeer") {
            true
          }
          else if (searchBar.text == "Wognum") {
            true
          }
          else if (searchBar.text == "wognum") {
            true
          }
          else if (searchBar.text == "Medemblik") {
            true
          }
          else if (searchBar.text == "medemblik") {
            true
          }
          else if (searchBar.text == "Andijk") {
            true
          }
          else if (searchBar.text == "andijk") {
            true
          }
          else if (searchBar.text == "Kraaienburg") {
            true
          }
          else if (searchBar.text == "kraaienburg") {
            true
          }
          else if (searchBar.text == "Oosterleek") {
            true
          }
          else if (searchBar.text == "oosterleek") {
            true
          }
          else if (searchBar.text == "Noord-Holland") {
            true
          }
          else if (searchBar.text == "Noord-holland") {
            true
          }
          else if (searchBar.text == "noord-holland") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Wijk aan Zee"
        informatie: "Regio Wijk aan Zee"
        stationnummer: "49"
        visible: {
          if (searchBar.text == "Wijk aan Zee") {
            true
          }
          else if (searchBar.text == "Wijk aan Zee") {
            true
          }
          else if (searchBar.text == "Wijk aan zee") {
            true
          }
          else if (searchBar.text == "wijk aan zee") {
            true
          }
          else if (searchBar.text == "Wijk") {
            true
          }
          else if (searchBar.text == "wijk") {
            true
          }
          else if (searchBar.text == "Wijk aan") {
            true
          }
          else if (searchBar.text == "wijk aan") {
            true
          }
          else if (searchBar.text == "zee") {
            true
          }
          else if (searchBar.text == "Zee") {
            true
          }
          else if (searchBar.text == "Noorddorp") {
            true
          }
          else if (searchBar.text == "noorddorp") {
            true
          }
          else if (searchBar.text == "Beverwijk") {
            true
          }
          else if (searchBar.text == "beverwijk") {
            true
          }
          else if (searchBar.text == "Waterakkers") {
            true
          }
          else if (searchBar.text == "waterakkers") {
            true
          }
          else if (searchBar.text == "Heemskerk") {
            true
          }
          else if (searchBar.text == "heemskerk") {
            true
          }
          else if (searchBar.text == "Meerestein") {
            true
          }
          else if (searchBar.text == "meerestein") {
            true
          }
          else if (searchBar.text == "Velsen") {
            true
          }
          else if (searchBar.text == "velsen") {
            true
          }
          else if (searchBar.text == "Krommenie") {
            true
          }
          else if (searchBar.text == "krommenie") {
            true
          }
          else if (searchBar.text == "Noord-Holland") {
            true
          }
          else if (searchBar.text == "Noord-holland") {
            true
          }
          else if (searchBar.text == "noord-holland") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Woensdrecht"
        informatie: "Regio Woensdrecht"
        stationnummer: "50"
        visible: {
          if (searchBar.text == "Woensdrecht") {
            true
          }
          else if (searchBar.text == "woensdrecht") {
            true
          }
          else if (searchBar.text == "Bergen op Zoom") {
            true
          }
          else if (searchBar.text == "Bergen op zoom") {
            true
          }
          else if (searchBar.text == "bergen op zoom") {
            true
          }
          else if (searchBar.text == "bergen") {
            true
          }
          else if (searchBar.text == "bergen op") {
            true
          }
          else if (searchBar.text == "Hoogerheide") {
            true
          }
          else if (searchBar.text == "hoogerheide") {
            true
          }
          else if (searchBar.text == "Ossendrecht") {
            true
          }
          else if (searchBar.text == "ossendrecht") {
            true
          }
          else if (searchBar.text == "Rilland") {
            true
          }
          else if (searchBar.text == "rilland") {
            true
          }
          else if (searchBar.text == "Halsteren") {
            true
          }
          else if (searchBar.text == "halsteren") {
            true
          }
          else if (searchBar.text == "Roosendaal") {
            true
          }
          else if (searchBar.text == "roosendaal") {
            true
          }
          else if (searchBar.text == "Zandfort") {
            true
          }
          else if (searchBar.text == "zandfort") {
            true
          }
          else if (searchBar.text == "Korteven") {
            true
          }
          else if (searchBar.text == "korteven") {
            true
          }
          else if (searchBar.text == "Plaatsluis") {
            true
          }
          else if (searchBar.text == "plaatsluis") {
            true
          }
          else if (searchBar.text == "Putte") {
            true
          }
          else if (searchBar.text == "putte") {
            true
          }
          else if (searchBar.text == "Brabant") {
            true
          }
          else if (searchBar.text == "brabant") {
            true
          }
          else if (searchBar.text == "Noord-Brabant") {
            true
          }
          else if (searchBar.text == "Noord-brabant") {
            true
          }
          else if (searchBar.text == "noord-brabant") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Zeeplatform F-3"
        informatie: "Regio Noordzee"
        stationnummer: "51"
        visible: {
          if (searchBar.text == "Zeeplatform F-3") {
            true
          }
          else if (searchBar.text == "zeeplatform") {
            true
          }
          else if (searchBar.text == "noordzee") {
            true
          }
          else if (searchBar.text == "Noordzee") {
            true
          }
          else if (searchBar.text == "Noord") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "Zee") {
            true
          }
          else if (searchBar.text == "zee") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Weerstation {
        naam: "Zeeplatform K13"
        informatie: "Regio Noordzee"
        stationnummer: "52"
        visible: {
          if (searchBar.text == "Zeeplatform K13") {
            true
          }
          else if (searchBar.text == "zeeplatform") {
            true
          }
          else if (searchBar.text == "noordzee") {
            true
          }
          else if (searchBar.text == "Noordzee") {
            true
          }
          else if (searchBar.text == "Noord") {
            true
          }
          else if (searchBar.text == "noord") {
            true
          }
          else if (searchBar.text == "Zee") {
            true
          }
          else if (searchBar.text == "zee") {
            true
          }
          else if (searchBar.text == "") {
            true
          }
          else {
            false
          }
        }
      }

      Rectangle {
        width: parent.width
        height: 1
        color: theme.palette.normal.base
      }

    }
  }

  SettingsDialog {
    id: settingsDialog
  }

  function openSettingsDialog() {
    var sd = PopupUtils.open(settingsDialog);
  }
}
