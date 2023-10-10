workspace "BasicProjectComputerGraphics"
architecture "x64"

configurations {
	"Debug",
	"Release"
}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include Directories relative to root folder
includeDir = {}
includeDir["GLFW"] = "BasicProjectComputerGraphics/vendor/GLFW/include"
includeDir["Glad"] = "BasicProjectComputerGraphics/vendor/Glad/include"
includeDir["glm"] = "BasicProjectComputerGraphics/vendor/glm/"

-- ? this will search for lua files
include "BasicProjectComputerGraphics/vendor/GLFW"
include "BasicProjectComputerGraphics/vendor/Glad" -- Search for lua files

project "BasicProjectComputerGraphics"
location "BasicProjectComputerGraphics"
kind "ConsoleApp"
language "C++"
cppdialect "C++17"
staticruntime "on"

targetdir("bin/" .. outputdir .. "/%{prj.name}")
objdir("bin-int/" .. outputdir .. "/%{prj.name}")

files {
	"%{prj.name}/src/**.h",
	"%{prj.name}/src/**.cpp"
}

defines {
	"_CRT_SECURE_NO_WARNINGS"
}

includedirs {
	"%{prj.name}/src",
	"%{includeDir.GLFW}",
	"%{includeDir.Glad}",
	"%{includeDir.glm}",
}

links {
	"GLFW",
	"Glad",
	"opengl32.lib"
}

filter "system:windows"
staticruntime "On"
systemversion "latest"

defines {
	"GLFW_INCLUDE_NONE"
}

filter "configurations:Debug"
runtime "Debug"
symbols "On"

filter "configurations:Release"
runtime "Release"
symbols "On"
