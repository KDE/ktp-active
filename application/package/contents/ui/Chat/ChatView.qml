import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Image {
    source: "image://appbackgrounds/contextarea"
    fillMode: Image.Tile

    ChatToolbar {
        anchors {
            margins: 15
            top: parent.top
            left: parent.left
            right: parent.right
        }


    }
}
