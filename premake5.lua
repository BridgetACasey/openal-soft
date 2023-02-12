project "OpenALSoft"
	kind "StaticLib"
	language "C++"
    staticruntime "on"

	targetdir ("build/" .. outputdir .. "/%{prj.name}")
	objdir ("build-int/" .. outputdir .. "/%{prj.name}")

	includedirs
	{
		"%{ProjectDir}",
		"include",
		"common",
		"examples/common"
	}

	files
	{
		"config.h",
		"version.h",
		"al/**.h",
		"al/**.c",
		"al/**.cpp",
		"alc/**.h",
		"alc/**.c",
		"alc/**.cpp",
		"common/**.h",
		"common/**.c",
		"common/**.cpp",
		"examples/common/**.h",
		"examples/common/**.c"
	}

	excludes
	{
		"alc/mixer/mixer_neon.cpp",
		"alc/backends/coreaudio.cpp",
		"alc/backends/jack.cpp",
		"alc/backends/alsa.cpp",
		"alc/backends/oboe.cpp",
		"alc/backends/opensl.cpp",
		"alc/backends/oss.cpp",
		"alc/backends/pipewire.cpp",
		"alc/backends/portaudio.cpp",
		"alc/backends/pulseaudio.cpp",
		"alc/backends/sdl2.cpp",
		"alc/backends/sndio.cpp",
		"alc/backends/solaris.cpp"
	}

	defines
	{
		"AL_LIBTYPE_STATIC"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++14"

		defines
		{
			"WIN32",
			"_WINDOWS",
			"AL_BUILD_LIBRARY",
			"AL_ALEXT_PROTOTYPES",
			"_WIN32",
			"_CRT_SECURE_NO_WARNINGS",
			"NOMINMAX",
			"CMAKE_INTDIR=\"Debug\"",
			"RESTRICT=__restrict",
			"OpenAL_EXPORTS"
		}

		links
		{
			"winmm"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"