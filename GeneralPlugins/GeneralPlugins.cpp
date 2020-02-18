#include "GeneralPlugins.h"
#include "GeneralPresenter.h"
#include "SideMenuPresenter.h"

#include <qqml.h>

void GeneralPlugins::registerTypes(const char* uri)
{
    // @uri general plugins
    qmlRegisterSingletonType(QUrl("qrc:/QML/Translations/GeneralActionStrings.qml"), uri, 1, 0, "GeneralActionStrings");
    qmlRegisterSingletonType(QUrl("qrc:/QML/Translations/GeneralPluginsStrings.qml"), uri, 1, 0, "GeneralPluginsStrings");

    // C++ Types
    qmlRegisterType<GeneralPresenter, 0>(uri, 1, 0, "GeneralPresenter");
    qmlRegisterType<SideMenuPresenter, 0>(uri, 1, 0, "SideMenuPresenter");
}
