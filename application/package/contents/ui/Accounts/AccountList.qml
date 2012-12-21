import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: rootAcountList
    //Default size:
    width: 200
    height: 300

    // Debug rectangle
    Rectangle {
        //color: "blue"
        opacity: 0.3
        anchors.fill: parent
        //border.color: "black"
    }

    Component {
        id: entryDelegate
        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            height: accountIcon.height + 10
            border.color: "#cccccc"

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#ffffff" }
                GradientStop { position: 0.85; color: "#eeeeee" }
                GradientStop { position: 1.0; color: "#dddddd" }
            }
            // Account information
            Image {
                anchors.left: parent.left
                anchors.leftMargin: 10
                id: accountIcon
                source: icon
                anchors.verticalCenter: parent.verticalCenter
            }
            PlasmaComponents.Label {
                id: accountLabel
                anchors.left: accountIcon.right
                anchors.verticalCenter: accountIcon.verticalCenter
                anchors.margins: 10
                font.weight: Font.Bold
                text: label
            }
            // Account status
            Image {
                anchors.right: parent.right
                anchors.rightMargin: 10
                id: statusIcon
                source: accountStatus == 1 ? "../../images/user-online.png" : "../../images/user-offline.png"
                anchors.verticalCenter: parent.verticalCenter
            }
            PlasmaComponents.Label {
                id: statusLabel
                anchors.right: statusIcon.left
                anchors.verticalCenter: statusIcon.verticalCenter
                anchors.margins: 10
                color: "#666666"
                text: accountStatus == 1 ? i18n("online") : i18n("offline")
            }
        }
    }


    PlasmaExtras.ScrollArea {
        id: scrollArea
        anchors.fill: parent
        flickableItem: list

        ListView {
            id: list
            model: testModel
            delegate: entryDelegate
            smooth: true
            snapMode: ListView.SnapOneItem
            flickableDirection: Flickable.VerticalFlick
            spacing: 5;
            clip: true
        }
    }

    // Static model for presentation purpose (ctrl-c ctrl-v powah!)
    ListModel {
        id: testModel
        ListElement {
            label: "jabber"
            icon: "../../images/im-jabber.png"
            accountStatus: 1
        }
        ListElement {
            label: "jabber1"
            icon: "../../images/im-gadugadu.png"
            accountStatus: 2
        }
        ListElement {
            label: "jabber2"
            icon: "../../images/im-facebook.png"
            accountStatus: 2
        }
        ListElement {
            label: "jabber3"
            icon: "../../images/im-facebook.png"
            accountStatus: 1
        }
        ListElement {
            label: "jabber4"
            icon: "../../images/im-jabber.png"
            accountStatus: 1
        }
        ListElement {
            label: "jabber5"
            icon: "../../images/im-skype.png"
            accountStatus: 2
        }
        ListElement {
            label: "jabber6"
            icon: "../../images/im-jabber.png"
            accountStatus: 2
        }
        ListElement {
            label: "jabber"
            icon: "../../images/im-aim.png"
            accountStatus: 1
        }
        ListElement {
            label: "jabber1"
            icon: "../../images/im-jabber.png"
            accountStatus: 1
        }
        ListElement {
            label: "jabber2"
            icon: "../../images/im-twitter.png"
            accountStatus: 1
        }
        ListElement {
            label: "jabber3"
            icon: "../../images/im-aim.png"
            accountStatus: 1
        }
        ListElement {
            label: "jabber4"
            icon: "../../images/im-icq.png"
            accountStatus: 2
        }
        ListElement {
            label: "jabber5"
            icon: "../../images/im-yahoo.png"
            accountStatus: 1
        }
        ListElement {
            label: "jabber6"
            icon: "../../images/im-jabber.png"
            accountStatus: 2
        }
    }
}
