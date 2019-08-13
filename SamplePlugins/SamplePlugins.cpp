#include "SamplePlugins.h"
#include "SamplePluginsPresenter.h"

#include <qqml.h>

void SamplePlugins::registerTypes(const char* uri)
{
    // @uri SampleModules
    qmlRegisterType(QUrl("qrc:///QML/SampleView.qml"), uri, 1, 0, "SampleView");
}
