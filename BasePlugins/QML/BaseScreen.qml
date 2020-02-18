import QtQuick 2.0
import BasePlugins 1.0

Item {
    property string screenName: "HomeScreen"
    property string backKeyAction: ""
    Component.onCompleted: {
        console.assert(screenName !== "", "Screen name is required");
    }

    onVisibleChanged: {
        Settings.backKeyAction = backKeyAction
        if (visible && screenName !== ""){
            Settings.activeScreenName = screenName
        }
    }
    onScreenNameChanged: {
        if (visible && screenName !== ""){
            Settings.activeScreenName = screenName
        }
    }
    onBackKeyActionChanged: {
        Settings.backKeyAction = backKeyAction
    }

    focus: true

    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            event.accepted = true
            backKeyClicked()
        }
    }
    signal backKeyClicked()
    onBackKeyClicked: {
        Action.dispatch(Settings.backKeyAction)
    }
}
