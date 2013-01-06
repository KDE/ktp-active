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

Rectangle {
    id: signleEntry
    height: contactAvatar.height + 10
    border.color: "#cccccc"
    gradient: regularGradient

    implicitWidth: 200

    signal contactClicked(variant account, variant contact)

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
        text: "My friend #" + index //aliasName
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

