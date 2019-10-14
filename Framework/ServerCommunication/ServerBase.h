#pragma once

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QEventLoop>
#include <QFile>

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QDebug>

class ServerBase : public QObject
{
    Q_OBJECT
public:
    explicit ServerBase(QObject *parent = nullptr);
    Q_SIGNAL void requestFinished(QNetworkReply* newResponse);
    Q_SIGNAL void requestError(QNetworkReply* newResponse);

    QByteArray executeGETrequest(QNetworkRequest newRequest, bool isHaveToWait = false);
    QByteArray executePOSTrequest(QNetworkRequest newRequest, QByteArray newBodyData, bool isHaveToWait = false);
    QByteArray executePUTrequest(QNetworkRequest newRequest, QByteArray newBodyData, bool isHaveToWait = false);
    void serverResponse(QNetworkReply* newResponse);

private:
    QNetworkAccessManager* m_serverAccessManager;
};
