import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    height: 50

    signal settingsClicked;
    signal statusClicked;

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#cccccc"
        gradient: regularGradient

        Gradient {
            id: regularGradient
            GradientStop { position: 0.0; color: "#dddddd" }
            GradientStop { position: 0.85; color: "#eeeeee" }
            GradientStop { position: 1.0; color: "#ffffff" }
        }
    }

    ToolbarContent {
        id: content
        anchors.fill: parent
    }

    Rectangle {
        height: 1
        width: parent.width
        color: "#cccccc"
        anchors.top: parent.bottom
        anchors.topMargin: -1
    }
}



