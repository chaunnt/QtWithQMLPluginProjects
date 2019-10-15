#include "SettingOwner.h"

SettingOwner::SettingOwner() = default;

/**
 * Don't put this in the header.  Non-inlined version of multiple
 * data sources owner destructor.
 */
SettingOwner::~SettingOwner()
{

}

void SettingOwner::_onAboutToQuit()
{
    QtSingleton<SettingOwner>::onAboutToQuit();
}

SettingOwner* SettingOwner::getInstance()
{
    return QtSingleton<SettingOwner>::getInstance();
}

void SettingOwner::createObjects()
{
    m_pSettingsManager.reset(new SettingsManager);
    m_pProfileSettingManager.reset(new ProfileSettingManager);
}

SettingsManager* SettingOwner::getSettingsManager()
{
    return m_pSettingsManager.data();
}

ProfileSettingManager* SettingOwner::getProfileSettingManager()
{
    return m_pProfileSettingManager.data();
}
