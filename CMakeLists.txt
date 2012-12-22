# Because I dont want to build the whole plasma-mobile every time

project(KtpActive)
cmake_minimum_required(VERSION 2.8)
find_package(KDE4 REQUIRED)
include(KDE4Defaults)
add_definitions (${QT_DEFINITIONS} ${KDE4_DEFINITIONS})
find_package(KDeclarative REQUIRED)
macro_log_feature(
    KDeclarative_FOUND "libkdeclarative" "KDE Declarative (QML) support from kdelibs" "http://www.kde.org"
    TRUE "" ""
    )
include_directories( ${KDE4_INCLUDES} ${QT_INCLUDES} )

#add_subdirectory(common)
add_subdirectory(application)
