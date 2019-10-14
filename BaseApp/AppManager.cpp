#include "AppManager.h"
#include "SystemFunctions/SystemFunctionsOwner.h"

AppManager::AppManager(QObject* parent)
    : QObject(parent)
{
}

void AppManager::initApplication()
{
    SystemFunctionsOwner::getInstance()->createObjects();
}
