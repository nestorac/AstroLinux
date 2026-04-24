cmake_minimum_required(VERSION 3.16)

project(AstroLinux VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick Network Positioning)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(AstroLinux
    main.cpp
)

qt_add_qml_module(AstroLinux
    URI com.astroLinux
    VERSION 1.0
    QML_FILES
        qml/main.qml
        qml/LocationManager.qml
        qml/WeatherCard.qml
        qml/MoonPhase.qml
        qml/ObjectsList.qml
    RESOURCES
        resources.qrc
)

target_link_libraries(AstroLinux PRIVATE
    Qt6::Core
    Qt6::Quick
    Qt6::Network
    Qt6::Positioning
)
