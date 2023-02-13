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
		"include/AL",
		"core",
		"common",
		"examples/common",
		"alc",
		"al",
		"router"
	}

	files
	{
		"config.h",
		"version.h",
		"core/**.h",
		"core/**.c",
		"core/**.cpp",
		"common/**.h",
		"common/**.c",
		"common/**.cpp",
		"examples/common/**.h",
		"examples/common/**.c",
		"examples/common/**.cpp",
		"al/**.h",
		"al/**.c",
		"al/**.cpp",
		"alc/**.h",
		"alc/**.c",
		"alc/**.cpp",
		"router/**.h",
		"router/**.c",
		"router/**.cpp"
	}

	excludes
	{
		"core/rtkit.cpp",
		"core/dbus_wrap.cpp",
		"core/ambdec.cpp",
		"core/mixer/mixer_neon.cpp",
		"alc/backends/coreaudio.cpp",
		"alc/backends/alsa.cpp",
		"alc/backends/jack.cpp",
		"alc/backends/opensl.cpp",
		"alc/backends/oss.cpp",
		"alc/backends/pipewire.cpp",
		"alc/backends/oboe.cpp",
		"alc/backends/solaris.cpp",
		"alc/backends/pulseaudio.cpp",
		"alc/backends/sndio.cpp",
		"alc/backends/sdl2.cpp",
		"alc/backends/portaudio.cpp"
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