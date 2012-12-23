import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: rootAcountList
    //Default size:
    width: 200
    height: 300

    signal selectedItem(string name, int state);

    property int selectedAccountIndex: -1

    // Debug rectangle
//    Rectangle {
//        //color: "blue"
//        opacity: 0.3
//        anchors.fill: parent
//        //border.color: "black"
//    }

    PlasmaExtras.ScrollArea {
        id: scrollArea
        anchors.fill: parent
        flickableItem: list

        ListView {
            currentIndex: selectedAccountIndex
            id: list
            model: testModel
            delegate: entryDelegate
            focus: true
            smooth: true
            snapMode: ListView.SnapToItem
            flickableDirection: Flickable.VerticalFlick
            spacing: 5
            clip: true

            AccountListDelegate {
                id: entryDelegate
            }
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
