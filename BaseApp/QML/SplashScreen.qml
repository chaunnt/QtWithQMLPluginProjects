import QtQuick 2.0
import BasePlugins 1.0

Item {
    Image {
        id: imgLogo
        source: "qrc:/Applications/Images/AppLogo.png"
        fillMode: Image.PreserveAspectFit
        width: parent.width / 4 * 3
        anchors.centerIn: parent
    }

    Timer {
        id: tmStartApp
        interval: 2000
        repeat: false
        running: true
        onTriggered: {
            Action.dispatch(ActionStrings.baseApp.startInitSequence)
        }
    }
}
