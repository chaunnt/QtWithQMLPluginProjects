import QtQuick 2.0
import QtQuick.Controls 2.0
import BasePlugins 1.0

InkWellRectangle {
    id:recBootstrapButton

    property string buttonText: ""
    property color buttonTextColor: Theme.general.baseTextColor
    property int buttonTextSize: Theme.general.normalFontSize
    property string iconUrl: ""
    property color iconColor: "white"
    property int buttonWidth: 0
    width: buttonWidth === 0 ? txtDisplay.width + imgIcon.width + 15 * Settings.dpiToPixelValue : buttonWidth
    height: Settings.baseButtonHeight
    radius: 5 * Settings.dpiToPixelValue
    color: Theme.general.baseColor
    Text{
        id: txtDisplay
        text: buttonText
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        height: parent.height
        anchors.left: imgIcon.right
        anchors.leftMargin: 5 * Settings.dpiToPixelValue
        color: buttonTextColor
        font.pixelSize: buttonTextSize
        elide: Text.ElideRight
        width: buttonWidth === 0 ? implicitWidth : (parent.width - imgIcon.width - 15 * Settings.dpiToPixelValue)
    }
    MaskIcon {
        id: imgIcon
        iconHeight: parent.height / 2
        fillMode: Image.PreserveAspectFit
        iconUrl: recBootstrapButton.iconUrl
        iconColor: recBootstrapButton.iconColor
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5 * Settings.dpiToPixelValue

    }
}


