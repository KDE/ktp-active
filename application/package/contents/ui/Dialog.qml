import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    id: dialog
    visible: false
    property alias source: loader.source

    signal dialogOpen;
    signal dialogClosed;

    // Default size
    height: 100
    width:  100

    PlasmaCore.FrameSvgItem {
        anchors.fill: parent
        anchors.margins: 50

        Loader {
            id: loader
            anchors.fill: parent
            anchors.bottomMargin: 15
        }

        Connections {
            id: connection
            target:loader.item
            onClose: close()
            ignoreUnknownSignals: true
        }

        imagePath: "dialogs/background"
    }

    function open() {
        dialog.visible = true;
        dialogOpen();
    }

    function openUrl(url) {
        loader.source = url;
        dialog.visible = true;
        dialogOpen();
    }

    function close() {
        dialog.visible = false;
        dialogClosed();
    }
}
