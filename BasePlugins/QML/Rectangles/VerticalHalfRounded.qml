import QtQuick 2.0
import BasePlugins 1.0

Item {
    width: 50 * Settings.dpiToPixelValue
    height: 300 * Settings.dpiToPixelValue
    property color controlColor: "white"
    property int controlRadius: 10 * Settings.dpiToPixelValue
    Rectangle {
        width: parent.width / 3 * 2
        height: parent.height
        color: controlColor
        radius: controlRadius
        anchors.right: parent.right
    }
    Rectangle {
        width: parent.width / 3 * 2
        height: parent.height
        color: controlColor
    }
}
