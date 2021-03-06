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

Item {
    id: groupRoot
    height: groupHead.height + groupBody.height

    state: groupHead.expanded ? "unrolled" : "rolled"

    property alias name: groupHead.text
    property alias model: list.model

    property alias contactsInGroup: groupHead.contactsInGroup
    property alias contactsAvailable: groupHead.contactsAvailable

    signal chatRequest(variant account, variant contact);

    GroupHeaderDelegate {
        id: groupHead
        anchors.left: parent.left
        anchors.right: parent.right
    }

    Item {
        id: groupBody
        height: groupData.height
        anchors {
            top: groupHead.bottom
            left: parent.left
            right: parent.right
        }

        Column {
            id: groupData
            spacing: 1
            anchors {
                topMargin: 2
                top: parent.top
                left: parent.left
                right: parent.right
            }
            width: parent.width

            Repeater {
                id: list
                width: parent.width

                ContactItemDelegate {
                    id: entry
                    width: list.width
                    onContactClicked: chatRequest(account, contact)
                }
            }
        }
    }

    states: [
        State {
            name: "rolled"
            PropertyChanges {
                target: groupBody
                opacity: 0
                visible: false
            }
            PropertyChanges {
                target: groupRoot
                height: groupHead.height
            }
        },
        State {
            name: "unrolled"
            PropertyChanges {
                target: groupBody
                opacity: 1
                visible: true
            }
            PropertyChanges {
                target: groupRoot
                height: groupHead.height + groupBody.height
            }
        }
    ]

    transitions: [
        Transition {
            from: "rolled"; to: "unrolled"
            SequentialAnimation {
                PropertyAction { target: groupBody; property: "visible"; value: "true" }
                NumberAnimation { properties: "height"; easing.type: Easing.InOutQuad; duration: 350  }
                NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 350  }            }
        },
        Transition {
            from: "unrolled"; to: "rolled"
            SequentialAnimation {
                NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 350  }
                NumberAnimation { properties: "height"; easing.type: Easing.InOutQuad; duration: 350  }
                PropertyAction { target: groupBody; property: "visible"; value: "false" }
            }
        }
    ]
}
