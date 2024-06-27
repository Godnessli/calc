QT += gui quick

SOURCES += \
        main.cpp

resources.files = main.qml

resources.prefix = /$${TARGET}
RESOURCES += resources \
    res.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS +=

DISTFILES += \
    OpenSans-VariableFont_wdth,wght.ttf \
    icons/bkt.png \
    icons/division.png \
    icons/equal.png \
    icons/minus.png \
    icons/multiplication.png \
    icons/percent.png \
    icons/plus.png \
    icons/plus_minus.png
