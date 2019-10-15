pragma Singleton

import QtQuick 2.6

// this is all the action strings which will be used for Action / Dispatcher
// we do not need to translate these messages.
// we only collect them in 1 files to make it conherence through whole application
// we did not consider to use it in C++ yet
QtObject {
    id: actionStrings

    /// Dialogs actions
    property QtObject dialogActions: QtObject {
        //: The action for showing message dialog
        readonly property string showMessageDialog: "ShowMessageDialog"

        //: The action for showing process bar dialog
        readonly property string showProcessBarDialog: "ShowProcessBarDialog"

        //: The action for showing waiting dialog
        readonly property string showWaitingDialog: "ShowWaitingDialog"

        //: The action for closing Process Bar Dialog
        readonly property string closeProcessBarDialog: "CloseProcessBarDialog"

        //: The action for canceling Process Bar Dialog
        readonly property string cancelProcessBarDialog: "CancelProcessBarDialog"

        //: The action for signaling Process Bar Dialog finished
        readonly property string processBarFinished: "ProcessBarFinished"

        //: The action for closing Message Dialog
        readonly property string closeMessageDialog: "CloseMessageDialog"

        //: The action for canceling waiting dialog
        readonly property string cancelWaitingDialog: "CancelWaitingDialog"
    }

    /// base app actions
    property QtObject baseApp: QtObject {
        //: The action for finishing Init Sequence
        readonly property string initFinished: "InitFinished"

        //: The action for starting Init Sequence
        readonly property string startInitSequence: "StartInitSequence"

        //: The action for displaying List Product
        readonly property string displayListProduct: "DisplayListProduct"
    }

    /// Authentication actions (almost use for login)
    property QtObject authenticationApp: QtObject {
        //: The action for login Success
        readonly property string loginSuccess: "loginSuccess"

        //: The action for starting Init Sequence
        readonly property string startInitSequence: "StartInitSequence"

        //: The action for displaying Login Screen
        readonly property string displayLoginScreen: "displayLoginScreen"

        //: The action for displaying Register Screen
        readonly property string displayRegisterScreen: "displayRegisterScreen"
    }

    /// Account management actions
    property QtObject accountManagementApp: QtObject {
        //: The action for adding account finished
        readonly property string addAccountFinished: "addAccountFinished"
    }
}
