import QtQuick 1.1
import org.kde.plasma.mobilecomponents 0.1 as PlasmaMobile

PlasmaMobile.OverlayDrawer {
    Text {
        text: "main content"
    }
    drawer: Rectangle {
        color: "black"
        width: 100
        height: 100
    }
}
