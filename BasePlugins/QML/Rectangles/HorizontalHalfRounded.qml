import QtQuick 2.0
import BasePlugins 1.0

Item {
    width: 300 * Settings.dpiToPixelValue
    height: 50 * Settings.dpiToPixelValue
    property color controlColor: "white"
    property int controlRadius: 10 * Settings.dpiToPixelValue
    Rectangle {
        width: parent.width
        height: parent.height  / 3 * 2
        color: controlColor
        radius: controlRadius
        anchors.top: parent.top
    }
    Rectangle {
        width: parent.width
        height: parent.height  / 3 * 2
        color: controlColor
        anchors.bottom: parent.bottom
    }
}
