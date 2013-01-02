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
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: rootAccountView

    signal close;

    Column {
        spacing: 5
        height: parent.height
        anchors {
            left: parent.left
            right: parent.right
        }

        ToolBar{
            id: toolbar
            anchors.left: parent.left
            anchors.right: parent.right

            onHomeSignal: { toolbar.state = "DEFAULT"; list.selectedAccountIndex = -1 }
            onAddSignal:  { toolbar.state = "FORM" }
            onEditSignal: { toolbar.state = "FORM" }
            onSaveSignal: { toolbar.state = "DEFAULT"; list.selectedAccountIndex = -1 }
            onCloseSignal:{ close() }
        }

        PlasmaExtras.Heading {
            id: header
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n("Accounts list")
            color: "#666666"
        }

        AccountList {
            id: list
            width: parent.width * 0.9
            height: parent.height - header.height - toolbar.height - 10
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            onSelectedItem: toolbar.state = "EDIT";
        }
    }


}
