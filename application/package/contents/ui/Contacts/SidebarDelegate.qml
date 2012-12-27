import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents

Item {
    height: 50
    width: label.width + 60

    property alias iconSource: button.iconSource
    property alias text: label.text
    property bool hintOn: false

    signal buttonClicked;

    //onClicked: animateOpacity.start();

    onHintOnChanged: hintOn ? showingOn.start() : showingOff.start();
    //onHintOnChanged: console.debug("Hint")

    PropertyAnimation {
        id: showingOn
        target: hint
        properties: "opacity"
        from: 0
        to: 1
        duration: 750
    }

    PropertyAnimation {
        id: showingOff
        target: hint
        properties: "opacity"
        from: 1
        to: 0
        duration: 750
    }

    Rectangle {
        id: hint
        color: "white"
        opacity: 0
        width: label.width + 10
        anchors {
            left: button.right
            top: button.top
            bottom: button.bottom
        }

        PlasmaComponents.Label {
            id: label
            opacity: 1
            anchors.centerIn: parent
            text: "Cycek goni cycek"
        }
    }

    PlasmaComponents.ToolButton {
        id: button
        iconSource: "help-hint"
        width: parent.height * 0.9
        height: parent.height * 0.9

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 10
        }

        flat: false
        checkable: true
        onClicked: buttonClicked();
    }
}
