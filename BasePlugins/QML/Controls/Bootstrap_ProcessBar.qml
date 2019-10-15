import QtQuick 2.0
import BasePlugins 1.0

Item {
    property int percentageValue: 50
    property color fontColor: "white"
    property color backgroundColor: "lightgray"
    property color barColor: "#47B95C"

    Rectangle {
        anchors.fill: parent
        color: backgroundColor
        clip: true
        radius: 10
        Rectangle {
            id: recBar
            width: parent.width * percentageValue / 100
            height: parent.height
            color: barColor
            radius: 10
        }
        Text {
            id: txtPercentage
            text: percentageValue + "%"
            anchors.centerIn: parent
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: fontColor
        }
    }
    onPercentageValueChanged: {
        if (percentageValue === 100){
            Action.dispatch(ActionStrings.dialogActions.processBarFinished)
        }
    }
}
