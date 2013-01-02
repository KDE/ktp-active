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
import org.kde.telepathy.chat 0.1 as KtpChat

Item {
    property alias header: chatHeader.text

    Column {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 10
        ChatToolbar {
            id: chatToolbar
            anchors {
                left: parent.left
                right: parent.right
            }
        }

        Text {
            id: chatHeader
            text: "Default header (test purpose)"
            font.pointSize: 10
        }

        PlasmaExtras.ScrollArea {
            anchors {
                left: parent.left
                right: parent.right
            }
            height: parent.height - chatToolbar.height - chatInput.height - chatHeader.height
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

