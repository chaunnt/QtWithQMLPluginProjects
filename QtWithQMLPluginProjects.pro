TEMPLATE = subdirs

SUBDIRS += \
    BasePlugins \
    SamplePlugins \
    SampleApp


SampleApp.depends = BasePlugins SamplePlugins
SamplePlugins.depends = BasePlugins
