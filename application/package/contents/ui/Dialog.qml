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

Item {
    id: dialog
    visible: false
    property alias source: loader.source

    signal dialogOpen;
    signal dialogClosed;

    // Default size
    height: 100
    width:  100

    PlasmaCore.FrameSvgItem {
        anchors.fill: parent
        anchors.margins: 50

        Loader {
            id: loader
            anchors.fill: parent
            anchors.bottomMargin: 15
        }

        Connections {
            id: connection
            target:loader.item
            onClose: close()
            ignoreUnknownSignals: true
        }

        imagePath: "dialogs/background"
    }

    function open() {
        dialog.visible = true;
        dialogOpen();
    }

    function openUrl(url) {
        loader.source = url;
        dialog.visible = true;
        dialogOpen();
    }

    function close() {
        dialog.visible = false;
        dialogClosed();
    }
}
