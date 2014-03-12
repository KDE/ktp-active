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
import org.kde.telepathy 0.1 as KTp

import "Sidebar"
import "Chat"
import "Contacts"

Item {
    id: mainView

    implicitWidth: 100
    implicitHeight: 100

    property bool sidebarOpen: false

    // Left container contains contacts list and leftside menu
    Image {
        id: leftContainer
        width: parent.width * 0.3
        height: parent.height
        anchors.left: parent.left
        source: "image://appbackgrounds/standard"
        fillMode: Image.Tile
        z: 1

        MenuSidebar {
            id: sidebar
            anchors.left: parent.left
            height: parent.height

            state: sidebarOpen ? "shown" : "hidden"
        }

        PlasmaCore.Svg {
            id: borderSvg
            imagePath: "widgets/scrollwidget"
        }
        PlasmaCore.SvgItem {
            svg: borderSvg
            z: 1000
            elementId: "border-left"
            width: naturalSize.width
            height: sidebar.height
            opacity: sidebarOpen ? 0.6 : 0
            Behavior on opacity {
                NumberAnimation {
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
            anchors {
                left: sidebar.right
                top: parent.top
                bottom: parent.bottom
            }
        }

        ContactsList {
            id: contactsList
            width: parent.width - sidebar.width - anchors.margins*2
            anchors {
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                margins: 10
            }
        }

        Image {
            source: "image://appbackgrounds/shadow-right"
            fillMode: Image.TileVertically
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.right
            }
        }
    }

    // Right container contains your chat and a active chats drawer
    PlasmaComponents.PageStack {
        id: rightContainer
        width: parent.width - leftContainer.width
        height: parent.height
        anchors.right: parent.right
        initialPage: content

        ChatContainer {
            id: content
            anchors.fill: parent
            visible: false
        }
    }

    Component.onCompleted: {
        telepathyManager.addAllFeatures();
        telepathyManager.becomeReady();
    }
}
