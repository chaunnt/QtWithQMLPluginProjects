import QtQuick 2.0
import BasePlugins 1.0

Item {
    Image {
        id: imgLogo
        source: "qrc:/AppLogo.png"
        fillMode: Image.PreserveAspectFit
        width: parent.width / 4 * 3
        anchors.centerIn: parent
    }

    Timer {
        id: tmStartApp
        interval: 1000
        repeat: false
        running: true
        onTriggered: {
            Action.dispatch("FinishSplash")
        }
    }
}
