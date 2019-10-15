import QtQuick 2.0
import QtQuick.Controls 2.0
import BasePlugins 1.0

Item {
    id:popupDialog
    property string popupMessage: ""
    property alias percentageValue: itemProcessBar.percentageValue
    Rectangle {
        width: parent.width
        height: parent.height
        color: "#AAE5E5E5"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                //TODO: DO NOTHING
            }
        }

        Rectangle {
            width: parent.width / 6 * 4
            height: txtPopupMessage.height + itemProcessBar.height + txtCancelMessage.height + 15 * Settings.dpiToPixelValue
            color: "white"
            radius: 10 * Settings.dpiToPixelValue
            border.color: "lightgray"
            border.width: 1
            anchors.centerIn: parent
            Text {
                id: txtPopupMessage
                text: popupMessage
                width: parent.width - 10 * Settings.dpiToPixelValue
                anchors.top: parent.top
                anchors.topMargin: 5 * Settings.dpiToPixelValue
                anchors.horizontalCenter: parent.horizontalCenter
                height: Settings.baseButtonHeight
                font.pixelSize: Theme.general.normalFontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            Bootstrap_ProcessBar {
                id: itemProcessBar
                width: parent.width - 20 * Settings.dpiToPixelValue
                height: Settings.baseButtonHeight
                anchors.centerIn: parent
            }
            Text {
                id: txtCancelMessage
                text: qsTr("Cancel")
                width: parent.width
                anchors.bottom: parent.bottom
                height: Settings.baseButtonHeight
                font.pixelSize: Theme.general.normalFontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: Theme.general.baseSelectingColor
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        Action.dispatch(ActionStrings.dialogActions.cancelProcessBarDialog, {percentageValue: popupDialog.percentageValue})
                    }
                }
            }
        }
        ActionListener {
            actions: ["ProcessBarFinished"]
            onTriggered: {
                Action.dispatch(ActionStrings.dialogActions.closeProcessBarDialog)
            }
        }
    }
}
