import QtQuick 2.0

Rectangle {
    id: recInkWell
    signal clicked()
    clip: true
    Rectangle {
        id: recInkBackground
        width: height
        height: 1
        color: "#80b3b3b3"
        radius: width / 2
        z: 999
        anchors.centerIn: parent
    }
    PropertyAnimation {
        id: inkAnimation
        target: recInkBackground
        properties: "height"
        from: 0
        to: recInkWell.width > recInkWell.height ? recInkWell.width : recInkWell.height
        duration: 200
        onStarted: {
            recInkBackground.visible = true
        }

        onStopped: {
            recInkBackground.visible = false
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            inkAnimation.start()
            recInkWell.clicked()
        }
    }
}
