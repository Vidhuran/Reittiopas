import QtQuick 2.0

Map {
            id: map
            plugin : Plugin {
                        name : "nokia"
                    }

            anchors.fill: parent

            size.width: parent.width

            size.height: parent.height

            zoomLevel: t_data.zoomLevel

            center: Coordinate {latitude: 46.5; longitude: 6.6}

            objects: t_data.mapObjectsList


            onZoomLevelChanged: {
                console.log("Zoom changed")
            }

        } // map

