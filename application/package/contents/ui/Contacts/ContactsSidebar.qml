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

    Behavior on opacity {
        PropertyAnimation { duration: 750; easing.type: Easing.InOutElastic; easing.amplitude: 2.0; easing.period: 1.5 }
    }
    Behavior on width {
        PropertyAnimation { duration: 750; easing.type: Easing.InOutElastic; easing.amplitude: 2.0; easing.period: 1.5 }
    }
}
