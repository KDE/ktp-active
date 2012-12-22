import QtQuick 1.1
import org.kde.metadatamodels 0.1 as MetadataModels
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.mobilecomponents 0.1 as MobileComponents
import org.kde.draganddrop 1.0
import org.kde.qtextracomponents 0.1

Item {
    id: rootToolbar
    anchors.left: parent.left
    anchors.right: parent.right
    height: childrenRect.height + 20

    state: "DEFAULT"

    signal closeSignal;

    // Debug rectangle
//    Rectangle {
//        color: "orange"
//        opacity: 0.3
//        anchors.fill: parent
//    }

    PlasmaComponents.ToolBar {
        id: toolbarMenu
        tools: toolbar

        PlasmaComponents.ToolBarLayout
        {
            id: toolbar
            spacing: 10
            PlasmaComponents.ToolButton {
                id: homeButton
                iconSource: "go-home"
                flat: false
                height: addButton.height * 1.5
                width: addButton.height * 1.5
                onClicked: { rootToolbar.state = "DEFAULT" }
                anchors.verticalCenter: toolbar.verticalCenter
            }

            PlasmaComponents.ToolButton {
                id: addButton
                text: i18n("Add account")
                flat: false
                onClicked: { rootToolbar.state = "FORM" }
                anchors.verticalCenter: toolbar.verticalCenter
            }

            // Hidden buttons
            PlasmaComponents.ToolButton {
                id: editButton
                text: i18n("Edit account")
                flat: false
                anchors.verticalCenter: toolbar.verticalCenter
            }
            PlasmaComponents.ToolButton {
                id: deleteButton
                text: i18n("Delete account")
                flat: false
                anchors.verticalCenter: toolbar.verticalCenter
            }
            PlasmaComponents.ToolButton {
                id: onoffButton
                height: addButton.height * 1.5
                width: addButton.height * 1.5
                iconSource: checked ? "user-online" : "user-offline"
                flat: false
                checkable: true
                anchors.verticalCenter: toolbar.verticalCenter
            }

            PlasmaComponents.ToolButton {
                id: saveButton
                text: i18n("Save")
                flat: false
                anchors.verticalCenter: toolbar.verticalCenter
                anchors.right: cancelButton.left
                anchors.rightMargin: 10
            }

            PlasmaComponents.ToolButton {
                // Prints warning but prevents disappering when changing visibility of previous elements
                anchors.right: toolbar.right
                id: cancelButton
                text: i18n("Close")
                flat: false
                anchors.verticalCenter: toolbar.verticalCenter
                onClicked: closeSignal();
            }
        }
    }

    states : [
        State {
            name: "DEFAULT"
            PropertyChanges { target: addButton; visible: true }
            PropertyChanges { target: editButton; visible: false }
            PropertyChanges { target: deleteButton; visible: false }
            PropertyChanges { target: onoffButton; visible: false }
            PropertyChanges { target: saveButton; visible: false }
        },
        State {
            name: "FORM"
            PropertyChanges { target: addButton; visible: false }
            PropertyChanges { target: editButton; visible: false }
            PropertyChanges { target: deleteButton; visible: false }
            PropertyChanges { target: onoffButton; visible: false }
            PropertyChanges { target: saveButton; visible: true }
        },
        State {
            name: "EDIT"
            PropertyChanges { target: addButton; visible: true }
            PropertyChanges { target: editButton; visible: true }
            PropertyChanges { target: deleteButton; visible: true }
            PropertyChanges { target: onoffButton; visible: true }
            PropertyChanges { target: saveButton; visible: false }
        }
    ]



//    Row {
//        id: devicesFlow
//        spacing: 4
//        anchors {
//            // bottom: parent.bottom
//            verticalCenter: parent.verticalCenter
//            left: parent.left
//        }

//        property int itemCount: 1
//        property string currentUdi

//        Item {
//            width: theme.largeIconSize
//            height: width
//            PlasmaComponents.ToolButton {
//                id: upButton
//                anchors.fill: parent
//                flat: false
//                iconSource: "go-up"
//                visible: currentUdi != "" &&
//                    devicesSource.data[currentUdi] &&
//                    dirModel.url.indexOf(devicesSource.data[currentUdi]["File Path"]) !== -1 &&
//                    "file://" + devicesSource.data[currentUdi]["File Path"] !== dirModel.url
//                onClicked: dirModel.url = dirModel.url+"/.."
//            }
//        }

//        PlasmaComponents.ToolButton {
//            id: localButton
//            width: theme.mediumIconSize + 10
//            height: width
//            iconSource: "drive-harddisk"
//            checked: fileBrowserRoot.model == metadataModel
//            onClicked: checked = true
//            onCheckedChanged: {
//                if (checked) {
//                    for (var i = 0; i < devicesFlow.children.length; ++i) {
//                        var child = devicesFlow.children[i]
//                        if (child != localButton && child.checked !== undefined) {
//                            child.checked = false
//                        }
//                    }
//                    for (child in devicesFlow.children) {
//                        if (child != localButton) {
//                            child.checked = false
//                        }
//                    }
//                    fileBrowserRoot.model = metadataModel
//                    //nepomuk db, not filesystem
//                    resourceBrowser.currentUdi = ""
//                }
//            }
//            DropArea {
//                enabled: !parent.checked
//                anchors.fill: parent
//                onDragEnter: parent.flat = false
//                onDragLeave: parent.flat = true
//                onDrop: {
//                    parent.flat = true
//                    application.copy(event.mimeData.urls, "~")
//                }
//            }
//        }


//        Repeater {
//            id: devicesRepeater
//            model: devicesModel

//            delegate: PlasmaComponents.ToolButton {
//                id: removableButton
//                width: theme.mediumIconSize + 10
//                height: width
//                visible: devicesSource.data[udi]["Removable"] == true
//                iconSource: model["icon"]
//                onClicked: checked = true
//                onCheckedChanged: {
//                    if (checked) {
//                        for (var i = 0; i < devicesFlow.children.length; ++i) {
//                            var child = devicesFlow.children[i]
//                            if (child != removableButton && child.checked !== undefined) {
//                                child.checked = false
//                            }
//                        }
//                        resourceBrowser.currentUdi = udi

//                        if (devicesSource.data[udi]["Accessible"]) {
//                            dirModel.url = devicesSource.data[udi]["File Path"]

//                            fileBrowserRoot.model = dirModel
//                        } else {
//                            var service = devicesSource.serviceForSource(udi);
//                            var operation = service.operationDescription("mount");
//                            service.startOperationCall(operation);
//                        }
//                    }
//                }
//                DropArea {
//                    enabled: !parent.checked
//                    anchors.fill: parent
//                    onDragEnter: parent.flat = false
//                    onDragLeave: parent.flat = true
//                    onDrop: {
//                        application.copy(event.mimeData.urls, devicesSource.data[udi]["File Path"])
//                        parent.flat = true
//                    }
//                }
//            }
//        }

//        PlasmaComponents.ToolButton {
//            id: trashButton
//            width: theme.mediumIconSize + 10
//            height: width
//            parent: devicesFlow
//            iconSource: "user-trash"
//            onClicked: checked = true
//            onCheckedChanged: {
//                if (checked) {
//                    for (var i = 0; i < devicesFlow.children.length; ++i) {
//                        var child = devicesFlow.children[i]
//                        if (child != trashButton && child.checked !== undefined) {
//                            child.checked = false
//                        }
//                    }
//                    resourceBrowser.currentUdi = ""

//                    dirModel.url = "trash:/"

//                    fileBrowserRoot.model = dirModel
//                }
//            }
//            DropArea {
//                enabled: !parent.checked
//                anchors.fill: parent
//                onDragEnter: parent.flat = false
//                onDragLeave: parent.flat = true
//                onDrop: {
//                    parent.flat = true
//                    application.trash(event.mimeData.urls)
//                }
//            }
//        }
//    }

//    MobileComponents.ViewSearch {
//        id: searchBox
//        anchors.centerIn: parent
//        visible: fileBrowserRoot.model == metadataModel

//        onSearchQueryChanged: {
//            if (searchQuery.length > 3) {
//                // the "*" are needed for substring match.
//                metadataModel.extraParameters["nfo:fileName"] = "*" + searchBox.searchQuery + "*"
//            } else {
//                metadataModel.extraParameters["nfo:fileName"] = ""
//            }
//        }
//        busy: metadataModel.running
//    }

//    Item {
//        anchors {
//            bottom: parent.bottom
//        }
//        x: parent.width - resourceBrowser.visibleDrawerWidth + toolBar.margins.left
//        z: 900
//        PlasmaComponents.ButtonRow {
//            id: tabsRow
//            anchors {
//                bottom: parent.bottom
//                bottomMargin: - toolBar.margins.bottom
//            }
//            z: 900

//            height: theme.defaultFont.mSize.height * 1.6
//            exclusive: true

//            PlasmaComponents.ToolButton {
//                id: mainTab
//                text: i18n("Filters")
//                flat: false
//                width: sidebar.width / 3
//                height: parent.height - 1
//                onCheckedChanged: {
//                    if (checked) {
//                        sidebarTabGroup.currentTab = categorySidebar
//                    }
//                }
//            }

//            PlasmaComponents.ToolButton {
//                text: i18n("Time")
//                enabled: fileBrowserRoot.model == metadataModel
//                flat: false
//                width: sidebar.width / 3
//                height: parent.height - 1
//                onCheckedChanged: {
//                    if (checked) {
//                        sidebarTabGroup.currentTab = timelineSidebar
//                    }
//                }
//            }

//            PlasmaComponents.ToolButton {
//                text: i18n("Tags")
//                enabled: fileBrowserRoot.model == metadataModel
//                flat: false
//                width: sidebar.width / 3
//                height: parent.height - 1
//                onCheckedChanged: {
//                    if (checked) {
//                        sidebarTabGroup.currentTab = tagsSidebar
//                    }
//                }
//            }
//            //fake: just to show something then overshooting
//            PlasmaComponents.ToolButton {
//                flat: false
//                width: sidebar.width / 3
//                height: parent.height-1
//                enabled: false
//                opacity: 1
//            }
//        }
//    }

//    PlasmaComponents.ToolButton {
//        id: emptyTrashButton
//        width: theme.largeIconSize
//        height: width
//        anchors {
//            right: tabsRow.left
//            verticalCenter: parent.verticalCenter
//            rightMargin: y
//        }
//        visible: fileBrowserRoot.model == dirModel && dirModel.url == "trash:/"
//        enabled: dirModel.count > 0
//        iconSource: "trash-empty"
//        onClicked: application.emptyTrash()
//    }

}
