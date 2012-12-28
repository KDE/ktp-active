import QtQuick 1.1

import "../Toolbar"

Image {
    source: "image://appbackgrounds/contextarea"
    fillMode: Image.Tile

    Toolbar {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }
}
