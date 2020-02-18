#include "QmlClipboardAdapter.h"
#include "QDebug"
QmlClipboardAdapter::QmlClipboardAdapter(QObject *parent) : QObject(parent)
{
    clipboard = QGuiApplication::clipboard();
}

void QmlClipboardAdapter::setText(QString text)
{
    text.remove(".");
    text.remove(",");
    clipboard->setText(text, QClipboard::Clipboard);
    clipboard->setText(text, QClipboard::Selection);
}
