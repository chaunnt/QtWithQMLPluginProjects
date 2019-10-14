import QtQuick 2.0
import QtQuick.Controls 2.0
import BasePlugins 1.0

Item {
    id:popupDialog
    property string popupMessage: ""

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
            height: txtPopupMessage.height + txtCancelMessage.height + 10 * dpiToPixelValue
            color: "white"
            radius: 10 * dpiToPixelValue
            border.color: "gray"
            border.width: 1
            anchors.centerIn: parent
            Text {
                id: txtPopupMessage
                text: popupMessage
                width: parent.width - 10 * dpiToPixelValue
                anchors.top: parent.top
                anchors.topMargin: 5 * dpiToPixelValue
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Theme.general.normalFontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                elide: Text.ElideRight
                maximumLineCount: 3
            }
            Text {
                id: txtCancelMessage
                text: qsTr("OK")
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
                        Action.dispatch("CloseMessageDialog")
                    }
                }
            }
        }
    }
}
