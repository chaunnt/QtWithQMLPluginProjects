#include "SystemFunctionsOwner.h"

SystemFunctionsOwner::SystemFunctionsOwner() = default;

/**
 * Don't put this in the header.  Non-inlined version of multiple
 * data sources owner destructor.
 */
SystemFunctionsOwner::~SystemFunctionsOwner() = default;

void SystemFunctionsOwner::_onAboutToQuit()
{
    QtSingleton<SystemFunctionsOwner>::onAboutToQuit();
}

SystemFunctionsOwner* SystemFunctionsOwner::getInstance()
{
    return QtSingleton<SystemFunctionsOwner>::getInstance();
}

void SystemFunctionsOwner::createObjects()
{
    m_pGeneralManager.reset(new GeneralManager);

}

QSharedPointer<GeneralManager> SystemFunctionsOwner::getGeneralManager()
{
    return m_pGeneralManager;
}

