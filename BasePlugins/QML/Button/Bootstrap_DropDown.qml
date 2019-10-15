import QtQuick 2.9
import QtQuick.Controls 2.0
import BasePlugins 1.0

Item{
    id: itemDropDown
    property var model
    property string currentTextValue: ""
    property string placeHolderText: "Abc"
    // Option
    property int itemHeight: Settings.baseButtonHeight
    property int fontSize: Theme.general.normalFontSize
    property color baseColor: "gray"

    Rectangle {
        id: recDisplay
        width: parent.width
        height: parent.height
        radius: 5 * Settings.dpiToPixelValue
        y: parent.height / 2 - height / 2
        color: "transparent"
        Text{
            id: txtDisplay
            text: currentTextValue === "" ? placeHolderText : currentTextValue
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            height: parent.height
            width: parent.width - imgIcon.width
            color: itemDropDown.enabled ? baseColor : "lightgray"
            font.pixelSize: fontSize
            elide: Text.ElideRight
        }
        Image {
            id: imgIcon
            width: 10 * Settings.dpiToPixelValue
            height: width
            source: "qrc:/Applications/Images/control_dropdown.png"
            anchors.right: parent.right
            anchors.rightMargin: 5 * Settings.dpiToPixelValue
            y:parent.height / 2 - height / 2
        }
//        Rectangle{
//            anchors.bottom: parent.bottom
//            height: 1
//            width: parent.width
//            color: itemDropDown.enabled ? "black" : "lightgray"
//        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                menuCombobox.open()
            }
        }
    }

    Menu {
        id: menuCombobox
        y: itemDropDown.height + 2 * Settings.dpiToPixelValue
        height: recComboboxPopup.height
        width: recComboboxPopup.width
        background: Rectangle{
            color: "transparent"
        }

        onVisibleChanged: {
            if(visible) {
                lvComboboxPopup.model = itemDropDown.model
            }
        }

        contentItem: Item {
            id: recComboboxPopup
            width: lvComboboxPopup.width
            height: lvComboboxPopup.height + (recBackGround.radius * 2)

            Rectangle {
                id: recBackGround
                border.color: baseColor
                radius: 5 * Settings.dpiToPixelValue
                anchors.fill: parent
            }

            ListView {
                id: lvComboboxPopup
                width: itemDropDown.width
                height: lvComboboxPopup.count > 10 ? itemHeight * 10 : itemHeight * lvComboboxPopup.count
                x: 1 * Settings.dpiToPixelValue
                snapMode: ListView.SnapToItem
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                delegate: Item {
                    width: itemDropDown.width - 2 * Settings.dpiToPixelValue
                    height: itemHeight
                    Text{
                        id: txtComboboxNameItem
                        text: modelData
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        x: 5 * Settings.dpiToPixelValue
                        height: parent.height
                        width: parent.width - 10 * Settings.dpiToPixelValue
                        color: "black"
                        font.pixelSize: fontSize
                        elide: Text.ElideRight
                    }
                    Rectangle{
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 1
                        color: "#DCDCDC"
                        visible: index < lvComboboxPopup.count -1
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            console.log("onclicked")
                            itemDropDown.currentTextValue = txtComboboxNameItem.text
                            console.log(itemDropDown.currentTextValue)
                            menuCombobox.close()
                        }
                        onEntered: {
                            txtComboboxNameItem.color = baseColor
                        }
                        onExited: {
                            txtComboboxNameItem.color = "black"
                        }
                    }
                }
            }
        }
    }
}

