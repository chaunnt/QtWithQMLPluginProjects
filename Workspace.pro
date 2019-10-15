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

    BaseApp

CONFIG += ordered
Setting.depends = Framework
SystemFunctions.depends = Framework Setting
BasePlugins = Framework Setting SystemFunctions
GeneralPlugins.depends = BasePlugins SystemFunctions Framework
BaseApp.depends = BasePlugins GeneralPlugins SystemFunctions Framework Setting