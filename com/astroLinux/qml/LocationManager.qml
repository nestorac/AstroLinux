import QtQuick

QtObject {
    property var locations: []
    property int currentIndex: 0

    signal locationsChanged()

    function addDefaultLocation() {
        locations = [{
            "name": "Madrid",
            "lat": 40.4168,
            "lon": -3.7038
        }]
        currentIndex = 0
        saveLocations()
    }

    function addLocation() {
        var name = prompt("Nombre de la ubicación:", "Nueva ubicación")
        if (!name) return
        var lat = parseFloat(prompt("Latitud:", "40.4168"))
        var lon = parseFloat(prompt("Longitud:", "-3.7038"))

        locations.push({"name": name, "lat": lat, "lon": lon})
        currentIndex = locations.length - 1
        saveLocations()
    }

    function saveLocations() {
        // Guardado en local (Qt Settings en versiones futuras)
        console.log("Ubicaciones guardadas:", JSON.stringify(locations))
        locationsChanged()
    }

    function loadLocations() {
        // Por ahora usamos datos por defecto
        console.log("Cargando ubicaciones...")
    }
}
