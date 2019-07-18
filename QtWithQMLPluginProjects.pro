TEMPLATE = subdirs

SUBDIRS += \
    SampleModules \
    SampleApp


SampleApp.depends = SampleModules
