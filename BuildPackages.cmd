@ECHO OFF


SET BUILD_CONFIGURATION_FOLDER_NAME=build

SET BUILD_CONFIGURATION_FOLDER_PATH=%BUILD_CONFIGURATION_FOLDER_NAME%

@CALL "%BUILD_CONFIGURATION_FOLDER_PATH%\BuildPackages.cmd" "configuration=Release" "version=1.0.0"
