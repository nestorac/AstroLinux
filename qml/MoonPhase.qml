import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    width: 400
    height: 320
    color: "#1e252f"
    radius: 12

    property double illumination: 0.0
    property double moonAge: 0.0
    property string phaseName: "Calculando..."

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 16

        Text {
            text: "🌕 Fase Lunar - Hoy"
            color: "#ffdd88"
            font.pixelSize: 20
            font.bold: true
        }

        Text {
            text: phaseName
            color: "white"
            font.pixelSize: 26
            font.bold: true
        }

        Text {
            text: "Edad: " + moonAge.toFixed(1) + " días\nIluminación: " + illumination.toFixed(1) + "%"
            color: "#cccccc"
            font.pixelSize: 17
            lineHeight: 1.3
        }

        Rectangle {
            width: 160
            height: 160
            radius: 80
            color: "#2c323a"
            Layout.alignment: Qt.AlignHCenter

            Text {
                anchors.centerIn: parent
                text: getMoonEmoji()
                font.pixelSize: 110
            }
        }
    }

    Component.onCompleted: calculateMoonPhase()

    function calculateMoonPhase() {
        var date = new Date()
        var year = date.getFullYear()
        var month = date.getMonth() + 1
        var day = date.getDate()

        // Algoritmo basado en Meeus (versión simplificada pero precisa)
        var jd = julianDate(year, month, day)
        var daysSince2000 = jd - 2451545.0

        // Ciclo sinódico medio
        var moonCycle = 29.530588853
        var phase = (daysSince2000 + 0.25) % moonCycle   // +0.5 para ajustar offset

        moonAge = phase
        illumination = (1 - Math.cos(phase * 2 * Math.PI / moonCycle)) * 50   // fórmula correcta

        // Nombres de fase
        if (moonAge < 1.8) phaseName = "🌑 Luna Nueva"
            else if (moonAge < 5.5) phaseName = "🌒 Creciente"
                else if (moonAge < 9.2) phaseName = "🌓 Cuarto Creciente"
                    else if (moonAge < 13.8) phaseName = "🌔 Gibosa Creciente"
                        else if (moonAge < 16.5) phaseName = "🌕 Luna Llena"
                            else if (moonAge < 20.2) phaseName = "🌖 Gibosa Menguante"
                                else if (moonAge < 23.9) phaseName = "🌗 Cuarto Menguante"
                                    else phaseName = "🌘 Menguante"
    }

    function julianDate(y, m, d) {
        if (m <= 2) {
            y -= 1
            m += 12
        }
        var a = Math.floor(y / 100)
        var b = Math.floor(a / 4)
        return Math.floor(365.25 * (y + 4716)) + Math.floor(30.6001 * (m + 1)) + d + b - 1524.5
    }

    function getMoonEmoji() {
        if (illumination < 8) return "🌑"
            if (illumination < 25) return "🌒"
                if (illumination < 45) return "🌓"
                    if (illumination < 55) return "🌔"
                        if (illumination < 75) return "🌕"
                            if (illumination < 88) return "🌖"
                                if (illumination < 96) return "🌗"
                                    return "🌘"
    }
}
