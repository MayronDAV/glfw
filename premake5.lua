project "glfw"
	kind "StaticLib"
	language "C"
	staticruntime "on"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/Thirdparty/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/Thirdparty/%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/internal.h",
		"src/platform.h",
		"src/platform.c",
		"src/mappings.h",
		"src/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c",
		"src/egl_context.c",
		"src/osmesa_context.c",
		"src/null_platform.h",
		"src/null_joystick.h",
		"src/null_joystick.c",
		"src/null_init.c",
		"src/null_monitor.c",
		"src/null_window.c"
	}

	filter "system:linux"
		pic "on"

		systemversion "latest"
		staticruntime "on"

		files
		{
			"src/posix_time.h",
			"src/posix_time.c",
			"src/posix_thread.h",
			"src/posix_thread.c",
			"src/posix_module.c",

			"src/x11_platform.c",
			"src/xkb_unicode.h",
			"src/xkb_unicode.c",
			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_window.c",
			"src/glx_context.c",

			"src/linux_joystick.h",
			"src/linux_joystick.c",
			"src/posix_poll.h",
			"src/posix_poll.c",
		}

		defines
		{
			"_GLFW_X11"
		}

	filter "system:windows"
		systemversion "latest"

		files
		{

			"src/win32_time.h",
			"src/win32_time.c",
			"src/win32_thread.h",
			"src/win32_thread.c",
			"src/win32_module.c",

			"src/win32_platform.h",
			"src/win32_joystick.h",
			"src/win32_joystick.c",
			"src/win32_init.c",
			"src/win32_monitor.c",
			"src/win32_window.c",
			"src/wgl_context.c",

			"src/win32_init.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
