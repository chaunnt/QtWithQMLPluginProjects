TEMPLATE = subdirs

!include(Common.pri) {
    error("Couldn't include Common.pri")
}

SUBDIRS += \
    Framework \
    Setting \
    SystemFunctions \
    BasePlugins \
    GeneralPlugins \
    BaseApp #This module must be the last module on build ordered

CONFIG += ordered
Setting.depends = Framework
SystemFunctions.depends = Framework Setting
BasePlugins.depends = Framework Setting SystemFunctions
GeneralPlugins.depends = BasePlugins SystemFunctions Framework
#This module must be the last module on build ordered
BaseApp.depends = BasePlugins GeneralPlugins SystemFunctions Framework Setting
