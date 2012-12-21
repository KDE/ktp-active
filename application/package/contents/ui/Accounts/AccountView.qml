import QtQuick 1.1
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    width: parent
    height: parent

    ToolBar{
        id: toolbar
        width: parent
        height: 50
    }

    PlasmaExtras.Heading {
        id: header
        anchors.top: toolbar.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: i18n("Accounts list")
        color: "#666666"
    }

    AccountList {
        id: list
        anchors {
            top: header.bottom
            topMargin: 15
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            leftMargin: parent.width * 0.025
            rightMargin: parent.width * 0.025
        }
    }

}
