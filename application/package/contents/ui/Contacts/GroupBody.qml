import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras
import org.kde.telepathy.contactlist 0.1 as KtpContactList

import org.kde.qtextracomponents 0.1 as PlasmaQt

Rectangle {
    id: groupBodyRoot
    height: groupData.height

    property alias model: list.model

    signal contactClicked(variant account, variant contact)

    Column {
        id: groupData
        spacing: 2
        anchors {
            margins: 2
            top: parent.top
            left: parent.left
            right: parent.right
        }
        width: parent.width

        Repeater {
            id: list
            width: parent.width

            Rectangle {
                id: signleEntry
                height: contactAvatar.height + 10
                width: list.width
                border.color: "#cccccc"
                gradient: regularGradient

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: false
                    onPressed: parent.gradient = highlightGradient
                    onReleased: parent.gradient = regularGradient
                    onPositionChanged: parent.gradient = regularGradient
                    onClicked: contactClicked(account, contact);
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
                    id: contactAvatar
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    width: theme.mediumIconSize
                    height: theme.mediumIconSize
                    source: avatar ? avatar : "../../images/im-user.png"
                    anchors.verticalCenter: parent.verticalCenter
                    smooth: true
                }
                PlasmaComponents.Label {
                    id: contactLabel
                    anchors.left: contactAvatar.right
                    anchors.verticalCenter: contactAvatar.verticalCenter
                    anchors.margins: 10
                    font.weight: Font.Bold
                    text: aliasName
                }
                PlasmaQt.QIconItem {
                    id: statusIcon
                    width: 22; height: 22
                    anchors {
                        right: parent.right
                        rightMargin: 10
                        verticalCenter: parent.verticalCenter
                    }
                    icon: presenceIcon
                }
            }
        }
    }
}
