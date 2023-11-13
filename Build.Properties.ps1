#Requires -Version 7.0


# ================
# CONVENTIONS
# ================
# -   All "*FOLDER_PATH" variables must not have a trailing folder/directory separator.
#     This mirrors the Build.Properties.cmd convention.
# -   All "*FOLDER_PATH" variables defined below are base/root folder/directory paths,
#     even though their variable names don't use the word "BASE".



$BUILD_CONFIGURATION_FOLDER_NAME = 'build'
$SOURCE_CODE_FOLDER_NAME = 'src'
$ARTIFACTS_FOLDER_NAME = 'artifacts'
$ARTIFACTS___OUTPUT___FOLDER_NAME = 'bin'
$ARTIFACTS___PACKAGE_OUTPUT___FOLDER_NAME = 'packages'
$ARTIFACTS___TEST_RESULTS___FOLDER_NAME = 'testresults'

$WORKSPACE_FOLDER_PATH = $PSScriptRoot.TrimEnd([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
$BUILD_CONFIGURATION_FOLDER_PATH = Join-Path -Path $WORKSPACE_FOLDER_PATH -ChildPath $BUILD_CONFIGURATION_FOLDER_NAME
$SOURCE_CODE_FOLDER_PATH = Join-Path -Path $WORKSPACE_FOLDER_PATH -ChildPath $SOURCE_CODE_FOLDER_NAME
$ARTIFACTS_FOLDER_PATH = Join-Path -Path $WORKSPACE_FOLDER_PATH -ChildPath $ARTIFACTS_FOLDER_NAME
$ARTIFACTS___OUTPUT___FOLDER_PATH = Join-Path -Path $ARTIFACTS_FOLDER_PATH -ChildPath $ARTIFACTS___OUTPUT___FOLDER_NAME
$ARTIFACTS___PACKAGE_OUTPUT___FOLDER_PATH = Join-Path -Path $ARTIFACTS_FOLDER_PATH -ChildPath $ARTIFACTS___PACKAGE_OUTPUT___FOLDER_NAME
$ARTIFACTS___TEST_RESULTS___FOLDER_PATH = Join-Path -Path $ARTIFACTS_FOLDER_PATH -ChildPath $ARTIFACTS___TEST_RESULTS___FOLDER_NAME


$PARAMETER___RUN_BUILD___DEFAULT = $true
$PARAMETER___RUN_TEST___DEFAULT = $true
$PARAMETER___RUN_PACKAGE___DEFAULT = $true
$PARAMETER___VERSION___DEFAULT = '8.0.0'
$PARAMETER___CONFIGURATION___DEFAULT = 'Release'
$PARAMETER___FRAMEWORKS___DEFAULT = 'net8.0-windows;net7.0-windows;net6.0-windows;net48'
$PARAMETER___ENABLE_SOURCE_LINK___DEFAULT = $true


# ================================================================================
# BUILD UNITS
# ================================================================================
# Build units are executed in the order defined below.
# Each build unit completes build -> test -> package before the next build unit starts.

$BUILD_UNITS = @(
    'Wpf.Effects'
)


$BUILD_UNIT_PARAMETERS = @{
    'Wpf.Effects' = @{
        BUILD_PARAMETERS = @(
            "Wpf.Effects.slnx|$PARAMETER___FRAMEWORKS___DEFAULT"
        )

        # TEST_PARAMETERS = @(
        #     "Wpf.Effects.Tests.dll|$PARAMETER___FRAMEWORKS___DEFAULT"
        # )

        PACKAGE_PARAMETERS = @(
            "Wpf.Effects.csproj|$PARAMETER___FRAMEWORKS___DEFAULT"
        )

        PACKAGE_NEV_PARAMETERS = @(
            'Wpf.Effects.'
        )
    }
}
