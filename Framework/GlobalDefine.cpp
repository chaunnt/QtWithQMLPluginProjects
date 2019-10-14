#include "GlobalDefine.h"
#include <QStandardPaths>
#include <QString>

QString STORAGE_PATH = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
QString LOGIN_INFO = STORAGE_PATH + "Storage.xml";
QString LOG_INFO = STORAGE_PATH + "App.log";

double MIN_DOUBLE_VALUE = 0.1;
