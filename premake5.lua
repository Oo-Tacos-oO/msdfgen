-- msdfgen lib --

project "msdfgen"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"
	systemversion "latest"

	targetdir (binariesDir .. "/%{prj.name}")
	objdir (binariesIntermediateDir .. "/%{prj.name}")

	files {
		"core/**.h",
		"core/**.hpp",
		"core/**.cpp",
		"ext/**.h",
		"ext/**.hpp",
		"ext/**.cpp",

		"include/**.h",
		"lib/**.cpp",
	}
	removefiles {
		"core/**.vs*/**",
		"ext/**.vs*/**",
	}

	includedirs {
		"include",
		"freetype/include",
	}

	defines {
		"MSDFGEN_USE_CPP11",
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

	filter "configurations:Distribution"
		runtime "Release"
		optimize "speed"
		symbols "off"
