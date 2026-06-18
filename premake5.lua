workspace "XB"
	architecture "x64"
	
	configurations
	{
		"Debug",
		"Release", --optimised debug
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "XB"
	location "XB"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines 
		{
			"XB_PLATFORM_WINDOWS",
			"XB_BUILD_DLL"
		}
	
		postbuildcommands
		{
			("{COPYFILE} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
	
	filter "configurations:Debug"
		defines "XB_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "XB_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "XB_DIST"
		optimize "On"

	-- filter { "system:windows", "configurations:Release" }
	--	buildoptions "/MT; /utf-8"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"XB/vendor/spdlog/include",
		"XB/src"
	}

	links
	{
		"XB"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines 
		{
			"XB_PLATFORM_WINDOWS"
		}
	
	filter "configurations:Debug"
		defines "XB_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "XB_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "XB_DIST"
		optimize "On"