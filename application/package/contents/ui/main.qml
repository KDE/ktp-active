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
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.extras 0.1 as PlasmaExtras
import org.kde.plasma.mobilecomponents 0.1 as PlasmaMobile

Image {
    id: root

    width: 800
    height: 600

    source: "image://appbackgrounds/contextarea"
    fillMode: Image.Tile
    asynchronous: true

    property alias minimumWidth: root.paintedWidth
    property alias minimumHeight: root.paintedHeight

    // theme is available globally
    PlasmaCore.Theme {
        id: theme        
    }

    PlasmaComponents.ToolBar {
        id: mainToolbar
        width: root.width
        height: toolbarContent.height + mainToolbar.margins.top + mainToolbar.margins.bottom
        tools: toolbarContent

        Loader {
            id: toolbarContent
            source: "MainToolbar.qml"
        }

        Connections {
            target: toolbarContent.item
            onSettingsCheckedChanged: mainView.item.sidebarOpen = toolbarContent.item.settingsChecked
            ignoreUnknownSignals: true
        }
    }

    Loader {
        id: mainView
        width: root.width
        height: root.height - mainToolbar.height
        anchors.top: parent.top
        anchors.topMargin: mainToolbar.height
        source: "MainView.qml"
    }
}
