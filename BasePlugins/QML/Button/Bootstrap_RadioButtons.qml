import QtQuick 2.0
import BasePlugins 1.0

Item {
    id: itemRadioButton
    property string title: ""
    property color titleColor: Theme.general.baseTextColor
    property int fontSize: Theme.general.normalFontSize
    property bool selected: false
    property color backgroundColor: "white"
    property color selectedColor: Theme.general.baseSelectingColor
    property color backgroundBorderColor: Theme.general.baseColor

    signal clicked()
    width: recRadio.width + txtRadioTitle.width + 15 * Settings.dpiToPixelValue
    height: txtRadioTitle.height + 10 * Settings.dpiToPixelValue
    Rectangle {
        id: recRadio
        width: height
        height: parent.height
        color: backgroundColor
        border.color: backgroundBorderColor
        border.width: 1
        radius: height / 2
        Rectangle {
            width: parent.width * 60 / 100
            height: width
            color: selectedColor
            anchors.centerIn: parent
            radius: height / 2
            visible: selected
        }
    }
    Text {
        id: txtRadioTitle
        text: title
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        color: titleColor
        font.pixelSize: fontSize
        anchors.left: recRadio.right
        anchors.leftMargin: 5 * Settings.dpiToPixelValue
        anchors.verticalCenter: parent.verticalCenter
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            itemRadioButton.clicked()
        }
    }
}
