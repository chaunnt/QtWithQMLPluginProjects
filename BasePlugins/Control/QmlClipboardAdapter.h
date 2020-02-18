#pragma once

#include <QObject>
#include <QGuiApplication>
#include <QClipboard>
#include <QObject>

class QmlClipboardAdapter : public QObject
{
    Q_OBJECT
public:
    explicit QmlClipboardAdapter(QObject *parent = nullptr);

    Q_INVOKABLE void setText(QString text);
private:
    QClipboard *clipboard;
};

