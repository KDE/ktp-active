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
import org.kde.qtextracomponents 0.1 as ExtraComponents

Item {
    implicitWidth: 100
    height: Math.max(avatar.height, messageBallon.height)

    property bool direction: true

    ExtraComponents.QPixmapItem {
        id: avatar
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        pixmap: model.senderAvatar
        fillMode: ExtraComponents.QPixmapItem.PreserveAspectFit
        LayoutMirroring.enabled: direction
        width: 40
        height: 40
    }

    Bubble {
        id: messageBallon
        width: parent.width - 2*avatar.width - 20
        //        height: content.height * 1.2
        anchors.horizontalCenter: parent.horizontalCenter
        color: "red"

        content: Item {
            height: childrenRect.height
            width: parent.width
            PlasmaComponents.Label {
                anchors {
                    top: parent.top
                    left: parent.left
                    margins: 20
                }
                text: i18nc("%1 = nick", "%1 writes", model.senderAlias)
            }

            Column {
                id: content
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: 20
                    verticalCenter: parent.verticalCenter
                }
                //spacing: 5
                //            Repeater {
                //                anchors {
                //                    left: parent.left
                //                    right: parent.right
                //                }
                //                model: 3
                Item {
                    id: msg
                    height: childrenRect.height
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                    PlasmaExtras.Heading {
                        id: date
                        level: 5
                        anchors {
                            //left: parent.left
                            right: parent.right
                        }
                        text: model.date
                        color: "#666666"
                    }
                    PlasmaComponents.Label {
                        anchors {
                            top: date.bottom
                            left: parent.left
                            right: parent.right
                            margins: 10
                        }
                        wrapMode: Text.Wrap
                        textFormat: Text.RichText
                        text: model.text
                    }
                }
            }
        }
    }
}
