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

Item {
    id: rootAcountList

    signal selectedItem(string name, int state);
    property int selectedAccountIndex: -1

//    //Debug rectangle
//    Rectangle {
//        color: "blue"
//        opacity: 0.3
//        anchors.fill: parent
//        border.color: "black"
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
