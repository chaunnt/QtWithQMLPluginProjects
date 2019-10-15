import QtQuick 2.0
import BasePlugins 1.0

Item {
    property string screenName: ""
    Component.onCompleted: {
        console.assert(screenName !== "", "Screen name is required");
    }

    onVisibleChanged: {
        if (visible && screenName !== ""){
            Settings.activeScreenName = screenName
        }
    }
    onScreenNameChanged: {
        if (visible && screenName !== ""){
            Settings.activeScreenName = screenName
        }
    }
}
