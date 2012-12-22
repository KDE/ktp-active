include_directories( ${KDE4_INCLUDES} ${QT_INCLUDES} )

set(ktp-active_SRCS
    main.cpp
    activeIM.cpp
)

kde4_add_executable(ktp-active ${ktp-active_SRCS})

target_link_libraries(ktp-active
    ${QT_QTDECLARATIVE_LIBRARY}
    ${QT_QTOPENGL_LIBRARY}
    ${QT_QTSCRIPT_LIBRARY}
    ${KDE4_KDEUI_LIBS}
    ${KDE4_KIO_LIBS}
    ${KDE4_PLASMA_LIBS}
    ${KDECLARATIVE_LIBRARIES}
    activeapp
)

install(TARGETS ktp-active ${INSTALL_TARGETS_DEFAULT_ARGS} )
