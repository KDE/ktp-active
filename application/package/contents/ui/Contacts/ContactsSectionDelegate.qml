import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Component {
    id: entrySection
    Rectangle {
        id: signleEntry
        anchors.left: parent.left
        anchors.right: parent.right
        height: 40
        border.color: "#cccccc"
        color: "lightsteelblue"

        Gradient {
            id: regularGradient
            GradientStop { position: 0.0; color: "#dddddd" }
            GradientStop { position: 0.85; color: "#cccccc" }
            GradientStop { position: 1.0; color: "#bbbbbb" }
        }

        gradient: regularGradient

        PlasmaComponents.Label {
            anchors.centerIn: parent
            anchors.margins: 10
            font.weight: Font.Bold
            text: section == 1 ? "Example Group" : "Another Group"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: false
            //onClicked:
        }
    }
}

