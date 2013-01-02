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
    width: 100
    height: Math.max(avatar.height, messageBallon.height)

    property bool direction: true

    Image {
        id: avatar
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        source: "../../images/im-user.png"
        LayoutMirroring.enabled: direction
    }

//    Image {
//        source: direction ? "image://appbackgrounds/shadow-right" : "image://appbackgrounds/shadow-left"
//        fillMode: Image.TileVertically
//        anchors {
//            top: parent.top
//            bottom: parent.bottom
//            right: messageBallon.left
//            rightMargin: -1
//        }
//        LayoutMirroring.enabled: direction
//    }

    PlasmaCore.FrameSvgItem {
        id: messageBallon
        width: parent.width - 2*avatar.width - 20
        height: content.height * 1.2
        anchors.horizontalCenter: parent.horizontalCenter
        imagePath: "dialogs/background"

        Text {
            anchors {
                top: parent.top
                left: parent.left
                margins: 20
            }
            text: "John Doe writes"
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
            Repeater {
                anchors {
                    left: parent.left
                    right: parent.right
                }
                model: 3
                Item {
                    id: msg
                    height: childrenRect.height * 1.1
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                    Text {
                        id: date
                        anchors {
                            //left: parent.left
                            right: parent.right
                        }
                        text: "31.12.2012 10:02"
                        font.pointSize: 6
                        color: "#666666"
                    }
                    Text {
                        anchors {
                            top: date.bottom
                            left: parent.left
                            right: parent.right
                            margins: 10
                        }
                        wrapMode: Text.Wrap
                        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac turpis mi, ac malesuada libero. Morbi aliquam, sapien accumsan lobortis fermentum, turpis massa auctor felis, sit amet luctus lacus tortor et felis. Aenean placerat tincidunt est sit amet rhoncus. Aenean massa tellus, vestibulum sed rutrum ac, ultricies sit amet felis. Fusce at felis nunc, quis fermentum mi. Praesent sed diam."
                    }
                }


            }
        }
    }
}
