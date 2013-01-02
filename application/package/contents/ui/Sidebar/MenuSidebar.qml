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
import org.kde.plasma.mobilecomponents 0.1 as PlasmaMobile

Image {
    id: sidebarRoot
    state: "shown"
    source: "image://appbackgrounds/contextarea"
    fillMode: Image.Tile
    width: menuColumn.width
    anchors {
        top: parent.top
        bottom: parent.bottom
    }

    signal hintClicked;
    signal addUserClicked;
    signal removeUserClicked
    signal addGroupClicked;
    signal removeGroupClicked;
    signal accountsClicked;


    PlasmaComponents.ButtonColumn {
        id: menuColumn
        width: theme.largeIconSize
        exclusive: false
        spacing: 10
        anchors {
            top: parent.top
            topMargin: 15
            horizontalCenter: parent.horizontalCenter
        }

        Repeater {
            model: ["help-hint", "list-add-user", "list-remove-user", "user-group-new",
                    "user-group-delete", "bookmarks-organize"]
            PlasmaComponents.ToolButton {
                id: hintButton
                iconSource: modelData
                width: theme.largeIconSize
                height: theme.largeIconSize
                flat: false
                checkable: false
                onClicked: emitButton(index);
            }
        }
    }

    function emitButton(argIndex) {
        switch(argIndex) {
        case 0:
            hintClicked();
            break;
        case 1:
            addUserClicked();
            break;
        case 2:
            removeUserClicked();
            break;
        case 3:
            addGroupClicked()
            break;
        case 4:
            removeGroupClicked();
            break;
        case 5:
            accountsClicked();
            break;
        }
    }

    states: [
        State {
            name: "hidden"
            PropertyChanges {
                target: sidebarRoot
                opacity: 0
                width: 0
            }
        },
        State {
            name: "shown"
            PropertyChanges {
                target: sidebarRoot
                opacity: 1
                width: menuColumn.width * 1.2
            }
        }
    ]

    transitions: [
        Transition {
            ParallelAnimation {
                NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 600  }
                NumberAnimation { properties: "width"; easing.type: Easing.InOutQuad; duration: 300  }

            }
        }
    ]
}
