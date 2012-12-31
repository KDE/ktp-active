import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.extras 0.1 as PlasmaExtras
import org.kde.plasma.mobilecomponents 0.1 as PlasmaMobile
import org.kde.telepathy.contactlist 0.1 as KtpContactList
import org.kde.telepathy.chat 0.1 as KtpChat

import "Accounts"
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

//    KtpChat {

//    }

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

    Image {
        id: activeChatsPanel
        anchors {
            top: chat.top
            bottom: chat.bottom
            right: chat.right
        }
        width: chat.width * 0.4
        source: "image://appbackgrounds/standard"
        fillMode: Image.Tile
        visible: false
        PlasmaExtras.Title {
            width: parent.width
            anchors.centerIn: parent
            wrapMode: Text.Wrap
            text: "Active Conversations go here"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        Image {
            source: "image://appbackgrounds/shadow-left"
            fillMode: Image.TileVertically
            anchors {
                top: parent.top
                bottom: parent.bottom
                right: parent.left
            }
        }
        MouseArea {
            anchors.fill: parent
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

        onAccountsClicked: {
            dialog.source = ("./Accounts/AccountView.qml");
            dialog.open();
            console.log("open account dialog");
        }
    }

    Toolbar {
        id: toolbar
        onSettingsChanged: settings ? sidebar.state = "shown" : sidebar.state = "hidden"
        onActiveChatsChanged: activeChatsPanel.visible = activeChats
    }

    Rectangle {
        id: tint
        focus: false
        visible: false
        anchors.fill: root
        color: "#000000"
        opacity: 0.3
        MouseArea {
            anchors.fill: parent
        }
    }

    Dialog {
        id: dialog
        width: root.width * 0.85
        height: root.height * 0.85
        anchors.centerIn: parent

        onDialogOpen: tint.visible = true
        onDialogClosed: tint.visible = false
    }
}
