import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Frame {
    background: Rectangle { color: "#14181f"; radius: 8 }

    ListView {
        anchors.fill: parent
        clip: true
        model: ListModel {
            ListElement { name: "🌕 Luna"; desc: "Visible toda la noche" }
            ListElement { name: "♃ Júpiter"; desc: "Muy alto al atardecer" }
            ListElement { name: "M31 - Galaxia de Andrómeda"; desc: "Prismáticos" }
            ListElement { name: "M42 - Nebulosa de Orión"; desc: "Telescopio pequeño" }
            ListElement { name: "Saturno"; desc: "Visible hasta medianoche" }
        }
        delegate: ItemDelegate {
            width: ListView.view.width
            contentItem: RowLayout {
                Text { text: name; color: "#aaffcc"; font.pixelSize: 16; Layout.fillWidth: true }
                Text { text: desc; color: "#888888"; font.pixelSize: 14 }
            }
        }
    }
}
