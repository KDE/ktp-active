import QtQuick 1.1

Item {
    height:messageText.paintedHeight + 13 + messageImage.height + (messageImage.height ? 12 : 0)
    width: parent.parent.width

    Behavior on height {
        NumberAnimation { duration: 100 }
    }

    Rectangle {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: senderLabel.right
        color: model.type ? "#e4ecf7" : "#bfdc84"
    }

    Text {
        id: senderLabel
        text: model.senderAlias
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 7
        width: 140

        elide: Text.ElideRight
        color: "#606060"
        //                verticalAlignment: Text.AlignVCenter
    }


    Rectangle {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: senderLabel.right
        anchors.right: parent.right

        color: model.type ? "#f3f7fb" : "#f5fae9"
    }

    Text {
        id: messageText
        anchors.top: parent.top
        anchors.left:senderLabel.right
        anchors.right: timeStampLabel.left
        anchors.margins: 6
        text: model.text
        wrapMode: Text.WordWrap
    }

    Image {
        id: messageImage
        fillMode: Image.PreserveAspectFit
        anchors.margins: 6
        anchors.top: messageText.bottom
        anchors.left: messageText.left
        anchors.right: messageText.right
        source: (model.image ? model.image : "")

        MouseArea {
            anchors.fill: messageImage
            onClicked: console.log(messageImage.source)
        }
    }

    Text {
        id: timeStampLabel
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 6
        text: "13:03"
        color: "#A0A0A0"
    }

    //bars on bottom /side
    Rectangle {
        color: "#d5d5d5"
        height: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
    Rectangle {
        color: "#d5d5d5"
        width: 1
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: senderLabel.right
    }
}

