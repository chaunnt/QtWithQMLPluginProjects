pragma Singleton

import QtQuick 2.6

QtObject {
    id: generalPluginsStrings

    property QtObject sideMenu: QtObject {
        //: The label for logout button
        readonly property string logoutItem: QT_TR_NOOP("Đăng xuất")
    }

    property QtObject policyScreen: QtObject {
        //: The label for screen name
        readonly property string screenName: QT_TR_NOOP("Điều khoản và chính sách")

    }

    property QtObject contactScreen: QtObject {
        //: The label for screen name
        readonly property string screenName: QT_TR_NOOP("Liên hệ")

    }

    //: The label for VND currency label
    readonly property string currencyVND: QT_TR_NOOP("đ")

    // The context to use when translating the preceding strings.
    readonly property string context: "generalPluginsStrings"

    // Translate the given text with the optional number (replaces %n in the text,
    // if present). The owner is used to help avoid garbage collection for strings
    // that don't change (most of them), as they are deleted along with the owner.
    function translate(owner, text, number) {
        number = (typeof number === 'undefined') ? -1 : number;
        return translator.translate(owner, context, text, number);
    }

}
