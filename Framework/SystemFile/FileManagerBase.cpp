#include "FileManagerBase.h"
#include "FrameworkOwner.h"
#include "GlobalDefine.h"

#include <QFile>
#include <QDateTime>

static QString c_KEY_LOGININFO = "LoginInfo";
static QString c_KEY_EMAIL = "Email";
static QString c_KEY_PASSWORD = "Password";

FileManagerBase::FileManagerBase(QObject* parent)
    : QObject(parent)
{
}
void FileManagerBase::saveLoginWithEmail(QString strEmail, QString strPassword)
{
    QFile file(LOGIN_INFO);

    if (!file.open(QIODevice::WriteOnly))
    {
        return;
    }

    QXmlStreamWriter xmlWriter(&file);
    xmlWriter.setAutoFormatting(true);
    xmlWriter.writeStartDocument();
    xmlWriter.writeStartElement(c_KEY_LOGININFO);
    xmlWriter.writeTextElement(c_KEY_EMAIL, strEmail);
    xmlWriter.writeTextElement(c_KEY_PASSWORD, strPassword);
    xmlWriter.writeEndElement();
    xmlWriter.writeEndDocument();

    file.close();
}

void FileManagerBase::getLoginByEmail(QString& strEmail, QString& strPassword)
{
    QFile file(LOGIN_INFO);

    if (!file.open(QFile::ReadOnly | QFile::Text))
    {
        return;
    }
    QXmlStreamReader xmlStream(&file);
    while (!xmlStream.atEnd())
    {
        xmlStream.readNext();
        if (xmlStream.isStartElement() && xmlStream.name() == c_KEY_LOGININFO)
        {

            while (!xmlStream.atEnd())
            {
                xmlStream.readNext();
                QString keyValue = xmlStream.name().toString();
                if (xmlStream.isStartElement() == true)
                {
                    if (keyValue == c_KEY_EMAIL)
                    {
                        strEmail = xmlStream.readElementText();
                    }
                    else if (keyValue == c_KEY_PASSWORD)
                    {
                        strPassword = xmlStream.readElementText();
                    }
                }
            }
        }
    }

    file.close();
}

void FileManagerBase::saveLoginWithPhone(QString strPhoneNumber, QString strPassword)
{
    QFile file(LOGIN_INFO);

    if (!file.open(QIODevice::WriteOnly))
    {
        return;
    }

    QXmlStreamWriter xmlWriter(&file);
    xmlWriter.setAutoFormatting(true);
    xmlWriter.writeStartDocument();
    xmlWriter.writeStartElement("LoginInfo");
    xmlWriter.writeTextElement("PhoneNumber", strPhoneNumber);
    xmlWriter.writeTextElement("Password", strPassword);
    xmlWriter.writeEndElement();
    xmlWriter.writeEndDocument();

    file.close();
}

void FileManagerBase::getLoginByPhone(QString& strPhoneNumber, QString& strPassword)
{
    QFile file(LOGIN_INFO);

    if (!file.open(QFile::ReadOnly | QFile::Text))
    {
        return;
    }
    QXmlStreamReader xmlStream(&file);
    while (!xmlStream.atEnd())
    {
        xmlStream.readNext();
        if (xmlStream.isStartElement() && xmlStream.name() == "LoginInfo")
        {

            while (!xmlStream.atEnd())
            {
                xmlStream.readNext();
                QString keyValue = xmlStream.name().toString();
                if (xmlStream.isStartElement() == true)
                {
                    if (keyValue == "PhoneNumber")
                    {
                        strPhoneNumber = xmlStream.readElementText();
                    }
                    else if (keyValue == "Password")
                    {
                        strPassword = xmlStream.readElementText();
                    }
                }
            }
        }
    }

    file.close();
}

void FileManagerBase::removeLoginInfo()
{
    QFile file(LOGIN_INFO);

    if (file.exists())
    {
        file.remove();
    }
}

///
/// \brief add log to log file
/// \param strLog: log detail
///
void FileManagerBase::addEventLog(QString strLog)
{
    ERROR_LOG(strLog);
    QFile file(LOG_INFO);

    if (!file.open(QIODevice::Append))
    {
        return;
    }
    QString log = "\r\n";
    log += QDateTime::currentDateTime().toString("yyyy-MM-dd hh-mm-ss");
    log += strLog;

    file.write(log.toUtf8());

    file.close();
}
