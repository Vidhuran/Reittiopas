# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = Reittiopas

CONFIG += sailfishapp

QT += location

SOURCES += src/Reittiopas.cpp

OTHER_FILES += qml/Reittiopas.qml \
    qml/cover/CoverPage.qml \
    rpm/Reittiopas.changes.in \
    rpm/Reittiopas.spec \
    rpm/Reittiopas.yaml \
    translations/*.ts \
    Reittiopas.desktop \
    qml/pages/Routes.qml \
    qml/pages/Stops.qml \
    qml/pages/MainPage.qml \
    qml/pages/Lines.qml \
    qml/pages/Info.qml \
    qml/pages/MapView.qml \
    qml/pages/MapView.qml

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/Reittiopas-de.ts

