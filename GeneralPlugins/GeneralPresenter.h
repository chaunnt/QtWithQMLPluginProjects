#pragma once

#include <QObject>

class GeneralPresenter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString appPolicy MEMBER m_AppPolicy NOTIFY appPolicyChanged)
    Q_PROPERTY(QString appLogo MEMBER m_AppLogo NOTIFY appLogoChanged)

public:
    explicit GeneralPresenter(QObject* parent = nullptr);
    virtual ~GeneralPresenter();

    Q_SIGNAL void appLogoChanged();
    Q_SIGNAL void appPolicyChanged();

private:
    QString m_AppLogo;
    QString m_AppPolicy;
};
