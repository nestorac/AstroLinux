import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Card {
    id: root
    width: 400
    height: 280
    background: Rectangle { color: "#1e252f"; radius: 12 }

    property double lat: 40.4168
    property double lon: -3.7038

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        Text {
            text: "☁️ Pronóstico esta noche"
            color: "#88ccff"
            font.pixelSize: 18
            font.bold: true
        }

        Text {
            id: weatherText
            text: "Cargando clima..."
            color: "white"
            font.pixelSize: 16
        }

        Text {
            id: tempText
            color: "#ffcc88"
            font.pixelSize: 32
            font.bold: true
        }
    }

    Timer {
        interval: 60000
        running: true
        repeat: true
        onTriggered: updateWeather()
    }

    Component.onCompleted: updateWeather()

    function updateWeather() {
        var url = "https://api.open-meteo.com/v1/forecast?latitude=" + lat + "&longitude=" + lon +
                  "&daily=weathercode,temperature_2m_max,temperature_2m_min&timezone=auto"
        var xhr = new XMLHttpRequest()
        xhr.open("GET", url)
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var data = JSON.parse(xhr.responseText)
                    weatherText.text = "Noche clara / Parcialmente nublado"
                    tempText.text = data.daily.temperature_2m_min[0] + "°C  →  " + data.daily.temperature_2m_max[0] + "°C"
                }
            }
        }
        xhr.send()
    }
}
