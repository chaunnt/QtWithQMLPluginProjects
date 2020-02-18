import QtQuick 2.0
import QtQuick.Controls 2.0
import BasePlugins 1.0

Rectangle {
    property bool selfDestroying: false  // whether this Toast will self-destroy when it is finished
    id: root

    readonly property real defaultTime: 3000
    property real time: defaultTime
    readonly property real fadeTime: 500

    function show(text, duration) {
        message.text = text;
        if (typeof duration !== "undefined") { // checks if parameter was passed
            time = Math.max(duration, 2 * fadeTime);
        }
        else {
            time = defaultTime;
        }
        animation.start();
    }
    //Make it inside parent
    width: parent.width * 80 / 100
    height: (Settings.baseButtonHeight > message.height + 10 * Settings.dpiToPixelValue) ? Settings.baseButtonHeight : message.height + 10 * Settings.dpiToPixelValue
    opacity: 0
    color: "#222222"
    radius: 10 * Settings.dpiToPixelValue

    Bootstrap_Text {
        id: message
        color: "white"
        wrapMode: Text.Wrap
        anchors.centerIn: parent
        width: parent.width > implicitWidth + 10 * Settings.dpiToPixelValue ? implicitWidth + 10 * Settings.dpiToPixelValue : parent.width
    }
    SequentialAnimation on opacity {
        id: animation
        running: false


        NumberAnimation {
            to: .9
            duration: fadeTime
        }

        PauseAnimation {
            duration: time - 2 * fadeTime
        }

        NumberAnimation {
            to: 0
            duration: fadeTime
        }

        onRunningChanged: {
            if (!running && selfDestroying) {
                root.destroy();
            }
        }
    }
}
