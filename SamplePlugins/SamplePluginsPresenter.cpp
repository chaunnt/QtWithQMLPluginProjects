#include "SamplePluginsPresenter.h"

SamplePluginsPresenter::SamplePluginsPresenter(QObject * parent)
    : QObject(parent)
{

}

SamplePluginsPresenter::~SamplePluginsPresenter()
{

}

SamplePluginsPresenter::NewEnum_t SamplePluginsPresenter::getNewEnum()
{
    return m_newEnum;
}

int SamplePluginsPresenter::getNewProperty()
{
    return m_newProperty;
}

void SamplePluginsPresenter::setNewProperty(int newValue)
{
    Q_UNUSED(newValue);
    m_newProperty =newValue;
    Q_EMIT newPropertyChanged();
}
