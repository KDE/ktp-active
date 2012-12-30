import QtQuick 1.1
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: rootAccountView

    signal close;

    Column {
        spacing: 5
        height: parent.height
        anchors {
            left: parent.left
            right: parent.right
        }

        ToolBar{
            id: toolbar
            anchors.left: parent.left
            anchors.right: parent.right

            onHomeSignal: { toolbar.state = "DEFAULT"; list.selectedAccountIndex = -1 }
            onAddSignal:  { toolbar.state = "FORM" }
            onEditSignal: { toolbar.state = "FORM" }
            onSaveSignal: { toolbar.state = "DEFAULT"; list.selectedAccountIndex = -1 }
            onCloseSignal:{ close() }
        }

        PlasmaExtras.Heading {
            id: header
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n("Accounts list")
            color: "#666666"
        }

        AccountList {
            id: list
            width: parent.width * 0.9
            height: parent.height - header.height - toolbar.height - 10
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            onSelectedItem: toolbar.state = "EDIT";
        }
    }


}
