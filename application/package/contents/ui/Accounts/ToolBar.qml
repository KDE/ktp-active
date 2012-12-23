import QtQuick 1.1
import org.kde.metadatamodels 0.1 as MetadataModels
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.mobilecomponents 0.1 as MobileComponents
import org.kde.draganddrop 1.0
import org.kde.qtextracomponents 0.1

Item {
    id: rootToolbar
    anchors.left: parent.left
    anchors.right: parent.right
    height: toolbarMenu.height

    state: "DEFAULT"

    signal homeSignal;
    signal addSignal;
    signal editSignal;
    signal deleteSignal;
    signal saveSignal;
    signal closeSignal;

    // Debug rectangle
//    Rectangle {
//        color: "orange"
//        opacity: 0.3
//        anchors.fill: parent
//    }

    PlasmaComponents.ToolBar {
        id: toolbarMenu
        tools: toolbar

        PlasmaComponents.ToolBarLayout
        {
            id: toolbar
            spacing: 10
            PlasmaComponents.ToolButton {
                id: homeButton
                iconSource: "go-home"
                flat: false
                height: addButton.height * 1.5
                width: addButton.height * 1.5
                onClicked: homeSignal()
                anchors.verticalCenter: toolbar.verticalCenter
            }

            PlasmaComponents.ToolButton {
                id: addButton
                text: i18n("Add account")
                flat: false
                onClicked: addSignal();
                anchors.verticalCenter: toolbar.verticalCenter
            }

            // Hidden buttons
            PlasmaComponents.ToolButton {
                id: editButton
                text: i18n("Edit account")
                flat: false
                anchors.verticalCenter: toolbar.verticalCenter
                onClicked: editSignal();
            }
            PlasmaComponents.ToolButton {
                id: deleteButton
                text: i18n("Delete account")
                flat: false
                anchors.verticalCenter: toolbar.verticalCenter
                onClicked: deleteSignal();
            }
            PlasmaComponents.ToolButton {
                id: onoffButton
                height: addButton.height * 1.5
                width: addButton.height * 1.5
                iconSource: checked ? "user-online" : "user-offline"
                flat: false
                checkable: true
                anchors.verticalCenter: toolbar.verticalCenter                
            }

            PlasmaComponents.ToolButton {
                id: saveButton
                text: i18n("Save")
                flat: false
                anchors.verticalCenter: toolbar.verticalCenter
                anchors.right: cancelButton.left
                anchors.rightMargin: 10
                onClicked: saveSignal();
            }

            PlasmaComponents.ToolButton {
                // Prints warning but prevents disappering when changing visibility of previous elements
                anchors.right: toolbar.right
                id: cancelButton
                text: i18n("Close")
                flat: false
                anchors.verticalCenter: toolbar.verticalCenter
                onClicked: closeSignal();
            }
        }
    }

    states : [
        State {
            name: "DEFAULT"
            PropertyChanges { target: addButton; visible: true }
            PropertyChanges { target: editButton; visible: false }
            PropertyChanges { target: deleteButton; visible: false }
            PropertyChanges { target: onoffButton; visible: false }
            PropertyChanges { target: saveButton; visible: false }
        },
        State {
            name: "FORM"
            PropertyChanges { target: addButton; visible: false }
            PropertyChanges { target: editButton; visible: false }
            PropertyChanges { target: deleteButton; visible: false }
            PropertyChanges { target: onoffButton; visible: false }
            PropertyChanges { target: saveButton; visible: true }
        },
        State {
            name: "EDIT"
            PropertyChanges { target: addButton; visible: true }
            PropertyChanges { target: editButton; visible: true }
            PropertyChanges { target: deleteButton; visible: true }
            PropertyChanges { target: onoffButton; visible: true }
            PropertyChanges { target: saveButton; visible: false }
        }
    ]
}
