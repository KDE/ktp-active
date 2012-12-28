import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Image {
    id: sidebarRoot
    state: "shown"
    source: "image://appbackgrounds/contextarea"
    fillMode: Image.Tile
    anchors {
        top: parent.top
        bottom: parent.bottom
    }

    PlasmaComponents.ButtonColumn {
        exclusive: false
        spacing: 10
        anchors {
            top: parent.top
            topMargin: 15
            horizontalCenter: parent.horizontalCenter
        }

        Repeater {
            model: ["help-hint", "list-add-user", "list-remove-user", "user-group-new",
                    "user-group-delete", "bookmarks-organize"]
            PlasmaComponents.ToolButton {
                id: hintButton
                iconSource: modelData
                width: theme.largeIconSize
                height: theme.largeIconSize
                flat: false
                checkable: false
                //onClicked: buttonClicked();
            }
        }
    }

    states: [
        State {
            name: "hidden"
            PropertyChanges {
                target: sidebarRoot
                opacity: 0
                width: 0
            }
        },
        State {
            name: "shown"
            PropertyChanges {
                target: sidebarRoot
                opacity: 1
                width: childrenRect.width * 1.2
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation { properties: "width, opacity"; easing.type: Easing.InOutQuad; duration: 750  }
        }
    ]
}
