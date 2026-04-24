import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    width: 400
    height: 240
    color: "#1e252f"
    radius: 12

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        Text {
            text: "🌕 Fase Lunar"
            color: "#ffdd88"
            font.pixelSize: 18
            font.bold: true
        }

        Text {
            id: moonInfo
            text: "Luna Creciente - 68%"
            color: "white"
            font.pixelSize: 22
        }

        Rectangle {
            width: 130
            height: 130
            radius: 65
            color: "#2c323a"
            Layout.alignment: Qt.AlignHCenter

            Text {
                anchors.centerIn: parent
                text: "🌗"
                font.pixelSize: 85
            }
        }
    }
}
