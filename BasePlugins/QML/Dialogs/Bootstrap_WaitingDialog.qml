import QtQuick 2.9
import QtQuick.Controls 2.0
import BasePlugins 1.0

Item {
    id:popupDialog
    property string popupMessage: ""

    Rectangle {
        width: parent.width
        height: parent.height
        color: Theme.general.appDialogBackGroundColor
        MouseArea {
            anchors.fill: parent
            onClicked: {
                //TODO: DO NOTHING
            }
        }
        Rectangle {
            width: parent.width / 6 * 4
            height: txtPopupMessage.height + imgWaitingIndicator.height + txtCancelMessage.height + 15 * Settings.dpiToPixelValue
            color: "white"
            radius: 10 * Settings.dpiToPixelValue
            border.color: "gray"
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
             AnimatedImage {
                id: imgWaitingIndicator
                source: "qrc:/Applications/Images/waiting_cursor.gif"
                height: Settings.baseButtonHeight
                width: Settings.baseButtonHeight
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }
            RotationAnimator {
                target: imgWaitingIndicator
                from: 0;
                to: 360;
                duration: 1000
                running: popupDialog.visible
                direction: RotationAnimator.Clockwise
                loops: Animation.Infinite
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
                        Action.dispatch(BaseActionStrings.dialogActions.cancelWaitingDialog)
                    }
                }
            }
        }
    }
}
