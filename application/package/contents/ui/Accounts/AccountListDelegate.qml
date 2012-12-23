import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Component {
    id: entryDelegate
    Rectangle {
        id: signleEntry
        anchors.left: parent.left
        anchors.right: parent.right
        height: accountIcon.height + 10
        border.color: ListView.isCurrentItem ? "#006600" : "#cccccc"

        Rectangle {
            visible: ListView.isCurrentItem ? true : false
            anchors.fill: parent
            width: parent.width + 5
            height: parent.height + 5
            color: "#000000"
            radius: 5
        }

        Gradient {
            id: regularGradient
            GradientStop { position: 0.0; color: "#ffffff" }
            GradientStop { position: 0.85; color: "#eeeeee" }
            GradientStop { position: 1.0; color: "#dddddd" }
        }

        Gradient {
            id: highlightGradient
            GradientStop { position: 0.0; color: "#cccccc" }
            GradientStop { position: 0.75; color: "#eeeeee" }
            GradientStop { position: 1.0; color: "#ffffff" }
        }

        gradient: ListView.isCurrentItem ? highlightGradient : regularGradient

        // Account information
        Image {
            anchors.left: parent.left
            anchors.leftMargin: 10
            id: accountIcon
            source: icon
            anchors.verticalCenter: parent.verticalCenter
        }
        PlasmaComponents.Label {
            id: accountLabel
            anchors.left: accountIcon.right
            anchors.verticalCenter: accountIcon.verticalCenter
            anchors.margins: 10
            font.weight: Font.Bold
            text: label
        }
        // Account status
        Image {
            anchors.right: parent.right
            anchors.rightMargin: 10
            id: statusIcon
            source: accountStatus == 1 ? "../../images/user-online.png" : "../../images/user-offline.png"
            anchors.verticalCenter: parent.verticalCenter
        }
        PlasmaComponents.Label {
            id: statusLabel
            anchors.right: statusIcon.left
            anchors.verticalCenter: statusIcon.verticalCenter
            anchors.margins: 10
            color: "#666666"
            text: accountStatus == 1 ? i18n("online") : i18n("offline")
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: false
            onClicked: {
                if ( selectedAccountIndex == index ) {
                    selectedAccountIndex = -1
                } else {
                    selectedAccountIndex = index
                    selectedItem(label, accountStatus)
                }
            }
        }
    }
}

