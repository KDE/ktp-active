import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Rectangle {
    id: groupBodyRoot
    height: groupData.height

    property alias model: list.model

    Column {
        id: groupData
        spacing: 2
        anchors {
            margins: 2
            top: parent.top
            left: parent.left
            right: parent.right
        }

        Repeater {
            id: list

            Rectangle {
                id: signleEntry
                anchors {
                    left: parent.left
                    right: parent.right
                }

                height: avatar.height + 10
                border.color: "#cccccc"
                gradient: regularGradient

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: false
                    onPressed: parent.gradient = highlightGradient
                    onReleased: parent.gradient = regularGradient
                    onPositionChanged: parent.gradient = regularGradient
                    //onClicked: open chat
                    //onPressAndHold: show account detail
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

                Image {
                    id: avatar
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    source: contactAvatar
                    anchors.verticalCenter: parent.verticalCenter
                }
                PlasmaComponents.Label {
                    id: contactLabel
                    anchors.left: avatar.right
                    anchors.verticalCenter: avatar.verticalCenter
                    anchors.margins: 10
                    font.weight: Font.Bold
                    text: contactName
                }
                Image {
                    id: statusIcon
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    source: contactStatus == 1 ? "../../images/user-online.png" : "../../images/user-offline.png"
                    anchors.verticalCenter: parent.verticalCenter
                    opacity: contactStatus == 1 ? 1 : 0.2
                }

            }
        }
    }
}
