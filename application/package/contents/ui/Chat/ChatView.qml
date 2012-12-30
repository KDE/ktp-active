import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Image {
    id: chatRoot
    source: "image://appbackgrounds/contextarea"
    fillMode: Image.Tile

    Column {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 10
        ChatToolbar {
            id: chatToolbar
            anchors {
                //top: parent.top
                left: parent.left
                right: parent.right
            }
        }

        PlasmaExtras.ScrollArea {
            anchors {
                //top: parent.top
                left: parent.left
                right: parent.right
            }
            height: parent.height - chatToolbar.height - chatInput.height
            Flickable {
                anchors.fill: parent
                flickableDirection: Flickable.VerticalFlick
                clip: true
                contentHeight: list.height
                Column {
                    id: list
                    spacing: 4
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                    ChatMessageDelegate {
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                        direction: true
                    }
                    ChatMessageDelegate {
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                        direction: false
                    }
                    ChatMessageDelegate {
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                        direction: true
                    }
                }
            }
        }

        Item {
            id: chatInput
            height: avatar.height * 1.5

            anchors {
                left: parent.left
                right: parent.right
            }
            Image {
                id: avatar
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                source: "../../images/im-user.png"
            }
            PlasmaComponents.TextArea {
                id: textArea
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: avatar.right
                    right: parent.right
                    bottomMargin: 10
                }
            }
        }
    }

}
