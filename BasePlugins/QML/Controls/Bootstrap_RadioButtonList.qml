import QtQuick 2.0
import BasePlugins 1.0

Item {
    id:itemRadioList
    property string title: ""
    property color fontColor: Theme.general.baseTextColor
    property int fontSize: Theme.general.normalFontSize
    property var modelList
    property int maxWidth: 100 * Settings.dpiToPixelValue
    property string selectedValue: ""
    width: maxWidth
    height: colRadioList.implicitHeight
    Column {
        id: colRadioList
        width: parent.width
        height: implicitHeight
        spacing: 5 * Settings.dpiToPixelValue
        x: 5 * Settings.dpiToPixelValue
        Text {
            text: title
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            color: fontColor
            font.pixelSize: fontSize
        }
        Repeater {
            model: modelList
            delegate: Bootstrap_RadioButtons {
                title: modelData
                titleColor: fontColor
                selected: selectedValue === title
                Component.onCompleted: {
                    if (width > maxWidth){
                        maxWidth = width
                    }
                }
                onClicked: {
                    if (selected) {
                        selectedValue = ""
                    }else{
                        selectedValue = title
                    }
                }
            }
        }
    }
}
