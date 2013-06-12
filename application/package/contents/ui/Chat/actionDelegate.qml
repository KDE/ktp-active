import QtQuick 1.1

Item {
    height: text.paintedHeight + 13
    width: parent.parent.width
    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins:6
        id: text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: model.message
        font.italic: true
    }

    Rectangle {
        color: "#d5d5d5"
        height: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
}

