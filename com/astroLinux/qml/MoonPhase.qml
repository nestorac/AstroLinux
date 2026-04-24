import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Card {
    width: 400
    height: 220
    background: Rectangle { color: "#1e252f"; radius: 12 }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16

        Text {
            text: "🌕 Fase Lunar"
            color: "#ffdd88"
            font.pixelSize: 18
            font.bold: true
        }

        Text {
            id: moonInfo
            text: "Luna Llena - 98%"
            color: "white"
            font.pixelSize: 22
        }

        Rectangle {
            width: 120
            height: 120
            radius: 60
            color: "#333844"
            Layout.alignment: Qt.AlignHCenter

            Text {
                anchors.centerIn: parent
                text: "🌕"
                font.pixelSize: 80
            }
        }
    }
}
