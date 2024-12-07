SET PATH=%PATH%;%ProgramFiles%\CMake\bin
SET QT5SDK64=C:\Qt\5.15.2\msvc2019_64
SET CMAKE_TOOLCHAIN="Visual Studio 17 2022"
SET ROOT_DIR=C:\path\to\FlightGearBuild

md osg-build
md simgear-build
md flightgear-build

cd %ROOT_DIR%\osg-build

cmake  %ROOT_DIR%\osg -G  %CMAKE_TOOLCHAIN% -A x64 ^
                 -DACTUAL_3RDPARTY_DIR=%ROOT_DIR%\windows-3rd-party/msvc140/3rdParty.x64 ^
                 -DCMAKE_RELWITHDEBINFO_POSTFIX:STRING= ^
                 -DOSG_USE_UTF8_FILENAME:BOOL=ON ^
                 -DWIN32_USE_MP:BOOL=ON ^
                 -DCMAKE_INSTALL_PREFIX:PATH=%ROOT_DIR%\install
cmake --build . --config RelWithDebInfo --target INSTALL

cd %ROOT_DIR%\simgear-build
cmake  %ROOT_DIR%\simgear -G  %CMAKE_TOOLCHAIN% -A x64 ^
                 -DOSG_FSTREAM_EXPORT_FIXED:BOOL=ON ^
                 -DCMAKE_INSTALL_PREFIX:PATH=%ROOT_DIR%\install
cmake --build . --config RelWithDebInfo --target INSTALL

cd %ROOT_DIR%\flightgear-build
cmake  %ROOT_DIR%\flightgear -G  %CMAKE_TOOLCHAIN% -A x64 ^
                  -DCMAKE_INSTALL_PREFIX:PATH=%ROOT_DIR%\install ^
                  -DCMAKE_PREFIX_PATH=%QT5SDK64% ^
                  -DOSG_FSTREAM_EXPORT_FIXED:BOOL=ON
                    
cmake --build . --config RelWithDebInfo --target INSTALL

pause
