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

    property alias selectedAccountIndex: list.currentIndex

    PlasmaExtras.ScrollArea {
        id: scrollArea
        anchors.fill: parent
        flickableItem: list

        // TODO: change sections for custom colapsable group (multiple headers+listviews/models)
        ListView {
            id: list
            currentIndex: -1
            model: testModel
            delegate: entryDelegate

            focus: true
            smooth: true
            snapMode: ListView.SnapToItem
            flickableDirection: Flickable.VerticalFlick
            spacing: 2
            clip: true

            ContactsListDelegate {
                id: entryDelegate
            }

            ContactsSectionDelegate {
                id: sectionDelegate
            }
        }
    }

    // Static model for presentation purpose (ctrl-c ctrl-v powah!)
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
