pragma Singleton

import QtQuick 2.0
import QtQuick.Controls 1.4

QtObject {

    /*!
        The width of the screen, or the window for desktop usage.
     */
    readonly property real screenWidth: 1024

    /*!
        The height of the screen, or the window for desktop usage.
     */
    readonly property real screenHeight: 768

    /*!
        The DPI assumed when designing with density-independent pixels
     */
    readonly property real designDPI: 124

    /*!
        The screen width when designed for scaled sizes
     */
    readonly property real designWidth: 1280

    function sampleFunction(){

    }

}
