import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {

    height: groupHead.height + ( groupBody.visible ? groupBody.height : 0)

    Behavior on height {
        SequentialAnimation {
             NumberAnimation { properties: "height"; easing.type: Easing.InOutQuad; duration: 750  }
         }
    }

    property alias name: groupHead.text

    GroupHead {
        id: groupHead
        anchors.left: parent.left
        anchors.right: parent.right
    }

    GroupBody {
        id: groupBody
        model: testModel
        visible: groupHead.expanded
        anchors {
            top: groupHead.bottom
            left: parent.left
            right: parent.right
        }
    }

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
