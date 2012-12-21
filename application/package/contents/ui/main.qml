/*
 *   Copyright 2011 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Library General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 1.1
import org.kde.metadatamodels 0.1 as MetadataModels
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras
import org.kde.plasma.mobilecomponents 0.1 as MobileComponents
import org.kde.draganddrop 1.0
import org.kde.qtextracomponents 0.1

import "Accounts"

Image {
    id: rootItem
    source: "image://appbackgrounds/standard"
    fillMode: Image.Tile
    asynchronous: true
    width: 800
    height: 500
    anchors.margins: 8

    property int minimumWidth: 500
    property int minimumHeight: 300

    PlasmaCore.Theme {
        id: theme
    }

    PlasmaComponents.Button {
        text: i18n("Open dialog")
        onClicked: { dialog.visible = true; loader.source = "Accounts/AccountView.qml"; }
    }

    PlasmaCore.FrameSvgItem {
        id: dialog
        anchors.fill: parent
        anchors.margins: 50
        visible: false

        Loader {
            id: loader
            anchors.fill: parent
            anchors.bottomMargin: 15
        }
        imagePath: "translucent/dialogs/background"
    }




}
