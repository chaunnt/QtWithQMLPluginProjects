#include "ApplicationInitializer.h"
#include "Framework/FrameworkOwner.h"
#include "Setting/SettingOwner.h"
#include "SystemFunctions/SystemFunctionsOwner.h"

static const int c_Process_FinishStartup = 10;
static const int c_Process_FinishLoadSettings = 70;
static const int c_Process_FinishInitialization = 100;

ApplicationInitializer::ApplicationInitializer(QObject* parent)
    : QObject(parent)
    , m_InitMessage ("")
    , m_InitProcess (0)
{
}

void ApplicationInitializer::startStartupSequence()
{
    qDebug() << Q_FUNC_INFO;
    // Init Framework singleton
    const auto& pFrameworkOwner = FrameworkOwner::getInstance();
    pFrameworkOwner->createObjects();

    // Init Setting singleton
    SettingOwner* pSettingOwner = SettingOwner::getInstance();
    pSettingOwner->createObjects();

    // Init SystemFunctionsOwner singleton
    const auto&  pSystemFunctionsOwner = SystemFunctionsOwner::getInstance();
    pSystemFunctionsOwner->createObjects();

    setInitProcess(c_Process_FinishStartup);
}

void ApplicationInitializer::initializeApplication()
{
    qDebug() << Q_FUNC_INFO;
    // Init Setting singleton
    SettingOwner* pSettingOwner = SettingOwner::getInstance();

    // load app settings
    pSettingOwner->getSettingsManager()->loadHostSettings();

    pSettingOwner->getSettingsManager()->loadAuthenticationSettings();

    setInitProcess(c_Process_FinishLoadSettings);

    _finializedStartup();
}

void ApplicationInitializer::_finializedStartup()
{
    setInitProcess(c_Process_FinishInitialization);
    Q_EMIT initFinished();
}

QString ApplicationInitializer::getInitMessage()
{
    return m_InitMessage;
}

void ApplicationInitializer::setInitMessage(QString newValue)
{
    m_InitMessage = newValue;
    Q_EMIT initMessageChanged();
}

int ApplicationInitializer::getInitProcess()
{
    return m_InitProcess;
}

void ApplicationInitializer::setInitProcess(int newValue)
{
    m_InitProcess = newValue;
    Q_EMIT initProcessChanged();
}
