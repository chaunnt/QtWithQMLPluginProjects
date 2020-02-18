import QtQuick 2.0
import QtQuick.Controls 2.0
import BasePlugins 1.0
import GeneralPlugins 1.0

Item {
    id: itemSideMenu
    property bool isOpen: false
    property var arrayMenuItems: []
    property QtObject sidemenuPresenter: SideMenuPresenter{}
    Component.onCompleted: {
        arrayMenuItems.push({
                          menuIcon: Icons.contact,
                          menuTitle: GeneralPluginsStrings.contactScreen.screenName,
                          menuAction: GeneralActionStrings.displayContact
                      })
        arrayMenuItems.push({
                          menuIcon: Icons.logout,
                          menuTitle: GeneralPluginsStrings.sideMenu.logoutItem,
                          menuAction:BaseActionStrings.authenticationApp.logout,
                      })
        listviewMenuItemsList.model = arrayMenuItems
    }

    function open(){
        visible = true
        isOpen = true
        recMenuList.x = 0
    }

    function close(){
        isOpen = false
        recMenuList.x = recMenuList.width * -1
    }

    Rectangle {
        width: parent.width
        height: parent.height
        color: Theme.general.sideMenuBackgroundColor
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Action.dispatch(BaseActionStrings.baseApp.closeSideMenu)
            }
        }

        Rectangle {
            id:recMenuList
            width: parent.width / 6 * 5
            height: parent.height
            x: width * -1
            Behavior on x {
                NumberAnimation {
                    easing.type: Easing.Linear
                    duration: 200
                    onRunningChanged: {
                        if (!isOpen) {
                            itemSideMenu.visible = false
                        }
                    }
                }
            }

            Item {
                id: itemProfile
                width: parent.width
                height: width
                clip: true
                Rectangle {
                    anchors.fill: parent
                    color: Theme.general.sideMenuForeColor
                }

                Item {
                    id: itemProfileName
                    width: parent.width
                    height: Settings.baseButtonHeight * 1.5
                    x: 15 * Settings.dpiToPixelValue
                    y: 15 * Settings.dpiToPixelValue
                    Rectangle {
                        width: height
                        height: parent.height
                        radius: width / 2
                        Image {
                            source: Icons.account
                            height: Settings.baseButtonHeight
                            fillMode: Image.PreserveAspectFit
                            anchors.centerIn: parent
                        }
                    }
                }
            }
            ListView {
                id:listviewMenuItemsList
                width: parent.width
                anchors.top: itemProfile.bottom
                anchors.bottom: parent.bottom
                model: arrayMenuItems
                clip: true
                boundsBehavior: Flickable.StopAtBounds
                delegate: Item {
                    width: listviewMenuItemsList.width
                    height: Settings.baseButtonHeight
                    Item {
                        id:itemMenuIcon
                        height: parent.height
                        width: height
                        Image {
                            source: modelData.menuIcon
                            height: parent.height / 2
                            fillMode: Image.PreserveAspectFit
                            anchors.centerIn: parent
                        }
                    }
                    Text {
                        text: modelData.menuTitle
                        height: parent.height
                        width: parent.width - itemMenuIcon.width
                        anchors.left: itemMenuIcon.right
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        color: Theme.general.sideMenuItemTextColor
                        font.pixelSize: Theme.general.smallFontSize
                    }
                    Rectangle {
                        width: parent.width
                        height: 1
                        color: Theme.general.splitterColor
                        anchors.bottom: parent.bottom
                    }
                    Image {
                        source: Icons.rightArrow
                        height: parent.height / 2
                        fillMode: Image.PreserveAspectFit
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 5 * Settings.dpiToPixelValue
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            Action.dispatch(BaseActionStrings.baseApp.closeSideMenu)
                            Action.dispatch(BaseActionStrings.dialogActions.showWaitingDialog,
                                            {
                                                popupMessage:BaseStrings.dialogMessages.waitingMessage
                                            })
                            Action.dispatch(modelData.menuAction,{
                                                forwardAction : modelData.forwardAction
                                            })
                            Action.dispatch(BaseActionStrings.dialogActions.cancelWaitingDialog)
                        }
                    }
                }
            }
        }
    }
}
