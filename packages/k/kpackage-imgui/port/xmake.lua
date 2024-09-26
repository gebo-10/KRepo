add_rules("mode.debug", "mode.release")
add_rules("utils.install.cmake_importfiles")
set_languages("cxx14")

option("glfw",             {showmenu = true,  default = false})
option("opengl3",          {showmenu = true,  default = false})
option("sdl2",             {showmenu = true,  default = false})
option("vulkan",           {showmenu = true,  default = false})

if has_config("glfw") then
    --add_requires("glfw")
    add_requires("conan::glfw/3.4",{alias = "glfw",configs = { build = "missing"} })
end

if has_config("sdl2") then
    --add_requires("sdl2")
    add_requires("conan::sdl/2.30.7", { alias = "sdl2", configs = { build = "missing" } })
end

if has_config("opengl3") then
    --add_requires("glew")
    add_requires("conan::glew/2.2.0", { alias = "glew", configs = { build = "missing" } })
end

if has_config("vulkan") then
    add_requires("vulkansdk")
end



target("imgui")
    set_kind("$(kind)")
    add_files("*.cpp", "misc/cpp/*.cpp")
    add_headerfiles("*.h", "(misc/cpp/*.h)")
    add_includedirs(".", "misc/cpp")

    if has_config("dx11") then
        add_files("backends/imgui_impl_dx11.cpp")
        add_headerfiles("(backends/imgui_impl_dx11.h)")
    end

    if has_config("dx12") then
        add_files("backends/imgui_impl_dx12.cpp")
        add_headerfiles("(backends/imgui_impl_dx12.h)")
    end

    if has_config("glfw") then
        add_files("backends/imgui_impl_glfw.cpp")
        add_headerfiles("(backends/imgui_impl_glfw.h)")
        add_packages("glfw")
    end


    if has_config("opengl3") then
        add_files("backends/imgui_impl_opengl3.cpp")
        add_headerfiles("(backends/imgui_impl_opengl3.h)")
        add_headerfiles("(backends/imgui_impl_opengl3_loader.h)")
    end

    if has_config("sdl2") then
        add_files("backends/imgui_impl_sdl2.cpp")
        add_headerfiles("(backends/imgui_impl_sdl2.h)")
        add_packages("sdl2")
    end

    if has_config("vulkan") then
        add_files("backends/imgui_impl_vulkan.cpp")
        add_headerfiles("(backends/imgui_impl_vulkan.h)")
        add_packages("vulkansdk")
    end

    -- if has_config("win32") then
    --     add_files("backends/imgui_impl_win32.cpp")
    --     add_headerfiles("(backends/imgui_impl_win32.h)")
    -- end

    -- if has_config("wgpu") then
    --     add_files("backends/imgui_impl_wgpu.cpp")
    --     add_headerfiles("(backends/imgui_impl_wgpu.h)")
    --     add_packages("wgpu-native")
    -- end
