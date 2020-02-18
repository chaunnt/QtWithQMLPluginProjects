import QtQuick 2.3
import BasePlugins 1.0
Rectangle {
    id: root
    height: 200
    width: 200
    property var model: [0, 1, 2, 3, 4, 5]
    property var currentValue: 0
    property string suffix: ""
    property int itemHeight: Settings.baseButtonHeight
    property int textSize: Theme.general.normalFontSize
    property color textColor: Theme.general.baseTextColor
    property color indicatorColor: "#FFFF66"
    property int indicatorSize: 5

    Component.onCompleted: {
        reloadModel()
        tumblerMain.positionViewAtIndex(4, ListView.Center)
    }

    onModelChanged: {
        reloadModel()
    }

    onCurrentValueChanged: {
        setActive(findItemIndex(root.currentValue), true)
    }

    onSuffixChanged: {
        reloadModel()
    }

    onTextSizeChanged: {
        reloadModel()
    }

    onTextColorChanged: {
        reloadModel()
    }

    onIndicatorColorChanged: {
        reloadModel()
    }

    onIndicatorSizeChanged: {
        reloadModel()
    }

    function findItemIndex(val)
    {
        for(var i = 0; i < tumblerModel.length; i++)
        {
            if(tumblerModel.get(i).val === val && tumblerModel.get(i).hide === false)
                return i
        }

        return -1
    }

    function reloadModel()
    {
        var scrollToIndex = 0

        tumblerModel.clear()

        tumblerModel.append({"val":null,"active":false,"hide":true})

        for(var i = 0; i < model.length; i++)
        {
            if(root.currentValue === root.model[i])
            {
                tumblerModel.append({"val":root.model[i],"active":true,"hide":false})
                scrollToIndex = i
            }
            else
            {
                tumblerModel.append({"val":root.model[i],"active":false,"hide":false})
            }
        }

        tumblerModel.append({"val":null,"active":false,"hide":true})

        tumblerMain.positionViewAtIndex(scrollToIndex, ListView.Center)
    }

    function setActive(index, reposition)
    {
        if(index === -1)
            return
        else if(index === 0)
            index = 1
        else if(index === tumblerModel.count - 1)
            index = tumblerModel.count-2

        for(var i = 0; i < tumblerModel.count; i++)
        {
            tumblerModel.setProperty(i, "active", false)
        }

        tumblerModel.setProperty(index, "active", true)

        root.currentValue = root.model[index]

        if(reposition)
            tumblerMain.positionViewAtIndex(index, ListView.Center)
    }

    ListModel {
        id: tumblerModel
    }

    Component {
        id: tumblerDelegate

        Item {
            anchors.left: parent.left
            anchors.right: parent.right
            height: root.itemHeight + (hide ? (root.height / 2 - root.itemHeight - root.itemHeight / 2) : 0)
            visible: !hide

            Text {
                text: val + suffix
                color: root.textColor
                font.pointSize: root.textSize
                anchors.centerIn: parent
                opacity: active ? 1 : 0.3
            }
        }
    }

    ListView {
        id: tumblerMain
        model: tumblerModel
        delegate: tumblerDelegate
        anchors.fill: parent
        clip: true
        onFlickEnded: {
            var pos = contentY
            setActive(indexAt(0, contentY + root.height / 2), false)
            positionViewAtIndex(indexAt(0, contentY + root.height / 2), ListView.Center)
            var destPos
            destPos = contentY;
            anim.from = pos;
            anim.to = destPos;
            anim.running = true;
        }
    }

    NumberAnimation { id: anim; target: tumblerMain; property: "contentY"; duration: 100}
}
