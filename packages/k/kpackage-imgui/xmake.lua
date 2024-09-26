package("kpackage-imgui")
    set_homepage("https://github.com/ocornut/imgui")
    set_description("Dear ImGui: Bloat-free Graphical User interface for C++ with minimal dependencies")
    set_license("MIT")

    set_urls("https://github.com/ocornut/imgui.git")
    add_versions("latest", "docking")

    add_configs("glfw",             {description = "Enable the glfw backend", default = false, type = "boolean"})
    add_configs("opengl3",          {description = "Enable the opengl3 backend", default = false, type = "boolean"})
    add_configs("vulkan",           {description = "Enable the vulkan backend", default = false, type = "boolean"})
    add_configs("sdl2",             {description = "Enable the sdl2 backend with sdl2_renderer", default = false, type = "boolean"})
    
    add_includedirs("include", "include/backends")

    on_install("windows", function (package)
        local configs = {
            glfw             = package:config("glfw"),
            opengl3          = package:config("opengl3"),
            sdl2             = package:config("sdl2") ,
            vulkan           = package:config("vulkan"),
        }

        os.cp(path.join(package:scriptdir(), "port", "xmake.lua"), "xmake.lua")
        os.cp("backends/*.h",package:installdir("include/backends"))
        import("package.tools.xmake").install(package, configs)
    end)
