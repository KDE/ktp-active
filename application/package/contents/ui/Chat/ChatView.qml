import QtQuick 1.1

Item {
    width: 100
    height: 62

    Rectangle {
        anchors.fill: parent
        opacity: 0.4
        color: "yellow"
    }

    ChatToolbar {
        id: toolbar
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }
}
