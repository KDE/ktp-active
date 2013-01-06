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
    id: groupHeadRoot
    implicitHeight: arrowsButton.height;
    sectionDelegate: true
    enabled: true

    property alias text: groupLabel.text
    property bool  expanded: true


    PlasmaCore.Svg {
        id: arrows
        imagePath: "widgets/arrows"
    }

    Row {
        id: groupLayout
        width: groupHeadRoot.width - 15
        PlasmaCore.SvgItem {
            id: arrowsButton
            svg: arrows
            elementId: expanded ? "down-arrow" : "right-arrow"
            width: theme.mediumIconSize
            height: theme.mediumIconSize
            anchors.verticalCenter: parent.verticalCenter
        }

        PlasmaComponents.Label {
            id: groupLabel
            width: groupLayout.width - arrowsButton.width - groupCount.width
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            font.weight: Font.Bold
            text: "No name group"
        }

        PlasmaComponents.Label {
            id: groupCount
            anchors.verticalCenter: parent.verticalCenter
            font.weight: Font.Bold
            text: "(4/10)"
        }
    }


    onClicked: groupHeadRoot.expanded = !groupHeadRoot.expanded
}
