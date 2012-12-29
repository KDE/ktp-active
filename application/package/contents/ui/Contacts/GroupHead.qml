import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Rectangle {
    id: groupHeadRoot
    height: 45
    border.color: "#cccccc"

    property alias text: groupLabel.text
    property bool  expanded: true

    Gradient {
        id: regularGradient
        GradientStop { position: 0.0; color: "#dddddd" }
        GradientStop { position: 0.85; color: "#cccccc" }
        GradientStop { position: 1.0; color: "#bbbbbb" }
    }

    Gradient {
        id: highlightGradient
        GradientStop { position: 0.0; color: "#bbbbbb" }
        GradientStop { position: 0.85; color: "#cccccc" }
        GradientStop { position: 1.0; color: "#dddddd" }
    }

    gradient: expanded ? regularGradient : highlightGradient

    Image {
        id: arrowIcon
        source: expanded ? "../../images/arrow-down.png" : "../../images/arrow-right.png"
        width: theme.smallIconSize
        height: theme.smallIconSize
        anchors {
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
    }

    PlasmaComponents.Label {
        id: groupLabel
        anchors.centerIn: parent
        anchors.margins: 10
        font.weight: Font.Bold
        text: "No name group"
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: false
        onClicked: groupHeadRoot.expanded = !groupHeadRoot.expanded
    }
}
