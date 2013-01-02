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

Rectangle {
    id: groupHeadRoot
    height: 45
    border.color: "#cccccc"

    property alias text: groupLabel.text
    property bool  expanded: true

    Gradient {
        id: regularGradient
        GradientStop { position: 0.0; color: "#dddddd" }
        GradientStop { position: 0.85; color: "#cccccc" }
        GradientStop { position: 1.0; color: "#bbbbbb" }
    }

    Gradient {
        id: highlightGradient
        GradientStop { position: 0.0; color: "#bbbbbb" }
        GradientStop { position: 0.85; color: "#cccccc" }
        GradientStop { position: 1.0; color: "#dddddd" }
    }

    gradient: expanded ? regularGradient : highlightGradient

    Image {
        id: arrowIcon
        source: expanded ? "../../images/arrow-down.png" : "../../images/arrow-right.png"
        width: theme.smallIconSize
        height: theme.smallIconSize
        anchors {
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
    }

    PlasmaComponents.Label {
        id: groupLabel
        anchors.centerIn: parent
        anchors.margins: 10
        font.weight: Font.Bold
        text: "No name group"
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: false
        onClicked: groupHeadRoot.expanded = !groupHeadRoot.expanded
    }
}
