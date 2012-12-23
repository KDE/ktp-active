import QtQuick 1.1
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: rootAccountView
    width: parent
    height: parent

    Column {
        spacing: 5
        anchors.fill: parent
        ToolBar{
            id: toolbar
            onHomeSignal: { toolbar.state = "DEFAULT"; list.selectedAccountIndex = -1 }
            onAddSignal:  { toolbar.state = "FORM" }
            onEditSignal: { toolbar.state = "FORM" }
            onSaveSignal: { toolbar.state = "DEFAULT" }
            onCloseSignal: { root.dialogClose() }
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
            anchors.top: header.bottom
            anchors.topMargin: 15
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onSelectedItem: toolbar.state = "EDIT";
        }
    }


}
