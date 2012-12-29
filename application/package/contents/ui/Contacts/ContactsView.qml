import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

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
                    name: "No name"
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }
                ContactGroup {
                    name: "No name 2"
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }
                ContactGroup {
                    name: "No name 3"
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }
            }
        }
    }

}
