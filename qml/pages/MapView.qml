import QtQuick 2.0
import Sailfish.Silica 1.0
import QtPositioning 5.1
import QtLocation 5.0

Map {
    id: map
    anchors.fill: parent
    plugin : Plugin {
        id: plugin
        allowExperimental: true
        preferred: ["nokia", "osm"]
        required.mapping: Plugin.AnyMappingFeatures
        required.geocoding: Plugin.AnyGeocodingFeatures
        parameters: [
            PluginParameter { name: "app_id"; value: "APP_ID" },
            PluginParameter { name: "token"; value: "APP_TOKEN" }
        ]
    }
    center: QtPositioning.coordinate(48.856047, 2.353907) // Paris
}
