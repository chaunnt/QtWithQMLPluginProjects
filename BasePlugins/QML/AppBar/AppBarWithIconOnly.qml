import QtQuick 2.0
import BasePlugins 1.0

Rectangle {
    id:recAppBar
    width: Settings.screenWidth
    height: Settings.baseButtonHeight
    color: Theme.general.appBarBackgroundColor
    property var dataModel
    property int selectedIndex: 0
    property color textColor: Theme.general.appBarTextColor
    property int displayType: BasePlugins.TextAndIcon
    signal iconClicked(string iconAction)

    ListView {
        anchors.fill: parent
        orientation: ListView.Horizontal
        interactive: false
        model: dataModel
        delegate: Item {
            id:itemIcon
            height: recAppBar.height
            width: recAppBar.width / dataModel.length
            property bool itemActived: recAppBar.selectedIndex === index
            Text {
                id:txtIconTitle
                text: modelData.iconName
                font.pixelSize: Theme.general.smallFontSize
                width: parent.width
                maximumLineCount: 1
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                color: itemIcon.itemActived ? modelData.activeTextColor : textColor
                anchors.top: imgIconImage.bottom
                anchors.topMargin: 2 * Settings.dpiToPixelValue
                visible: displayType !== BasePlugins.IconOnly
            }
            Image {
                id: imgIconImage
                source: itemIcon.itemActived ? modelData.activeIconImage : modelData.iconImage
                height: parent.height / 2
                fillMode: Image.PreserveAspectFit
                y: parent.height / 2 - (imgIconImage.height + txtIconTitle.height) / 2
                anchors.horizontalCenter: parent.horizontalCenter
                visible: displayType !== BasePlugins.TextOnly
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    selectedIndex = index
                    if(itemIcon.itemActived){
                        //Show loading message to wait for reload data
                        Action.dispatch(BaseActionStrings.dialogActions.showWaitingDialog,
                                        {
                                            popupMessage:BaseStrings.dialogMessages.waitingMessage
                                        })
                        iconClicked(modelData.iconAction)

                        Action.dispatch(BaseActionStrings.dialogActions.cancelWaitingDialog)
                    }
                }
            }
        }
    }
}
