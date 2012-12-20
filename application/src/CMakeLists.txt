include_directories( ${KDE4_INCLUDES} ${QT_INCLUDES} ../../common)

set(active-ktp_SRCS
    main.cpp
    activeIM.cpp
)

kde4_add_executable(active-ktp ${active-ktp_SRCS})

target_link_libraries(active-ktp
    ${QT_QTDECLARATIVE_LIBRARY}
    ${QT_QTOPENGL_LIBRARY}
    ${QT_QTSCRIPT_LIBRARY}
    ${KDE4_KDEUI_LIBS}
    ${KDE4_KIO_LIBS}
    ${KDE4_PLASMA_LIBS}
    ${KDECLARATIVE_LIBRARIES}
    activeapp
)

install(TARGETS active-ktp ${INSTALL_TARGETS_DEFAULT_ARGS} )
