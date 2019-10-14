#include "FrameworkOwner.h"

FrameworkOwner::FrameworkOwner() = default;

/**
 * Don't put this in the header.  Non-inlined version of multiple
 * data sources owner destructor.
 */
FrameworkOwner::~FrameworkOwner()
{

}

void FrameworkOwner::_onAboutToQuit()
{
    QtSingleton<FrameworkOwner>::onAboutToQuit();
}

FrameworkOwner *FrameworkOwner::getInstance()
{
    return QtSingleton<FrameworkOwner>::getInstance();
}

void FrameworkOwner::createObjects()
{
    m_pDBLocalBase.reset(new DBLocalBase);
    m_pCommonFunctions.reset(new CommonFunctions);
}

DBLocalBase* FrameworkOwner::getDBLocalBase()
{
    return m_pDBLocalBase.data();
}

CommonFunctions* FrameworkOwner::getCommonFunctions()
{
    return m_pCommonFunctions.data();
}
