import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    height: 50
    property alias settingsButtonCheck: settingButton.checked

    signal settingButtonClicked;
    signal statusButtonClicked;

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#cccccc"
        gradient: regularGradient

        Gradient {
            id: regularGradient
            GradientStop { position: 0.0; color: "#dddddd" }
            GradientStop { position: 0.85; color: "#eeeeee" }
            GradientStop { position: 1.0; color: "#ffffff" }
        }
    }

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
            onClicked: settingButtonClicked();
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

            onClicked: statusButtonClicked();
        }
    }

    Rectangle {
        height: 1
        width: parent.width
        color: "#cccccc"
        anchors.top: parent.bottom
        anchors.topMargin: -1
    }
}



