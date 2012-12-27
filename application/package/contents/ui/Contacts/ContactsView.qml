import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: rootContactView
    width: 100
    height: 62

    property bool sidebarVisible: false

    state: sidebarVisible ? "SIDEBAR_ON" : "SIDEBAR_OFF"

// Debuge rectangle
//    Rectangle {
//        anchors.fill: parent
//        opacity: 0.4
//        color: "lightsteelblue"
//    }

    ContactsList {
        anchors {
            margins: 2
            top: parent.top
            bottom: parent.bottom
            left: settingsBar.right
            right: parent.right
        }
    }

    ContactsSidebar {
        id: settingsBar
        anchors {
            topMargin: 2
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
    }

    states: [
        State {
            name: "SIDEBAR_ON"
            PropertyChanges {
                target: settingsBar
                opacity: 1
                width: 60
            }
        },
        State {
            name: "SIDEBAR_ON"
            PropertyChanges {
                target: settingsBar
                opacity: 0
                width: 0
            }
        }

    ]
}
