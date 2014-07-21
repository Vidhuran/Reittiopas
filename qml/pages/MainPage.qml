import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: mainPage

    ListModel {
        id: pagesModel

        ListElement {
            page: "Routes.qml"
            title: "Routes"
            subtitle: "Search for routes"
        }
        ListElement {
            page: "Stops.qml"
            title: "Stops"
            subtitle: "Search for buses at the stop"
        }
        ListElement {
            page: "Lines.qml"
            title: "Lines"
            subtitle: "Search for routes by line number"
        }
        ListElement {
            page: "Info.qml"
            title: "Info"
            subtitle: "Get the latest info from HSL"
        }
    }
    SilicaListView {
        id: listView
        anchors.fill: parent
        model: pagesModel
        header: PageHeader { title: "Reitiopas" }
        section {
            property: 'section'
            delegate: SectionHeader {
                text: section
            }
        }
        delegate: BackgroundItem {
            width: listView.width
            Label {
                id: firstName
                text: model.title
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.paddingLarge
            }
            onClicked: pageStack.push(Qt.resolvedUrl(page))
        }
        VerticalScrollDecorator {}
    }
}
