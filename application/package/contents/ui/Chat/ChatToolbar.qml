import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: toolbarRoot
    height: toolbar.height

    PlasmaComponents.ToolBar {
        id: toolbar
        tools: layout
        height: layout.height
        anchors.verticalCenter: parent.verticalCenter

        PlasmaComponents.ToolBarLayout {
            id: layout
            height: childrenRect.height

            PlasmaComponents.ToolButton {
                id: audioCall
                iconSource: "audio-headset"
                text: "Audio call"
                height: theme.toolbarIconSize
            }
            PlasmaComponents.ToolButton {
                id: videoCall
                iconSource: "camera-web"
                text: "Video call"
                height: theme.toolbarIconSize
            }
            PlasmaComponents.ToolButton {
                id: logView
                iconSource: "view-pim-journal"
                text: "View logs"
                height: theme.toolbarIconSize
            }
            PlasmaComponents.ToolButton {
                id: blockUser
                iconSource: "im-ban-user"
                text: "Block user"
                height: theme.toolbarIconSize
            }
            PlasmaComponents.ToolButton {
                id: exitChat
                iconSource: "dialog-close"
                text: "End chat"
                height: theme.toolbarIconSize
            }
        }
    }
}



