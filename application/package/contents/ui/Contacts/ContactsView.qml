import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras
import org.kde.telepathy.contactlist 0.1 as KtpContactList

Image {
    id: rootContactView
    source: "image://appbackgrounds/standard"
    fillMode: Image.Tile

    PlasmaExtras.ScrollArea {
        anchors.fill: parent
        Flickable {
            anchors.fill: parent
            flickableDirection: Flickable.VerticalFlick
            clip: true
            contentHeight: list.height
            Column {
                id: list                
                spacing: 4
                anchors {
                    left: parent.left
                    right: parent.right
                }
                ContactGroup {
                    name: "No offline"
                    model: contactList1.model
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }
                ContactGroup {
                    name: "Only connected"
                    model: contactList2.model
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }
                ContactGroup {
                    name: "All"
                    model: contactList3.model
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }
            }
        }
    }

    KtpContactList.ContactList {
        id: contactList1
    }
    KtpContactList.ContactList {
        id: contactList2
    }
    KtpContactList.ContactList {
        id: contactList3
    }
    Component.onCompleted : {
         contactList1.filter.sortMode = KtpContactList.AccountsFilterModel.SortByPresence;
         contactList1.filter.presenceTypeFilterFlags = KtpContactList.AccountsFilterModel.HideAllOffline

         contactList2.filter.sortMode = KtpContactList.AccountsFilterModel.SortByPresence;
         contactList2.filter.presenceTypeFilterFlags = KtpContactList.AccountsFilterModel.ShowOnlyConnected

         contactList3.filter.sortMode = KtpContactList.AccountsFilterModel.SortByPresence;
         contactList3.filter.presenceTypeFilterFlags = KtpContactList.AccountsFilterModel.ShowAll
    }

}
