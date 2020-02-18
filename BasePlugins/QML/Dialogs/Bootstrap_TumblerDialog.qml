import QtQuick 2.0
import QtQuick.Controls 2.0
import BasePlugins 1.0
import LotteryPlugins 1.0

Item {
    id:itemDialogNumberPick
    property var model
    property QtObject presenter
    property color backgroundColor: Theme.general.appBackgroundColor
    property color headerColor: Theme.general.appBarBackgroundColor
    property string headingText: ""
    property string propertyName: ""
    property int currentIndex: 10
    property string currentText: ""
    property color textColor: Theme.general.baseTextColor
    property int maxDisplayedItem: 5
    signal closed()
    Binding {
        target: presenter
        property: propertyName
        value: currentText
    }

    Rectangle {
        width: parent.width
        height: parent.height
        color: Theme.general.appDialogBackGroundColor
        MouseArea {
            anchors.fill: parent
            onClicked: {
                //                Action.dispatch(LotteryActionStrings.gameActions.hideNumberPickDialog)
            }
        }
    }

    Rectangle {
        id: recItemList
        anchors.centerIn: parent
        width: parent.width * 80 / 100
        height: root.height + 20 * Settings.dpiToPixelValue + dialogHeader.height + Settings.baseButtonHeight
        color: backgroundColor
        Rectangle {
            id:dialogHeader
            width: recItemList.width
            height: Settings.baseButtonHeight
            color: headerColor
            Text {
                text: headingText
                anchors.centerIn: parent
                font.pixelSize: Theme.general.normalFontSize
                color: Theme.general.baseTextColor
            }

            Text {
                text: "X"
                font.pixelSize: Theme.general.normalFontSize
                font.bold: true
                color: Theme.general.baseTextColor
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 5 * Settings.dpiToPixelValue
                anchors.right: parent.right
                height: parent.height
                width: height
                horizontalAlignment: Text.AlignRight
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        closed()
                        itemDialogNumberPick.visible = false
                    }
                }
            }
        }


        Bootstrap_Tumbler {
            id: root
            width: parent.width
            height: Settings.baseButtonHeight * maxDisplayedItem
            y: dialogHeader.height + 5 * Settings.dpiToPixelValue
        }

    }
}
