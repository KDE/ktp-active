import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.extras 0.1 as PlasmaExtras


//import "Accounts"
import "Chat"
import "Contacts"

import "Toolbar"
import "Sidebar"

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

    PlasmaCore.Theme {
        id: theme
    }

    ChatView {
        id: chat
        anchors {
            top: toolbar.bottom
            bottom: parent.bottom
            left: contactList.right
            right: parent.right
        }

        Image {
            source: "image://appbackgrounds/shadow-right"
            fillMode: Image.TileVertically
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
            }
        }
    }    

    ContactsView {
        id: contactList
        anchors {
            top: toolbar.bottom
            bottom: parent.bottom
            left: sidebar.right
        }
        width: parent.width*0.3
    }

    MenuSidebar {
        id: sidebar
        anchors.top: toolbar.bottom
        anchors.left: parent.left

        Image {
            source: "image://appbackgrounds/shadow-left"
            fillMode: Image.TileVertically
            anchors {
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
        }
    }

    Toolbar {
        id: toolbar
        onSettingsChanged: settings ? sidebar.state = "shown" : sidebar.state = "hidden"
    }
}
