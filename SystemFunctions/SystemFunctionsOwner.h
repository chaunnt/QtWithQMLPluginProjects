#pragma once

#include <QObject>
#include <QSharedPointer>

#include "Framework/Utils/QtSingleton.h"
#include "General/GeneralManager.h"

/**
 * @brief Class contain all functions related to Settings of system
 */
class SystemFunctionsOwner
    : public QObject
    , private QtSingleton<SystemFunctionsOwner>
{
    Q_OBJECT

public:
    friend class QtSingleton<SystemFunctionsOwner>;

    ///
    /// \brief Static getter for System function owner class
    /// \return
    ///
    static SystemFunctionsOwner* getInstance();

    ///
    /// \brief Initialise the Setting
    ///
    void createObjects();

    QSharedPointer<GeneralManager> getGeneralManager();

private:
    SystemFunctionsOwner();
    virtual ~SystemFunctionsOwner();

    QSharedPointer<GeneralManager> m_pGeneralManager; // this is owner of this class

    Q_SLOT void _onAboutToQuit();
};
