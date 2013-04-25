// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.telepathy 0.1 as KTp

PlasmaComponents.TabGroup
{
    id: root

    Row {
        anchors.fill: parent
        Repeater {
            model: KTp.ConversationsModel {
                id: conversationsModel
            }

            delegate: Chat {
                anchors.fill: parent
            }
        }
    }

    Component.onCompleted: {
        telepathyManager.registerClient(conversationsModel, "KTp.active");
    }
}
