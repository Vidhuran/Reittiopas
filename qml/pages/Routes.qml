import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Routes")
            }
            TextField {
                id: from
                focus: true
                width: parent.width
                label: "From"
                placeholderText: "From"
                EnterKey.onClicked: {
                    to.focus = true;
                }
            }
            IconButton {
                function swapFromAndTo() {
                    var fromText = from.text
                    from.text = to.text
                    to.text = fromText
                }

                id: swap
                anchors.horizontalCenter: parent.horizontalCenter
                icon.source: "image://theme/icon-m-pause"
                onClicked: swapFromAndTo()
            }
            TextField {
                id: to
                width: parent.width
                label: "To"
                placeholderText: "To"
                EnterKey.onClicked: {
                    timePicker.focus = true;
                }
            }

            Row {
                id: dateTime
                spacing: Theme.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter
                width: page.width

                ValueButton {
                    id: datePicker
                    label: "Date"
                    width: dateTime.width/2
                    value: Qt.formatDate( new Date(), 'dd/M/yyyy')

                    onClicked: {
                        var dialog = pageStack.push("Sailfish.Silica.DatePickerDialog", {
                            date: value
                        })
                        dialog.accepted.connect(function() {
                            value = dialog.dateText
                        })
                    }
                }

                ValueButton {
                    id: timePicker
                    label: "Time"
                    width: dateTime.width/2
                    value: Qt.formatTime( new Date(), 'hh:mm')

                    onClicked: {
                        var dialog = pageStack.push("Sailfish.Silica.TimePickerDialog", {
                            hour: Qt.formatTime( new Date(), 'hh'),
                            minute: Qt.formatTime( new Date(), 'mm'),
                            hourMode: DateTime.TwentyFourHours
                        })
                        dialog.accepted.connect(function() {
                            value = dialog.timeText
                        })
                    }
                }
            }

            Row {
                id: arrivalToggle
                spacing: Theme.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    id: departure
                    color: Theme.highlightColor
                    text: "Departure"

                    onClicked: {
                        arrival.color = Theme.primaryColor
                        departure.color = Theme.highlightColor
                    }
                }

                Button {
                    id: arrival
                    text: "Arrival"

                    onClicked: {
                        departure.color = Theme.primaryColor
                        arrival.color = Theme.highlightColor
                    }
                }
            }
            Button {
                id: search
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Search"

                onClicked: pageStack.push(Qt.resolvedUrl("MapView.qml"))
            }
            Row {
                id: transportMode
                spacing: Theme.itemSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter
                width: page.width
                Row {
                    width: parent.width
                    Switch {
                        icon.source: "image://theme/icon-s-developer"
                    }
                    Switch {
                        icon.source: "image://theme/icon-s-jolla"
                    }
                    Switch {
                        icon.source: "image://theme/icon-s-like"
                    }
                    Switch {
                        icon.source: "image://theme/icon-s-service-owncloud"
                    }
                    Switch {
                        icon.source: "image://theme/icon-s-sailfish"
                    }
                }
                Row {
                    width:parent.width
                    Label {
                        text: "Bus"
                    }
                    Label {
                        text: "Tram"
                    }
                    Label {
                        text: "Metro"
                    }
                    Label {
                        text: "Train"
                    }
                    Label {
                        text: "Cycle"
                    }
                }
            }
        }
    }
}
