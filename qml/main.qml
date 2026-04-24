import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Window {
    width: 1100
    height: 720
    visible: true
    title: "AstroLinux - Planificador de Observación"
    color: "#0b0e12"

    LocationManager { 
        id: locMgr 
        Component.onCompleted: loadLocations()
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // Header
        Rectangle {
            Layout.fillWidth: true
            height: 64
            color: "#1a1f25"

            RowLayout {
                anchors.fill: parent
                anchors.margins: 16

                Text {
                    text: "🌌 AstroLinux"
                    color: "#a0d8ff"
                    font.pixelSize: 26
                    font.bold: true
                }

                ComboBox {
                    id: locationBox
                    Layout.fillWidth: true
                    model: locMgr.locations
                    textRole: "name"
                    onCurrentIndexChanged: locMgr.currentIndex = currentIndex
                }

                Button {
                    text: "＋ Añadir ubicación"
                    onClicked: locMgr.addLocation()
                }
            }
        }

        RowLayout {
            Layout.fillHeight: true
            Layout.margins: 16
            spacing: 16

            ColumnLayout {
                Layout.preferredWidth: 420
                MoonPhase { id: moonPhase }
                WeatherCard { id: weatherCard }
            }

            ObjectsList {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    Component.onCompleted: {
        if (locMgr.locations.length === 0) {
            locMgr.addDefaultLocation()
        }
    }
}
