#include "ServerBase.h"

ServerBase::ServerBase(QObject *parent) : QObject(parent)
{
    m_serverAccessManager = new QNetworkAccessManager;
    connect(m_serverAccessManager, &QNetworkAccessManager::finished, this, &ServerBase::serverResponse);
}

QByteArray ServerBase::executeGETrequest(QNetworkRequest newRequest, bool isHaveToWait)
{
    QByteArray responseData;
    if (isHaveToWait)
    {
        QNetworkAccessManager tempNamLogin;
        QNetworkReply* newResponse = tempNamLogin.get(newRequest);
        QEventLoop tempLoop;
        connect(&tempNamLogin, SIGNAL(finished(QNetworkReply*)), &tempLoop, SLOT(quit()));
        tempLoop.exec();
        responseData = newResponse->readAll();

        delete newResponse;
        newResponse = nullptr;
    }
    else
    {
        m_serverAccessManager->get(newRequest);
    }
    return responseData;
}

QByteArray ServerBase::executePOSTrequest(QNetworkRequest newRequest, QByteArray newBodyData, bool isHaveToWait)
{
    QByteArray responseData;
    if (isHaveToWait)
    {
        QNetworkAccessManager tempNamLogin;
        QNetworkReply* newResponse = tempNamLogin.post(newRequest, newBodyData);
        QEventLoop tempLoop;
        connect(&tempNamLogin, SIGNAL(finished(QNetworkReply*)), &tempLoop, SLOT(quit()));
        tempLoop.exec();
        responseData = newResponse->readAll();

        delete newResponse;
        newResponse = nullptr;
    }
    else
    {
        m_serverAccessManager->post(newRequest, newBodyData);
    }
    return responseData;
}

QByteArray ServerBase::executePUTrequest(QNetworkRequest newRequest, QByteArray newBodyData, bool isHaveToWait)
{
    QByteArray responseData;
    if (isHaveToWait)
    {
        QNetworkAccessManager tempNamLogin;
        QNetworkReply* newResponse = tempNamLogin.put(newRequest, newBodyData);
        QEventLoop tempLoop;
        connect(&tempNamLogin, SIGNAL(finished(QNetworkReply*)), &tempLoop, SLOT(quit()));
        tempLoop.exec();
        responseData = newResponse->readAll();

        delete newResponse;
        newResponse = nullptr;
    }
    else
    {
        m_serverAccessManager->put(newRequest, newBodyData);
    }

    return responseData;
}

void ServerBase::serverResponse(QNetworkReply* newResponse)
{
    if (newResponse->error() == QNetworkReply::NoError)
    {
        QString responseUrl = newResponse->request().url().toString();
        emit requestFinished(newResponse);

        //Friend class must handle deletion of response
        delete newResponse;
        newResponse = nullptr;

    }
    else
    {
        emit requestError(newResponse);
        //Friend class must handle deletion of response
        delete newResponse;
        newResponse = nullptr;
    }
}


