import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: groupRoot
    height: groupHead.height + groupBody.height

    state: groupHead.expanded ? "unrolled" : "rolled"

    property alias name: groupHead.text
    property alias model: groupBody.model

    GroupHead {
        id: groupHead
        anchors.left: parent.left
        anchors.right: parent.right
    }

    GroupBody {
        id: groupBody
        anchors {
            top: groupHead.bottom
            left: parent.left
            right: parent.right
        }
    }

    states: [
        State {
            name: "rolled"
            PropertyChanges {
                target: groupBody
                opacity: 0
                visible: false
            }
            PropertyChanges {
                target: groupRoot
                height: groupHead.height
            }
        },
        State {
            name: "unrolled"
            PropertyChanges {
                target: groupBody
                opacity: 1
                visible: true
            }
            PropertyChanges {
                target: groupRoot
                height: groupHead.height + groupBody.height
            }
        }
    ]

    transitions: [
        Transition {
            from: "rolled"; to: "unrolled"
            SequentialAnimation {
                PropertyAction { target: groupBody; property: "visible"; value: "true" }
                NumberAnimation { properties: "height"; easing.type: Easing.InOutQuad; duration: 350  }
                NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 350  }            }
        },
        Transition {
            from: "unrolled"; to: "rolled"
            SequentialAnimation {
                NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 350  }
                NumberAnimation { properties: "height"; easing.type: Easing.InOutQuad; duration: 350  }
                PropertyAction { target: groupBody; property: "visible"; value: "false" }
            }
        }
    ]

    ListModel {
        id: testModel
        ListElement {
            contactName: "John Doe"
            contactAvatar: "../../images/im-user.png"
            contactStatus: 1
        }
        ListElement {
            contactName: "Scooby Doo"
            contactAvatar: "../../images/im-user-offline.png"
            contactStatus: 1
        }
        ListElement {
            contactName: "Donkey Kong"
            contactAvatar: "../../images/im-user-away.png"
            contactStatus: 1
        }
        ListElement {
            contactName: "John Doe"
            contactAvatar: "../../images/im-user.png"
            contactStatus: 1
        }
        ListElement {
            contactName: "Scooby Doo"
            contactAvatar: "../../images/im-user-offline.png"
            contactStatus: 2
        }
        ListElement {
            contactName: "Donkey Kong"
            contactAvatar: "../../images/im-user-away.png"
            contactStatus: 2
        }
        ListElement {
            contactName: "John Doe"
            contactAvatar: "../../images/im-user.png"
            contactStatus: 2
        }
        ListElement {
            contactName: "Scooby Doo"
            contactAvatar: "../../images/im-user-offline.png"
            contactStatus: 1
        }
        ListElement {
            contactName: "Donkey Kong"
            contactAvatar: "../../images/im-user-away.png"
            contactStatus: 1
        }
        ListElement {
            contactName: "John Doe"
            contactAvatar: "../../images/im-user.png"
            contactStatus: 2
        }
        ListElement {
            contactName: "Scooby Doo"
            contactAvatar: "../../images/im-user-offline.png"
            contactStatus: 2
        }
        ListElement {
            contactName: "Donkey Kong"
            contactAvatar: "../../images/im-user-away.png"
            contactStatus: 1
        }
    }
}
