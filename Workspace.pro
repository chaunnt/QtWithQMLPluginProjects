TEMPLATE = subdirs

!include(Common.pri) {
    error("Couldn't include Common.pri")
}

SUBDIRS += \
    BasePlugins \
    GeneralPlugins \
    SystemFunctions \
    Framework \
    BaseApp

BaseApp.depends = BasePlugins GeneralPlugins SystemFunctions Framework
GeneralPlugins.depends = BasePlugins SystemFunctions Framework
SystemFunctions.depends = Framework
