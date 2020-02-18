import QtQuick 2.0
import QtQuick.Controls 2.0
import BasePlugins 1.0

Item {
    id:textboxNaked
    property double textBoxRadius: 5 * Settings.dpiToPixelValue
    property string previousText: ""
    property string pointIcon:""
    property int headerFontSize: 15
    property string headerText: "Header"
    property int phoneCode: 84
    property string placeholdertext: ""
    property color lineColor: "blue"
    property color headerColor: "white"
    property color textInputColor: "white"
    property int lineHeight: 2
    property int textFieldFontSize: 15
    property int textFieldEchoMode: TextInput.Normal
    property alias text: txtInputTextField.text
    property alias maximunlenght: txtInputTextField.maximumLength
    property bool isPhoneNumber: false
    property bool onlyNumber: false
    property alias inputMask: txtInputTextField.inputMask
    property alias validator: txtInputTextField.validator
    property alias acceptableInput : txtInputTextField.acceptableInput
    property alias textInputEnabled: txtInputTextField.enabled
    signal activated()
    signal textEditFinish()
    signal textChange()
    height: Settings.baseButtonHeight * 1.5

    Text {
        id:txtHeaderText
        text: headerText
        anchors.top: parent.top
        font.pixelSize: headerFontSize * Settings.dpiToPixelValue
        color: headerColor
    }
    Row{
        height: Settings.baseButtonHeight
        width: parent.width
        anchors.top: txtHeaderText.bottom
        Text {
            id: txtphoneCode
            visible: isPhoneNumber
            text: "+" + phoneCode + " | "
            height: parent.height
            font.pixelSize: headerFontSize * Settings.dpiToPixelValue
            color: headerColor
            anchors.top: parent.top
            anchors.topMargin: 10 * Settings.dpiToPixelValue
        }
        TextField {
            id:txtInputTextField
            height: parent.height
            width: isPhoneNumber ? parent.width - txtphoneCode.width : parent.width
            placeholderText: placeholdertext
            font.pixelSize: textFieldFontSize * Settings.dpiToPixelValue
            echoMode: textFieldEchoMode
            leftPadding: 0
            color: textInputColor
            inputMethodHints:onlyNumber == true?  Qt.ImhDigitsOnly : Qt.ImhNone
            background: Rectangle{
                id:bgText
                color: "transparent"
                anchors.fill: parent
            }
            Rectangle{
                width: parent.width
                height: lineHeight * Settings.dpiToPixelValue
                color: lineColor
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
            }

            Image {
                id: imgStar
                source: pointIcon
                height: parent.height / 2
                width: height
                y:parent.height / 2 - height / 2
                anchors.right: parent.right
                anchors.rightMargin: 3 * Settings.dpiToPixelValue
                visible: pointIcon == "" ? false : true
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(textFieldEchoMode == TextInput.Password)
                            textFieldEchoMode = TextInput.PasswordEchoOnEdit
                        else if(textFieldEchoMode == TextInput.PasswordEchoOnEdit)
                            textFieldEchoMode = TextInput.Password
                    }
                }
            }
            onEditingFinished: {
                textboxNaked.textEditFinish()
            }
            onActiveFocusChanged: {
                textboxNaked.activated()
            }
            onTextChanged: {
                textboxNaked.textChange()
            }
        }
    }
}
