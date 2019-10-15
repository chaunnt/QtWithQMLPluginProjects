#include "SettingsManager.h"
#include "Framework/GlobalDefine.h"
#include "Framework/ServerCommunication/ServerBase.h"

#include <QNetworkRequest>

static const QString c_Params_HostName = "HostName";
static const QString c_Params_Token = "Token";

SettingsManager::SettingsManager(QObject* parent)
    : QObject(parent)
{
}

bool SettingsManager::loadHostSettings()
{
    bool result = true;
    ServerBase server;
    server.executeGETrequest(QNetworkRequest(QUrl("https://lamappdidong.com")), true);

    return result;
}

bool SettingsManager::loadAuthenticationSettings()
{
    bool result = true;

    return result;
}
