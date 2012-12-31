import QtQuick 1.1
import org.kde.metadatamodels 0.1 as MetadataModels
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.mobilecomponents 0.1 as MobileComponents
import org.kde.draganddrop 1.0
import org.kde.qtextracomponents 0.1

Item {
    id: rootToolbar
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
        anchors.left: parent.left
        anchors.right: parent.right
        tools: toolbar

        PlasmaComponents.ToolBarLayout
        {
            id: toolbar
            width: parent.width
            Row {
                id: leftContainer
                width: childrenRect.width
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                PlasmaComponents.ToolButton {
                    id: homeButton
                    iconSource: "go-home"
                    flat: false
                    height: addButton.height * 1.5
                    width: addButton.height * 1.5
                    onClicked: homeSignal()
                    anchors.verticalCenter: parent.verticalCenter
                }

                PlasmaComponents.ToolButton {
                    id: addButton
                    text: i18n("Add account")
                    flat: false
                    onClicked: addSignal();
                    anchors.verticalCenter: parent.verticalCenter
                }

                // Hidden buttons
                PlasmaComponents.ToolButton {
                    id: editButton
                    text: i18n("Edit account")
                    flat: false
                    onClicked: editSignal();
                    anchors.verticalCenter: parent.verticalCenter
                }
                PlasmaComponents.ToolButton {
                    id: deleteButton
                    text: i18n("Delete account")
                    flat: false
                    onClicked: deleteSignal();
                    anchors.verticalCenter: parent.verticalCenter
                }
                PlasmaComponents.ToolButton {
                    id: onoffButton
                    height: addButton.height * 1.5
                    width: addButton.height * 1.5
                    iconSource: checked ? "user-online" : "user-offline"
                    flat: false
                    checkable: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Row {
                id: rightContainer
                width: cancelButton.width*2 + 10
                LayoutMirroring.enabled: true
                spacing: 10
                anchors.verticalCenter: parent.verticalCenter
                PlasmaComponents.ToolButton {
                    id: cancelButton
                    text: i18n("Close")
                    flat: false
                    onClicked: closeSignal();
                    anchors.verticalCenter: parent.verticalCenter
                }
                PlasmaComponents.ToolButton {
                    id: saveButton
                    text: i18n("Save")
                    flat: false
                    onClicked: saveSignal();
                    anchors.verticalCenter: parent.verticalCenter
                }

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
