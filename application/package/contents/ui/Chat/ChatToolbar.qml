import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.extras 0.1 as PlasmaExtras

Item {
    height: 50

    PlasmaComponents.ToolBar {
        id: toolbar
        tools: content
        height: parent.height

    }
}



