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
import "Chat"
import "Contacts"

Image {
    id: root
    source: "image://appbackgrounds/standard"
    fillMode: Image.Tile
    asynchronous: true
    width: 800
    height: 600
    anchors.margins: 8

    property int minimumWidth: 400
    property int minimumHeight: 300

    signal dialogOpen(string qmlSource);
    signal dialogClose;
    onDialogClose:{ dialog.visible = false; loader.source = ""; }
    onDialogOpen: { dialog.visible = true; loader.source = qmlSource; }

    PlasmaCore.Theme {
        id: theme
    }

    PlasmaComponents.Button {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        text: i18n("Open accounts")
        onClicked: { dialogOpen("Accounts/AccountView.qml"); }
    }

    Row {
        anchors.fill: parent
        ContactsView {
            width: parent.width * 0.3
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }

        ChatView {
            width: parent.width * 0.7
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }
    }

    Item {
        id: dialog
        visible: false
        anchors.fill: root

        Rectangle {
            focus: false
            anchors.fill: parent
            color: "#000000"
            opacity: 0.3
            MouseArea {
                // blocks mouse events on root element
                anchors.fill: parent
            }
        }

        PlasmaCore.FrameSvgItem {
            anchors.fill: parent
            anchors.margins: 50

            Loader {
                id: loader
                anchors.fill: parent
                anchors.bottomMargin: 15
            }
            imagePath: "dialogs/background"
        }

    }
}
