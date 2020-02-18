#include "GlobalDefine.h"
#include <QStandardPaths>
#include <QString>

QString STORAGE_PATH = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
QString LOGIN_INFO = STORAGE_PATH + "Storage.xml";
QString LOG_INFO = STORAGE_PATH + "App.log";

double MIN_DOUBLE_VALUE = 0.1;

QString CLOUD_HOST = "https://api.keno88.vn";

///JSON PARAM WHICH ARE RETURNED BY HOST
QString c_Params_statusCode = "statusCode";
QString c_Params_message = "message";
QString c_Params_data = "data";
QString c_Params_token = "token";
QString c_Params_skip = "skip";
QString c_Params_limit = "limit";
QString c_Token_Bearer = "Bearer ";
QString c_Header_Authorization = "authorization";
