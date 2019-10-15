#pragma once

#include "Framework/Utils/QtSingleton.h"
#include "SettingsManager.h"
#include "ProfileSettingManager.h"

#include <QObject>

/**
 * @brief Class contain all functions related to Settings of system
 */
class SettingOwner
    : public QObject
    , private QtSingleton<SettingOwner>
{
    Q_OBJECT

public:
    friend class QtSingleton<SettingOwner>;

    /// Static getter for System function owner class
    static SettingOwner* getInstance();

    // Initialise the Setting
    void createObjects();

    SettingsManager* getSettingsManager();
    ProfileSettingManager* getProfileSettingManager();

private:
    SettingOwner();
    virtual ~SettingOwner();

    QScopedPointer<SettingsManager> m_pSettingsManager;
    QScopedPointer<ProfileSettingManager> m_pProfileSettingManager;
    Q_SLOT void _onAboutToQuit();
};
