import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: picker
    state: "presentationMode"

    height: childrenRect.height
    width: statusTabbar.width

    property string message: ""
    property int selectedTab: 0

    PlasmaComponents.ToolButton {
        id: statusButton
        text: message != "" ? message : i18n("Online")
        iconSource: "user-online"
        height: statusTabbar.height
        width: statusTabbar.width
        flat: false
        checkable: false
        onClicked: picker.state = "selectionMode"
    }

    PlasmaComponents.TextField {
        id: statusTextField
        height: statusTabbar.height
        width: statusTabbar.width
        placeholderText: "Enter your status"
        text: message

        PlasmaComponents.ToolButton {
            height: parent.height
            width: height
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            iconSource: "dialog-ok-apply"
            onClicked: {
                message = parent.text
                picker.state = "presentationMode"
            }
        }
    }

    PlasmaComponents.TabBar {
        id: statusTabbar
        PlasmaComponents.TabButton {
            id: statusOnline
            iconSource: "user-online";
            text: "Online"
        }
        PlasmaComponents.TabButton {
            id: statusAway
            iconSource: "user-away"
            text: "Away"
        }
        PlasmaComponents.TabButton {
            id: statusBusy
            iconSource: "user-busy"
            text: "Busy" }
        PlasmaComponents.TabButton {
            id: statusInvisible
            iconSource: "user-invisible"
            text: "Invisible"
        }
        PlasmaComponents.TabButton {
            id: statusOffline
            iconSource: "user-offline"
            text: "Offline"
        }
        PlasmaComponents.TabButton {
            id: statusMessage
            iconSource: "text-field"
            text: "Text"
        }
        onCurrentTabChanged: {
            switch(currentTab) {
            case statusOnline:
                selectedTab = 0
                picker.state = "presentationMode"
                break;
            case statusAway:
                selectedTab = 1
                picker.state = "presentationMode"
                break;
            case statusBusy:
                selectedTab = 2
                picker.state = "presentationMode"
                break;
            case statusInvisible:
                selectedTab = 3
                picker.state = "presentationMode"
                break;
            case statusOffline:
                selectedTab = 4
                picker.state = "presentationMode"
                break;
            case statusMessage:
                picker.state = "messageEditMode"
                currentTab = statusTabbar.children[selectedTab]
                break;
            }
            console.debug("Status changes: "+selectedTab)
        }
    }

    states: [
        State {
            name: "presentationMode"
            PropertyChanges { target: statusTabbar;     opacity: 0 }
            PropertyChanges { target: statusTextField;  opacity: 0 }
            PropertyChanges { target: statusButton;     opacity: 1 }
        },
        State {
            name: "selectionMode"
            PropertyChanges { target: statusTabbar;     opacity: 1 }
            PropertyChanges { target: statusTextField;  opacity: 0 }
            PropertyChanges { target: statusButton;     opacity: 0 }
        },
        State {
            name: "messageEditMode"
            PropertyChanges { target: statusTabbar;     opacity: 0 }
            PropertyChanges { target: statusTextField;  opacity: 1 }
            PropertyChanges { target: statusButton;     opacity: 0 }
        }
    ]
    transitions: [
        Transition {
            NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 500  }
        },
        Transition {
            from: "selectionMode"; to: "presentationMode"
            NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
        }

    ]
}
