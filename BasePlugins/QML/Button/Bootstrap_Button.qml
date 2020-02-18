import QtQuick 2.0
import QtQuick.Controls 2.0
import BasePlugins 1.0

InkWellRectangle {
    id:recBootstrapButton

    property string buttonText: ""
    property color buttonTextColor: Theme.general.baseTextColor
    property int buttonTextSize: Theme.general.normalFontSize
    width: txtDisplay.width + 10 * Settings.dpiToPixelValue
    height: Settings.baseButtonHeight
    radius: 5 * Settings.dpiToPixelValue
    color: Theme.general.baseColor
    Text{
        id: txtDisplay
        text: buttonText
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: parent
        color: buttonTextColor
        font.pixelSize: buttonTextSize
        elide: Text.ElideRight
    }
}


