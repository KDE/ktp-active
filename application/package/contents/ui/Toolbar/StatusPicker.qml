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
import org.kde.telepathy 0.1 as Ktp

Item {
    id: picker
    state: "presentationMode"

    implicitHeight: statusTextField.implicitHeight
    implicitWidth: 300

    property string message: ""
    property int selectedTab: 0
    property alias useTextMessage: useMessageButton.checked

    Item {
        id: statusField
        state: "statusShow"
        width: parent.width
        height: parent.height
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 10
        }

        Ktp.PresenceManager {
            id: presenceManager
        }

        // Status presentation
        PlasmaComponents.ToolButton {
            id: statusViewer
            anchors.fill: parent
            text: presenceManager.message
            iconSource: presenceManager.iconName
            flat: false
            checkable: false
            //onClicked: picker.state = "selectionMode"
            MouseArea {
                id: iconArea
                height: parent.height
                width: height
                onClicked: picker.state = "selectionMode"
            }
            MouseArea {
                id: labelArea
                anchors.left: iconArea.right
                height: parent.height
                width: parent.width - iconArea.width
                onClicked: picker.state = "editMode"
            }
        }

        // Status chooser
        PlasmaComponents.TabBar {
            id: statusTabbar
            anchors.fill: parent
            PlasmaComponents.TabButton {
                id: statusOnline
                iconSource: "user-online";
                text: "Online"
                onClicked: {
                    presenceManager.setPresence(Ktp.PresenceManager.Online)
                    selectedTab = 0
                    picker.state = "presentationMode"
                    PlasmaExtras.ReleasedAnimation
                }
            }
            PlasmaComponents.TabButton {
                id: statusAway
                iconSource: "user-away"
                text: "Away"
                onClicked: { presenceManager.setPresence(Ktp.PresenceManager.Away); selectedTab = 1; picker.state = "presentationMode"; }
            }
            PlasmaComponents.TabButton {
                id: statusAwayExtended
                iconSource: "user-away-extended"
                text: "Not Available"
                onClicked: { presenceManager.setPresence(Ktp.PresenceManager.ExtendedAway); selectedTab = 2; picker.state = "presentationMode"; }
            }
            PlasmaComponents.TabButton {
                id: statusBusy
                iconSource: "user-busy"
                text: "Busy"
                onClicked: { presenceManager.setPresence(Ktp.PresenceManager.Busy); selectedTab = 3; picker.state = "presentationMode"; }
            }
            PlasmaComponents.TabButton {
                id: statusHidden
                iconSource: "user-invisible"
                text: "Invisible"
                onClicked: { presenceManager.setPresence(Ktp.PresenceManager.Hidden); selectedTab = 4; picker.state = "presentationMode"; }
            }
            PlasmaComponents.TabButton {
                id: statusOffline
                iconSource: "user-offline"
                text: "Offline"
                onClicked: { presenceManager.setPresence(Ktp.PresenceManager.Offline); selectedTab = 5; picker.state = "presentationMode"; }
            }
        }

        // Status text message
        PlasmaComponents.TextField {
            id: statusTextField
            anchors.fill: parent
            placeholderText: "Enter your status"
            text: message
            clearButtonShown: true
        }

        states: [
            State {
                name: "statusShow"
                PropertyChanges { target: statusTabbar;     opacity: 0 }
                PropertyChanges { target: statusTextField;  opacity: 0 }
                PropertyChanges { target: statusViewer;     opacity: 1 }
            },
            State {
                name: "statusSelect"
                PropertyChanges { target: statusTabbar;     opacity: 1 }
                PropertyChanges { target: statusTextField;  opacity: 0 }
                PropertyChanges { target: statusViewer;     opacity: 0 }
            },
            State {
                name: "statusTextEdit"
                PropertyChanges { target: statusTabbar;     opacity: 0 }
                PropertyChanges { target: statusTextField;  opacity: 1 }
                PropertyChanges { target: statusViewer;     opacity: 0 }
            }
        ]
        transitions: [
            Transition {
                NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 500  }
            },
            Transition {
                from: "statusSelect";
                NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
            }
        ]
    }

    Item {
        id: optionsField
        state: "messageUse"
        width: childrenRect.width
        height: childrenRect.height
        anchors {
            verticalCenter: parent.verticalCenter
            left: statusField.right
            leftMargin: 10
        }

        PlasmaComponents.ToolButton {
            id: useMessageButton
            iconSource: "view-conversation-balloon"
            width: theme.mediumIconSize
            height: theme.mediumIconSize
            flat: true
            checkable: true
        }
        PlasmaComponents.ToolButton {
            id: editMessageButton
            iconSource: "text-field"
            width: theme.mediumIconSize
            height: theme.mediumIconSize
            flat: true
            checkable: false
            onClicked: picker.state = "editMode"
        }
        PlasmaComponents.ToolButton {
            id: applyMessageButton
            iconSource: "dialog-ok-apply"
            width: theme.mediumIconSize
            height: theme.mediumIconSize
            flat: true
            checkable: false
            onClicked: picker.state = "presentationMode"
        }

        states: [
            State {
                name: "messageUse"
                PropertyChanges { target: useMessageButton;     opacity: 1 }
                PropertyChanges { target: editMessageButton;    opacity: 0 }
                PropertyChanges { target: applyMessageButton;   opacity: 0 }
            },
            State {
                name: "messageEdit"
                PropertyChanges { target: useMessageButton;     opacity: 0 }
                PropertyChanges { target: editMessageButton;    opacity: 1 }
                PropertyChanges { target: applyMessageButton;   opacity: 0 }
            },
            State {
                name: "messageAccept"
                PropertyChanges { target: useMessageButton;     opacity: 0 }
                PropertyChanges { target: editMessageButton;    opacity: 0 }
                PropertyChanges { target: applyMessageButton;   opacity: 1 }
            }
        ]
        transitions: [
            Transition {
                NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 500  }
            },
            Transition {
                from: "messageEdit";
                NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
            }
        ]
    }

    states: [
        State {
            name: "presentationMode"
            PropertyChanges { target: statusField;      state: "statusShow" }
            PropertyChanges { target: optionsField;     state: "messageUse" }
        },
        State {
            name: "selectionMode"
            PropertyChanges { target: statusField;      state: "statusSelect" }
            PropertyChanges { target: optionsField;     state: "messageUse" }
        },
        State {
            name: "editMode"
            PropertyChanges { target: statusField;      state: "statusTextEdit" }
            PropertyChanges { target: optionsField;     state: "messageAccept" }
        }
    ]
}
