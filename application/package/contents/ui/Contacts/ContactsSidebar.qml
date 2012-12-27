import QtQuick 1.1

Rectangle {
    width: 0
    opacity: 0
    gradient: background

    Gradient {
        id: background
        GradientStop { position: 0.0; color: "#ffffff" }
        GradientStop { position: 0.5; color: "#bbbbbb" }
        GradientStop { position: 1.0; color: "#ffffff" }
    }

    state: "offHints"


    SidebarDelegate {
        id: hintButton
        text: "Hint"
        iconSource: "help-hint"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 10
        onButtonClicked: (parent.state == "onHints") ? parent.state = "offHints" : parent.state = "onHints"
        //onButtonClicked: console.debug("gotThis")
    }

    SidebarDelegate {
        id: addContactButton
        text: "Add new contact"
        iconSource: "list-add-user"
        anchors.left: parent.left
        anchors.top: hintButton.bottom
        //onButtonClicked: hintOn != hintOn
    }
    SidebarDelegate {
        id: removeContactButton
        text: "Delete contact"
        iconSource: "list-remove-user"
        anchors.left: parent.left
        anchors.top: addContactButton.bottom
        //onButtonClicked: hintOn != hintOn
    }

    SidebarDelegate {
        id: addGroupButton
        text: "Add new group"
        iconSource: "user-group-new"
        anchors.left: parent.left
        anchors.top: removeContactButton.bottom
        //onButtonClicked: hintOn != hintOn
    }
    SidebarDelegate {
        id: removeGroupButton
        text: "Delete group"
        iconSource: "user-group-delete"
        anchors.left: parent.left
        anchors.top: addGroupButton.bottom
        //onButtonClicked: hintOn != hintOn
    }
    SidebarDelegate {
        id: accountsButton
        text: "Accounts"
        iconSource: "bookmarks-organize"
        anchors.left: parent.left
        anchors.top: removeGroupButton.bottom
        //onButtonClicked: hintOn != hintOn
    }



    states: [
        State {
            name: "onHints"
            PropertyChanges { target: addContactButton; hintOn: true }
            PropertyChanges { target: removeContactButton; hintOn: true }
            PropertyChanges { target: addGroupButton; hintOn: true }
            PropertyChanges { target: removeGroupButton; hintOn: true }
            PropertyChanges { target: accountsButton; hintOn: true }
            PropertyChanges { target: hintButton; hintOn: true }
        },
        State {
            name: "offHints"
            PropertyChanges { target: addContactButton; hintOn: false }
            PropertyChanges { target: removeContactButton; hintOn: false }
            PropertyChanges { target: addGroupButton; hintOn: false }
            PropertyChanges { target: removeGroupButton; hintOn: false }
            PropertyChanges { target: hintButton; hintOn: false }
            PropertyChanges { target: accountsButton; hintOn: false }
        }

    ]

    Behavior on opacity {
        PropertyAnimation { duration: 750; easing.type: Easing.InOutElastic; easing.amplitude: 2.0; easing.period: 1.5 }
    }
    Behavior on width {
        PropertyAnimation { duration: 750; easing.type: Easing.InOutElastic; easing.amplitude: 2.0; easing.period: 1.5 }
    }
}
