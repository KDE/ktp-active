import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    anchors.fill: parent
    PlasmaComponents.ToolButton {
        id: settingButton
        iconSource: "configure"
        width: parent.height * 0.9
        height: parent.height * 0.9

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 10
        }

        flat: false
        checkable: true
        onClicked: settingsClicked();
    }

    PlasmaComponents.ToolButton {
        id: statusButton
        text: i18n("Online")
        iconSource: "user-online"
        height: parent.height * 0.75

        anchors {
            verticalCenter: parent.verticalCenter
            left: settingButton.right
            leftMargin: 10
            right: parent.right
            rightMargin: 10
        }

        flat: false
        checkable: false
        onClicked: statusClicked();
    }
}

