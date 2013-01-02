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
    id: layout
    height: Math.max(settingsButton.height, picker.height)

    property alias settingsChecked: settingsButton.checked
    property alias activeChatsChecked: notificationNewMessage.checked

    PlasmaComponents.ToolButton {
        id: settingsButton
        width: theme.mediumIconSize
        height: theme.mediumIconSize
        anchors.verticalCenter: parent.verticalCenter

        iconSource: "format-justify-fill"
        flat: false
        checkable: true
        checked: true
    }

    StatusPicker {
        id: picker
        anchors {
            verticalCenter: parent.verticalCenter
            left: settingsButton.right
            leftMargin: 10
        }
    }

    PlasmaComponents.ToolButton {
        id: notificationFriendIsWriting
        enabled: false
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: notificationNewMessage.left
        iconSource: "document-edit"
        width: theme.largeIconSize
        height: theme.largeIconSize
    }

    PlasmaComponents.ToolButton {
        id: notificationNewMessage
        enabled: true
        checkable: true
        checked: false
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        iconSource: "mail-unread-new"
        width: theme.largeIconSize
        height: theme.largeIconSize
    }
}

