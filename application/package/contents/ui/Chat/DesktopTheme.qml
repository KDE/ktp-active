import QtQuick 1.1

import org.kde.plasma.components 0.1 as PlasmaComponents


Rectangle {
//     width: 360
//     height: 360

    property variant conversation: model.conversation

    Header {
        id:header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        z: 1000
    }

    ListView { //or column + repeater?
        id:listView
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: chatInput.top

        model: conversation.messages

        delegate: Loader {
            Component.onCompleted: {
                switch(model.messageType) {
                case 1:
                    source = "actionDelegate.qml";
                    break
                default:
                    source = "messageDelegate.qml";
                    break;
                }
            }
        }
        boundsBehavior: Flickable.StopAtBounds
    }

    Item {
        id: chatInput
        height: avatar.height * 1.5

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        Image {
            id: avatar
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            source: "../../images/im-user.png"
        }
        PlasmaComponents.TextField {
            id: textArea
            focus: true
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: avatar.right
                right: parent.right
                bottomMargin: 10
            }
            onAccepted: {
                console.log("ASDFASDFASDF");
                conversation.messages.sendNewMessage(text);
                text = "";
            }
        }
    }


}
