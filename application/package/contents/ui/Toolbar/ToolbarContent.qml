import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: layout
    height: Math.max(settingsButton.height, picker.height)

    property alias settingsChecked: settingsButton.checked

    PlasmaComponents.ToolButton {
        id: settingsButton
        iconSource: "applications-system"
        width: theme.largeIconSize
        height: theme.largeIconSize

        flat: false
        checkable: true
        checked: true
    }

    StatusPicker {
        id: picker
        anchors {
            verticalCenter: parent.verticalCenter
            left: settingsButton.right
            leftMargin: 10
        }
    }

    PlasmaComponents.ToolButton {
        id: notificationFriendIsWriting
        enabled: false
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: notificationNewMessage.left
        iconSource: "document-edit"
        width: theme.largeIconSize
        height: theme.largeIconSize
    }

    PlasmaComponents.ToolButton {
        id: notificationNewMessage
        enabled: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        iconSource: "mail-unread-new"
        width: theme.largeIconSize
        height: theme.largeIconSize
    }
}

