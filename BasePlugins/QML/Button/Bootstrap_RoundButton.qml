import QtQuick 2.0
import BasePlugins 1.0
Item {
    id: btnRoundButton
    property int buttonHeight
    property int buttonWidth
    property color buttonColor: "white"
    property color buttonBorderColor: "red"
    property color buttonTextColor: Theme.lottery.gameButtonTextColor
    property string buttonText: ""
    property string buttonIcon: ""
    property double buttonRadius: 5 * Settings.dpiToPixelValue
    property int buttonBorderWidth: 1
    property int displayType: BasePlugins.TextOnly
    property int shapeType: BasePlugins.CircleButton
    property alias font: txtButtonLabel.font

    signal clicked()

    width: buttonWidth !== undefined ? buttonWidth : height
    height: buttonHeight !== undefined ? buttonHeight : Settings.baseButtonHeight
    Rectangle {
        width: parent.width - buttonBorderWidth * 2
        height: parent.height - buttonBorderWidth * 2
        color: buttonColor
        clip: true
        radius: shapeType !== BasePlugins.CircleButton ? buttonRadius : width / 2
        border.color: buttonBorderColor
        border.width: buttonBorderWidth
        anchors.centerIn: parent
        Bootstrap_Text {
            id:txtButtonLabel
            text: buttonText
            anchors.centerIn: displayType === BasePlugins.TextOnly ? parent : undefined
            anchors.left: displayType === BasePlugins.TextOnly ? undefined : parent.left
            visible: displayType !== BasePlugins.IconOnly
            color: buttonTextColor
        }
        Image {
            source: buttonIcon
            width: height
            height: parent.height * 80 / 100
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: displayType === BasePlugins.IconOnly ? parent : undefined
            anchors.right: displayType !== BasePlugins.IconOnly ? undefined : parent.right
            visible: displayType !== BasePlugins.TextOnly
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            btnRoundButton.clicked()
        }
    }
}
