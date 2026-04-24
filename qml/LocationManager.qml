import QtQuick

QtObject {
    id: root

    property var locations: []
    property int currentIndex: 0

    // Signal corregido
    signal locationsUpdated()

    function addDefaultLocation() {
        locations = [{
            "name": "Madrid",
            "lat": 40.4168,
            "lon": -3.7038
        }]
        currentIndex = 0
        locationsUpdated()
    }

    function addLocation() {
        var name = prompt("Nombre de la ubicación:", "Nueva ubicación")
        if (!name) return

        var lat = parseFloat(prompt("Latitud:", "40.4168"))
        var lon = parseFloat(prompt("Longitud:", "-3.7038"))

        if (isNaN(lat) || isNaN(lon)) {
            console.warn("Coordenadas inválidas")
            return
        }

        locations.push({"name": name, "lat": lat, "lon": lon})
        currentIndex = locations.length - 1
        locationsUpdated()
    }

    function loadLocations() {
        console.log("📍 Cargando ubicaciones...")
        // Aquí se cargará desde JSON más adelante
    }
}
