#include "GeneralPlugins.h"
#include "GeneralPresenter.h"

#include <qqml.h>

void GeneralPlugins::registerTypes(const char* uri)
{
    // @uri GeneralPlugins

    // C++ Types
    qmlRegisterType<GeneralPresenter, 0>(uri, 1, 0, "GeneralPresenter");
}
