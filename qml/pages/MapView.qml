import QtQuick 2.0
import QtLocation 5.0

Map {
    id: map
    plugin: Plugin {
        name: "nokia"
    }
    zoomLevel: map.minimumZoomLevel
    gesture.enabled: true
}
