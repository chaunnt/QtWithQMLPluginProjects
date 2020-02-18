import QtQuick 2.0
import BasePlugins 1.0

Rectangle{
    id:recTabbar
    width: 100 * Settings.dpiToPixelValue
    height: Settings.baseButtonHeight
    property bool scrollable: false
    property var model
    property color itemColor: "red"
    property color itemTextColor: "black"
    property color highlightColor: "green"
    property bool enableHightLightItem: false
    property string selectedItem: ""
    property int selectedIndex: 0
    property bool showHints: false
    signal clicked()
    Flickable{
        id:flkTabbar
        width: parent.width
        height: parent.height
        contentWidth: rowTabItemList.implicitWidth
        interactive: scrollable
        flickableDirection: Flickable.HorizontalFlick
        Row{
            id:rowTabItemList
            height: parent.height
            Repeater{
                model: recTabbar.model
                Rectangle{
                    height: Settings.baseButtonHeight
                    color: enableHightLightItem ? (selectedIndex === index ? itemColor : Theme.general.appBackgroundColor) : itemColor
                    width: txtTabItemLabel.width + 20 * Settings.dpiToPixelValue > (recTabbar.width) / (showHints ? 3.5 : 3)
                           ? txtTabItemLabel.width + 20 * Settings.dpiToPixelValue
                           : (recTabbar.width) / (showHints ? 3.5 : 3)
                    Text {
                        id:txtTabItemLabel
                        text: modelData
                        font.pixelSize: Theme.general.normalFontSize
                        height: Settings.baseButtonHeight
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: parent
                        color: itemTextColor
                    }
                    Rectangle{
                        width: parent.width
                        height: 2 * Settings.dpiToPixelValue
                        color: index === selectedIndex ? highlightColor : Theme.general.splitterColor
                        anchors.bottom: parent.bottom
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            selectedIndex = index
                            selectedItem = txtTabItemLabel.text
                            recTabbar.clicked()
                        }
                    }
                }
            }
        }
    }
}

