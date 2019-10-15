import QtQuick 2.0
import QtQuick.Controls 2.0
import BasePlugins 1.0

Item {
    height: 100 * Settings.dpiToPixelValue
    width: 300 * Settings.dpiToPixelValue
    property int textBoxRadius: 5 * Settings.dpiToPixelValue
    property string iconSource: ""
    property alias text: txtContent.text
    property alias placeholderText: txtContent.placeholderText
    property alias echoMode: txtContent.echoMode
    Image {
        id: imgIcon
        source: iconSource
        height: parent.height / 2
        y: parent.height / 2 - height / 2
        x: textBoxRadius
        visible: iconSource !== ""
    }
    Rectangle{
        color: "transparent"
        radius: textBoxRadius
        border.color: Theme.general.baseColor
        border.width: 1
        anchors.fill: parent
    }
    TextField {
        id:txtContent
        height: parent.height
        font.pixelSize: Theme.general.normalFontSize
        anchors.left: iconSource !== "" ? imgIcon.right : parent.left
        anchors.leftMargin: 5 * Settings.dpiToPixelValue
        anchors.right: parent.right
        anchors.rightMargin: 5 * Settings.dpiToPixelValue
        background: Rectangle{
            color: "transparent"
        }
    }
}
