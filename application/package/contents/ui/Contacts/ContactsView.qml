import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: rootContactView
    width: 100
    height: 62

// Debuge rectangle
//    Rectangle {
//        anchors.fill: parent
//        opacity: 0.4
//        color: "lightsteelblue"
//    }

    ContactsToolbar {
        id: toolbar
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        onSettingButtonClicked:
            if (settingsButtonCheck) {
                settingsBar.opacity = 1
                settingsBar.width = 60
            } else {
                settingsBar.opacity = 0
                settingsBar.width = 0
            }
    }

    ContactsSidebar {
        id: settingsBar
        anchors {
            topMargin: 2
            top: toolbar.bottom
            bottom: parent.bottom
            left: parent.left
        }
    }

    ContactsList {
        anchors {
            margins: 2
            top: toolbar.bottom
            bottom: parent.bottom
            left: settingsBar.right
            right: parent.right
        }
    }
    /*
    PlasmaComponents.Dialog {
        id: statusChooser
        content: picker

        Column {
            id: picker
            PlasmaExtras.Heading {
                id: title
                anchors.horizontalCenter: parent.horizontalCenter
                text: i18n("Pick your status")
            }
            PlasmaComponents.ButtonColumn {
                anchors.top: title.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                PlasmaComponents.RadioButton {
                    text: i18n("Online")
                }
                PlasmaComponents.RadioButton {
                    text: i18n("Offline")
                }
            }
            PlasmaComponents.Button {
                text: i18n("Change status")
            }
        }
    }
    */
}
