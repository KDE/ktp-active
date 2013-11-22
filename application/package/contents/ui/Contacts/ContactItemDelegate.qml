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
import org.kde.qtextracomponents 0.1 as PlasmaQt

PlasmaComponents.ListItem {
    id: singleEntry
    height: contactAvatar.height + 10

    signal contactClicked(variant account, variant contact)

    MouseArea {
        anchors.fill: parent
        hoverEnabled: false
        onClicked: contactClicked(account, contact);
        //onPressAndHold: show account detail
    }

    Row {
        id: contactLayout
        width: parent.width - 20
        anchors.centerIn: parent
        spacing: 10

        Image {
            id: contactAvatar
            width: theme.largeIconSize
            height: theme.largeIconSize
            source: avatar ? avatar[0] : "../../images/im-user.png"
            anchors.verticalCenter: parent.verticalCenter
            smooth: true
        }

        PlasmaComponents.Label {
            id: contactLabel
            width: contactLayout.width - contactAvatar.width - statusIcon.width - contactLayout.spacing*2
            anchors.verticalCenter: contactAvatar.verticalCenter
            font.weight: Font.Bold
            text: model.display
            elide: Text.ElideRight
        }

        PlasmaQt.QIconItem {
            id: statusIcon
            width: theme.smallIconSize
            height: theme.smallIconSize
            anchors.verticalCenter: parent.verticalCenter
            icon: presenceIcon
        }

    }
}

