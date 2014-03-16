/*
    Copyright (C) 2012  Artur Debski <xmentero@gmail.com>

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/

import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras
import org.kde.telepathy 0.1 as KTp

Item {
    id: chatRoot

    property variant conversation: model.conversation

    //hide all chats except the one set in activeChatIndex
    visible: index == conversationsModel.activeChatIndex ? true : false

    onVisibleChanged: {
        if(chatRoot.visible) {
            conversation.messages.acknowledgeAllMessages()
        }
    }

    Column {
        id: content
        anchors {
            fill: parent
            margins: 15
        }
        spacing: 10
        ChatToolbar {
            id: chatToolbar
            width: parent.width
        }

        PlasmaExtras.ScrollArea {
            width: chatRoot.width - content.anchors.margins*2
            height: parent.height - chatToolbar.height - chatInput.height
            Flickable {
                id: flickable
                anchors.fill: parent
                flickableDirection: Flickable.VerticalFlick
                clip: true
                contentHeight: list.height
                Column {
                    id: list
                    width: parent.width
                    spacing: 4
                    Repeater {
                        model: conversation.messages
                        delegate: ChatMessageDelegate {
                            width: flickable.width
                            direction: true
                            Component.onCompleted: {
                                flickable.contentY=flickable.contentHeight
                                if(chatRoot.visible) {
                                    conversation.messages.acknowledgeAllMessages()
                                }
                            }
                        }
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
            PlasmaComponents.TextField {
                id: textArea
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: avatar.right
                    right: parent.right
                    bottomMargin: 10
                }
                focus: true
                onTextChanged: conversation.updateTextChanged(textArea.text)
                onAccepted: {
                    conversation.messages.sendNewMessage(textArea.text);
                    textArea.text = "";
                    conversation.updateTextChanged("");
                }
            }
        }
    }
}

