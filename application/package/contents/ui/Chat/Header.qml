import QtQuick 1.1

Rectangle {
    height: 40

//    Image {
//        anchors.fill: parent
//        fillMode: Image.TileHorizontally
//        source: "Resources/images/steelHeading.jpg"
//    }

    Image {
        id: avatarImage

        fillMode: Image.PreserveAspectFit

        source: "/usr/share/icons/oxygen/48x48/apps/telepathy-kde.png"
        smooth: true

        anchors {
            top: parent.top
            left: parent.left
            bottom:parent.bottom

            margins: 5
        }
    }

    Rectangle {
        color: "#d5d5d5"
        height:2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }

    Text {
        id: mainText
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: avatarImage.right
//        anchors.right: parnt.right
        anchors.margins: 5

        font.pixelSize: 18
        verticalAlignment: Text.AlignVCenter
//        color: "#606060"
        font.bold: true

        text: "#kde-telepathy"
        elide: Text.ElideRight
    }

    Text {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: mainText.right
        anchors.right: parent.right
        anchors.margins: 5

        verticalAlignment: Text.AlignVCenter
        color: "#606060"

        text: "https://projects.kde.org/telepathy | http://community.kde.org/KTp/Getting_Involved"
        elide: Text.ElideRight

    }
}
