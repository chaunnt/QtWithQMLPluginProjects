pragma Singleton

import QtQuick 2.0
import QtQuick.Window 2.2

QtObject {

    /*!
        The width of the screen, or the window for desktop usage.
     */
    readonly property real screenWidth: Screen.width

    /*!
        The height of the screen, or the window for desktop usage.
     */
    readonly property real screenHeight: Screen.height

    /*!
        The dpi of screen
     */
    property real dpiToPixelValue: 1

    /*!
        The basic height of 1 button
     */
    readonly property real baseButtonHeight: (Qt.platform.os === "ios" ? 60 : 40) * dpiToPixelValue

    /*!
        The DPI assumed when designing with density-independent pixels
     */
    readonly property real designDPI: 124

    /*!
        The screen width when designed for scaled sizes
     */
    readonly property real designWidth: 720

    /*!
        The screen width when designed for scaled sizes
     */
    readonly property real designHeight: 1000

    property real scaleRatio: {
        var widthRatio = screenWidth / designWidth
        var heightRatio = screenHeight / designHeight

        var calculateRatio = widthRatio
        if(widthRatio > heightRatio){
            calculateRatio = heightRatio
        }else{
            calculateRatio = widthRatio
        }

        calculateRatio = calculateRatio * dpiToPixelValue
        return calculateRatio
    }

    property string activeScreenName: ""
    property string backKeyAction: ""

    Component.onCompleted: {
        if(Qt.platform.os === "ios"){
            dpiToPixelValue = appDPI * scaleRatio
        }else{
            dpiToPixelValue = appDPI
        }
    }
}
