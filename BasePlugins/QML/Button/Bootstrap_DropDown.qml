import QtQuick 2.0
import QtQuick.Controls 2.0
import BasePlugins 1.0

Item{
    id: itemDropDown
    property var model: [""]
    property string currentTextValue: ""
    property int currentIndex: -1
    property string placeHolderText: "placeHolderText"
    // Option
    property int itemHeight: Settings.baseButtonHeight

    property int fontSize: Theme.general.normalFontSize
    property color backgroundColor: "transparent"
    property color borderColor: "transparent"
    property color selectedColor: "transparent"
    property color disabledColor: "lightgray"
    property color buttonTextColor: Theme.general.baseTextColor
    property color itemTextColor: Theme.general.baseTextColor
    property bool hidenIcon: false
    property bool allowMultiSelect: false
    property int totalSelected: currentSelectedValues.length
    property var currentSelectedValues:[0]
    property bool isNaked: false
    property string iconUrl: "qrc:/Applications/Images/control_dropdown.png"

    Rectangle {
        id: recDisplay
        width: parent.width
        height: parent.height
        radius: 5 * Settings.dpiToPixelValue
        y: parent.height / 2 - height / 2
        color: backgroundColor
        border.width: border.color !== "transparent" ? 1 : 0
        border.color: isNaked === false ? borderColor : "transparent"
        Text{
            id: txtDisplay
            text: currentTextValue === "" ? placeHolderText : (totalSelected > 1 ? "..." : currentTextValue)
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            height: parent.height
            width: parent.width - imgIcon.width
            x: 5 * Settings.dpiToPixelValue
            color: itemDropDown.enabled ? buttonTextColor : disabledColor
            font.pixelSize: fontSize
            elide: Text.ElideRight
        }
        Image {
            id: imgIcon
            width: 10 * Settings.dpiToPixelValue
            height: width
            source: iconUrl
            anchors.right: parent.right
            anchors.rightMargin: 5 * Settings.dpiToPixelValue
            y:parent.height / 2 - height / 2
            visible: !hidenIcon
        }
        Rectangle {
            width: parent.width
            height: 1
            color: Theme.general.splitterColor
            visible: isNaked
            anchors.bottom: parent.bottom
        }
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
                border.color: itemDropDown.borderColor
                radius: 5 * Settings.dpiToPixelValue
                anchors.fill: parent
            }

            ListView {
                id: lvComboboxPopup
                width: itemDropDown.width
                height: lvComboboxPopup.count > 10 ? itemHeight * 10 : itemHeight * lvComboboxPopup.count
                y: recBackGround.radius
                snapMode: ListView.SnapToItem
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                delegate: Item {
                    id:itemMenuItem
                    width: itemDropDown.width - 2 * Settings.dpiToPixelValue
                    height: itemHeight
                    property bool selected: currentSelectedValues.indexOf(index) >= 0
                    Text{
                        id: txtComboboxNameItem
                        text: modelData
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        x: 5 * Settings.dpiToPixelValue
                        height: parent.height
                        width: parent.width - 10 * Settings.dpiToPixelValue - (allowMultiSelect ? parent.height / 2 + 10 * Settings.dpiToPixelValue : 0)
                        color: itemTextColor
                        font.pixelSize: fontSize
                        elide: Text.ElideRight
                    }
                    Rectangle{
                        height: parent.height / 2
                        width: height
                        visible: allowMultiSelect
                        radius: 5 * Settings.dpiToPixelValue
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10 * Settings.dpiToPixelValue
                        color: itemMenuItem.selected ? selectedColor : disabledColor
                    }
                    Rectangle{
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 1
                        color: disabledColor
                        visible: index < lvComboboxPopup.count -1
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            if(allowMultiSelect){
                                if(itemMenuItem.selected){
                                    currentSelectedValues.splice(currentSelectedValues.indexOf(index),1)
                                }else{
                                    currentSelectedValues.push(index);
                                }

                                if(currentSelectedValues.length > 0){
                                    var lastIndex = currentSelectedValues[0]
                                    itemDropDown.currentTextValue = itemDropDown.model[lastIndex].toString()
                                    itemDropDown.currentIndex = index
                                }

                                if(currentSelectedValues.indexOf(index) >= 0){
                                    itemMenuItem.selected = true
                                }else{
                                    itemMenuItem.selected = false
                                }

                                totalSelected = currentSelectedValues.length
                            }else{
                                itemDropDown.currentTextValue = txtComboboxNameItem.text
                                itemDropDown.currentIndex = index
                                menuCombobox.close()
                            }
                        }
                        onEntered: {
                            txtComboboxNameItem.color = selectedColor
                        }
                        onExited: {
                            txtComboboxNameItem.color = itemTextColor
                        }
                    }
                }
            }
        }
    }
}

