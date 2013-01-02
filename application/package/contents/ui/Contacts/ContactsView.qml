/*
    Copyright (C) 2012  Artur Debski <xmentero@gmail.com>

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/

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
                    onChatRequest: contactList1.startChat(account,contact);

                    //onChatRequest: console.log("test");

                    KtpContactList.ContactList {
                        id: contactList1
                    }
                }
                ContactGroup {
                    name: "Only connected"
                    model: contactList2.model
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                    onChatRequest: contactList2.startChat(account,contact);
                }
                ContactGroup {
                    name: "All"
                    model: contactList3.model
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                    onChatRequest: contactList3.startChat(account,contact);
                }
            }
        }
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
