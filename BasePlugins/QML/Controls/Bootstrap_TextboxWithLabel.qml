import QtQuick 2.0
import QtQuick.Controls 2.0
import BasePlugins 1.0

TextField {
    id:txtInputTextField
    height: Settings.baseButtonHeight
    property double textBoxRadius: 5 * Settings.dpiToPixelValue
    property string previousText: ""
    property int dataPoint: 0
    property string pointIcon:""
    background: Rectangle{
        id:bgText
        color: "transparent"
        radius: textBoxRadius
        anchors.fill: parent
        border.color: Theme.general.baseSelectingColor
        border.width: 1
        Rectangle{
            width: txtHeaderText.width + 10 * Settings.dpiToPixelValue
            height: txtHeaderText.height + 6 * Settings.dpiToPixelValue
            color: bgText.border.color
            y: bgText.y - height / 2
            x: textBoxRadius
            visible: txtInputTextField.text !== ""
            radius: 5 * Settings.dpiToPixelValue
            Text {
                id:txtHeaderText
                text: txtInputTextField.placeholderText
                visible: txtInputTextField.text !== ""
                font.pixelSize: 9 * Settings.dpiToPixelValue
                color: txtInputTextField.activeFocus
                       ? Theme.general.baseTextColor
                       : Theme.general.baseUnSelectedTextColor
                anchors.centerIn: parent
            }
        }
    }
    font.pixelSize: 15 * Settings.dpiToPixelValue
    Rectangle{
        width: txtPoint.width + imgStar.width + 5 * Settings.dpiToPixelValue
        height: txtPoint.height
        color: "white"
        x: txtPoint.x
        y: txtPoint.y
        visible: dataPoint > 0
    }
    Text {
        id:txtPoint
        text: "+ " + dataPoint
        color: bgText.border.color
        font.pixelSize: txtInputTextField.font.pixelSize
        y:parent.height / 2 - height / 2
        anchors.right: imgStar.left
        anchors.rightMargin: 5 * Settings.dpiToPixelValue
        visible: dataPoint > 0
    }
    Image {
        id: imgStar
        source: pointIcon
        height: parent.height / 2
        width: height
        y:parent.height / 2 - height / 2
        anchors.right: parent.right
        anchors.rightMargin: 3 * Settings.dpiToPixelValue
        visible: dataPoint > 0
    }
    onActiveFocusChanged: {
        if(activeFocus){
            bgText.border.color = Theme.general.baseColor
        }else{
            bgText.border.color = Theme.general.baseSelectingColor
        }
    }
}
