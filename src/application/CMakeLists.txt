# Setup project.
set(PROJECT_NAME "WpfApp")

# Setup project to use C# utilities.
INCLUDE(CSharpUtilities)

# Create assembly info with current version.
#CONFIGURE_FILE("${CMAKE_SOURCE_DIR}/src/application/Properties/AssemblyInfo.cs.template" "${CMAKE_BINARY_DIR}/Config/${PROJECT_NAME}/AssemblyInfo.cs")

# Add executable project.
ADD_EXECUTABLE(${PROJECT_NAME}
    "app.config"

	"App.xaml"
	"App.xaml.cs"
	"MainWindow.xaml"
	"MainWindow.xaml.cs"
    
    "Properties/AssemblyInfo.cs"
	"Properties/Resources.Designer.cs"
	"Properties/Resources.resx"
	"Properties/Settings.Designer.cs"
    "Properties/Settings.settings"
)

# Set designer and XAML properties.
CSHARP_SET_DESIGNER_CS_PROPERTIES(
    "${CMAKE_BINARY_DIR}/Config/${PROJECT_NAME}/AssemblyInfo.cs"
	"Properties/Resources.Designer.cs"
    "Properties/Resources.resx"
	"Properties/Settings.Designer.cs"
    "Properties/Settings.settings"
)

CSHARP_SET_XAML_CS_PROPERTIES(
	"App.xaml"
	"App.xaml.cs"
	"MainWindow.xaml"
    "MainWindow.xaml.cs"
)

SET_PROPERTY(SOURCE App.xaml PROPERTY VS_XAML_TYPE "ApplicationDefinition")

# Define dependencies.
TARGET_LINK_LIBRARIES(${PROJECT_NAME} PUBLIC c_sharp_lib)

# Set CLR assembly properties.
SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES
	WIN32_EXECUTABLE TRUE
    VS_DOTNET_REFERENCES "System;System.Core;System.Data;System.Data.DataSetExtensions;System.Drawing;System.Net.Http;System.Xaml;System.Xml.Linq;Microsoft.CSharp;PresentationCore;PresentationFramework;WindowsBase"
    VS_GLOBAL_ROOTNAMESPACE ${PROJECT_NAME}
)