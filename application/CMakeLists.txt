add_subdirectory(src)
#install( TARGETS active-ktp ${INSTALL_TARGETS_DEFAULT_ARGS} )

# QML-only thing
install(DIRECTORY package/ DESTINATION ${DATA_INSTALL_DIR}/plasma/packages/org.kde.ktp.active)
install(FILES ktp-active.desktop DESTINATION ${XDG_APPS_INSTALL_DIR})

add_subdirectory(icons)
