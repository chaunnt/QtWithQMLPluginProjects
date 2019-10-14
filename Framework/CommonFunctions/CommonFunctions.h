#pragma once

#include <QString>
#include <QDebug>
#include <QFile>
#include <QJsonDocument>
#include <QTextStream>

#define DEBUGLOG(format, ...)   do { RAYLOG_CHECK_FORMAT(format, ##__VA_ARGS__); ELADebugEx(RAYLOG_LEVEL_DEBUG,   __FILE__, __LINE__, __FUNCTION__, format, ##__VA_ARGS__); } while (false)
class CommonFunctions
{

public:
    CommonFunctions();
    void AddTraceLog(QString strLog);
    void exportJson(QString& strFileName, QJsonDocument& jsDoc);
    QJsonDocument loadJson(QString& strFileName);
};
