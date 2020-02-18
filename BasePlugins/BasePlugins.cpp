#include "BasePlugins.h"
#include "Actions/ActionDispatcher.h"
#include "Actions/ActionListener.h"
#include "Control/QmlClipboardAdapter.h"

#include <QUrl>
#include <QtQml>
#include <qqml.h>

static QObject* CreateActionDispatcherInstance(QQmlEngine*, QJSEngine*)
{
    return new ActionDispatcher;
}

void BasePlugins::registerTypes(const char* uri)
{
    // @uri BasePlugins

    ///Basic controls
    qmlRegisterType(QUrl("qrc:///Applications/QML/BaseApp.qml"), uri, 1, 0, "BaseApp");
    qmlRegisterType(QUrl("qrc:///Applications/QML/BaseScreen.qml"), uri, 1, 0, "BaseScreen");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/BaseButton.qml"), uri, 1, 0, "BaseButton");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Layout/BaseLayout.qml"), uri, 1, 0, "BaseLayout");

    ///Controls with Bootstrap style
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/Bootstrap_DropDown.qml"), uri, 1, 0, "Bootstrap_DropDown");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/Bootstrap_TextboxWithIcon.qml"), uri, 1, 0, "Bootstrap_TextboxWithIcon");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Dialogs/Bootstrap_MessageDialog.qml"), uri, 1, 0, "Bootstrap_MessageDialog");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Dialogs/Bootstrap_ProcessBarDialog.qml"), uri, 1, 0, "Bootstrap_ProcessBarDialog");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Dialogs/Bootstrap_WaitingDialog.qml"), uri, 1, 0, "Bootstrap_WaitingDialog");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Dialogs/Bootstrap_TumblerDialog.qml"), uri, 1, 0, "Bootstrap_TumblerDialog");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/Bootstrap_RadioButtons.qml"), uri, 1, 0, "Bootstrap_RadioButtons");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/Bootstrap_RadioButtonList.qml"), uri, 1, 0, "Bootstrap_RadioButtonList");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/Bootstrap_ProcessBar.qml"), uri, 1, 0, "Bootstrap_ProcessBar");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/Bootstrap_Text.qml"), uri, 1, 0, "Bootstrap_Text");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/Bootstrap_RoundButton.qml"), uri, 1, 0, "Bootstrap_RoundButton");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/Bootstrap_Button.qml"), uri, 1, 0, "Bootstrap_Button");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Button/Bootstrap_ButtonWithIcon.qml"), uri, 1, 0, "Bootstrap_ButtonWithIcon");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/Bootstrap_DropdownPanel.qml"), uri, 1, 0, "Bootstrap_DropdownPanel");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/Bootstrap_TextboxNakedWithHeader.qml"), uri, 1, 0, "Bootstrap_TextboxNakedWithHeader");

    ///Custom controls
    qmlRegisterType(QUrl("qrc:///Controls/QML/Rectangles/VerticalHalfRounded.qml"), uri, 1, 0, "VerticalHalfRounded");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Rectangles/HorizontalHalfRounded.qml"), uri, 1, 0, "HorizontalHalfRounded");
    qmlRegisterType(QUrl("qrc:///Controls/QML/AppBar/AppBarWithIconAndText.qml"), uri, 1, 0, "AppBarWithIconAndText");
    qmlRegisterType(QUrl("qrc:///Controls/QML/AppBar/AppBarWithTextAndBackKeyOnly.qml"), uri, 1, 0, "AppBarWithTextAndBackKeyOnly");
    qmlRegisterType(QUrl("qrc:///Controls/QML/AppBar/AppBarWithIconOnly.qml"), uri, 1, 0, "AppBarWithIconOnly");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/Bootstrap_TextboxWithLabel.qml"), uri, 1, 0, "Bootstrap_TextboxWithLabel");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Rectangles/InkWellRectangle.qml"), uri, 1, 0, "InkWellRectangle");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/MaskIcon.qml"), uri, 1, 0, "MaskIcon");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/Bootstrap_TabBar.qml"), uri, 1, 0, "Bootstrap_TabBar");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/Bootstrap_Tumbler.qml"), uri, 1, 0, "Bootstrap_Tumbler");
    qmlRegisterType(QUrl("qrc:///Controls/QML/Controls/Bootstrap_Toast.qml"), uri, 1, 0, "Bootstrap_Toast");

    ///Common settings / theme
    qmlRegisterSingletonType(QUrl("qrc:///Controls/QML/Theme/Theme.qml"), uri, 1, 0, "Theme");
    qmlRegisterSingletonType(QUrl("qrc:///Controls/QML/Theme/Icons.qml"), uri, 1, 0, "Icons");
    qmlRegisterSingletonType(QUrl("qrc:///Applications/QML/BaseQMLSettings.qml"), uri, 1, 0, "Settings");
    qmlRegisterSingletonType(QUrl("qrc:///Applications/Translations/BaseActionStrings.qml"), uri, 1, 0, "BaseActionStrings");
    qmlRegisterSingletonType(QUrl("qrc:///Applications/Translations/BaseStrings.qml"), uri, 1, 0, "BaseStrings");

    // C++ Types
    qmlRegisterType<ActionListener, 0>(uri, 1, 0, "ActionListener");
    qmlRegisterSingletonType<ActionDispatcher>(uri, 1, 0, "Action", &CreateActionDispatcherInstance);
    qmlRegisterType<BasePlugins>(uri, 1, 0, "BasePlugins");
    qmlRegisterType<QmlClipboardAdapter>(uri, 1, 0, "Clipboard");

}
