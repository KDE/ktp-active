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

PlasmaComponents.ListItem {
    id: activeChatRoot

    implicitHeight: theme.mediumIconSize

    Row {
        id: row
        anchors.centerIn: parent
        width: parent.width
        Image {
            id: contactAvatar
            width: theme.mediumIconSize
            height: theme.mediumIconSize
            source: "../../images/im-user.png"
            anchors.verticalCenter: parent.verticalCenter
            smooth: true
        }
        PlasmaComponents.Label {
            text: "My friend #" + index
            width: row.width - 2*theme.mediumIconSize
            anchors.verticalCenter: parent.verticalCenter
        }
        PlasmaCore.Svg {
            id: configIconsSvg
            imagePath: "widgets/configuration-icons"
        }
        PlasmaCore.SvgItem {
            id: closeButton
            svg: configIconsSvg
            elementId: "close"
            width: theme.mediumIconSize
            height: theme.mediumIconSize
            anchors.verticalCenter: parent.verticalCenter
            MouseArea {
                anchors.fill: parent
                anchors.margins: -6
                onClicked: {
                    removeAnimation.running = true
                }
            }
        }

        SequentialAnimation {
            id: removeAnimation
            property bool exitFromRight: true
            NumberAnimation {
                target: activeChatRoot
                properties: "x"
                to: removeAnimation.exitFromRight ? activeChatRoot.width : -activeChatRoot.width
                duration: 250
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: activeChatRoot
                properties: "height"
                to: 0
                duration: 250
                easing.type: Easing.InOutQuad
            }
        }
    }
}
