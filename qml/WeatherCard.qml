import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    width: 400
    height: 260
    color: "#1e252f"
    radius: 12

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
            id: conditionText
            text: "Cargando clima..."
            color: "white"
            font.pixelSize: 17
        }

        Text {
            id: tempText
            text: "-- °C"
            color: "#ffcc88"
            font.pixelSize: 36
            font.bold: true
        }

        Text {
            id: windText
            text: ""
            color: "#aaaaaa"
            font.pixelSize: 15
        }
    }

    Timer {
        interval: 300000
        running: true
        repeat: true
        onTriggered: updateWeather()
    }

    Component.onCompleted: updateWeather()

    function updateWeather() {
        var url = "https://api.open-meteo.com/v1/forecast?latitude=40.42&longitude=-3.70" +
                  "&daily=weathercode,temperature_2m_max,temperature_2m_min,windspeed_10m_max&timezone=Europe/Madrid"
        
        var xhr = new XMLHttpRequest()
        xhr.open("GET", url)
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                var data = JSON.parse(xhr.responseText)
                conditionText.text = "Condiciones nocturnas"
                tempText.text = data.daily.temperature_2m_min[0] + "°C  →  " + data.daily.temperature_2m_max[0] + "°C"
                windText.text = "Viento: " + data.daily.windspeed_10m_max[0] + " km/h"
            }
        }
        xhr.send()
    }
}
