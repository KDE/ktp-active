import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: picker
    state: "presentationMode"

    height: statusField.height
    width: childrenRect.width

    property string message: ""
    property int selectedTab: 0
    property alias useTextMessage: useMessageButton.checked

    Item {
        id: statusField
        state: "statusShow"
        width: statusTabbar.width
        height: statusTabbar.height
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 10
        }

        // Status presentation
        PlasmaComponents.ToolButton {
            id: statusViewer
            anchors.fill: parent
            text: message != "" ? message : i18n("Status message will be here")
            iconSource: {
                switch(selectedTab) {
                        case 0:
                            "user-online"
                            break;
                        case 1:
                            "user-away"
                            break;
                        case 2:
                            "user-busy"
                            break;
                        case 3:
                            "user-invisible"
                            break;
                        case 4:
                            "user-offline"
                            break;
                        default:
                            "user-online"
                            break;
                        }
            }            
            flat: false
            checkable: false
            onClicked: picker.state = "selectionMode"
        }

        // Status chooser
        PlasmaComponents.TabBar {
            id: statusTabbar
            PlasmaComponents.TabButton {
                id: statusOnline
                iconSource: "user-online";
                text: "Online"
                onClicked: {
                    selectedTab = 0
                    picker.state = "presentationMode"
                    PlasmaExtras.ReleasedAnimation
                }
            }
            PlasmaComponents.TabButton {
                id: statusAway
                iconSource: "user-away"
                text: "Away"
                onClicked: { selectedTab = 1; picker.state = "presentationMode"; }
            }
            PlasmaComponents.TabButton {
                id: statusBusy
                iconSource: "user-busy"
                text: "Busy"
                onClicked: { selectedTab = 2; picker.state = "presentationMode"; }
            }
            PlasmaComponents.TabButton {
                id: statusInvisible
                iconSource: "user-invisible"
                text: "Invisible"
                onClicked: { selectedTab = 3; picker.state = "presentationMode"; }
            }
            PlasmaComponents.TabButton {
                id: statusOffline
                iconSource: "user-offline"
                text: "Offline"
                onClicked: { selectedTab = 4; picker.state = "presentationMode"; }
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
            iconSource: "mail-tagged"
            width: statusTabbar.height
            height: statusTabbar.height
            flat: true
            checkable: true
        }
        PlasmaComponents.ToolButton {
            id: editMessageButton
            iconSource: "text-field"
            width: statusTabbar.height
            height: statusTabbar.height
            flat: true
            checkable: false
            onClicked: picker.state = "editMode"
        }
        PlasmaComponents.ToolButton {
            id: applyMessageButton
            iconSource: "dialog-ok-apply"
            width: statusTabbar.height
            height: statusTabbar.height
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
            PropertyChanges { target: optionsField;     state: "messageEdit" }
        },
        State {
            name: "editMode"
            PropertyChanges { target: statusField;      state: "statusTextEdit" }
            PropertyChanges { target: optionsField;     state: "messageAccept" }
        }
    ]
}
