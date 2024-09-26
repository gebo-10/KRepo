-- package("kpackage-wgpu-native")
--     set_homepage("https://github.com/gfx-rs/wgpu-native")
--     set_description("Native WebGPU implementation based on wgpu-core")

--     add_urls("https://github.com/gfx-rs/wgpu-native/releases/download/v22.1.0.5/wgpu-windows-x86_64-msvc-debug.zip")
--     add_versions("22.1.0.5", "4D63E16941B7ABD8491ACBABF78B3F74A52025276A2A8FADF22E7BD20C1540BE")

--     add_includedirs("include", "include/webgpu","include/wgpu")

--     on_load("windows", function (package)
--         if not package:config("shared") then
--             package:add("syslinks", "Advapi32", "bcrypt", "d3dcompiler", "NtDll", "User32", "Userenv", "WS2_32", "Gdi32", "Opengl32")
--         end
--     end)

--     on_install("windows|x64", function (package)
--         os.cp("include/", package:installdir("include"))
--         if package:is_plat("windows") then
--                 os.cp("wgpu_native.lib", package:installdir("lib"))
--         end
--     end)



package("kpackage-wgpu-native")
    --add_urls("https://github.com/facebook/yoga.git")

    set_urls("https://github.com/gfx-rs/wgpu-native/releases/download/v22.1.0.5/wgpu-windows-x86_64-msvc-debug.zip")
    add_versions("22.1.0","4d63e16941b7abd8491acbabf78b3f74a52025276a2a8fadf22e7bd20c1540be")
    add_includedirs("include", "include/webgpu","include/wgpu")
    on_install("windows", function (package)
        os.cp("include", package:installdir())
        --(package:debug() and "Debug" or "Release")
        os.cp("lib/*.lib", package:installdir("lib"))
        os.cp("lib/*.dll", package:installdir("lib"))
    end)

--local script
-- package("wgpu")
--     set_description("The wgpu package")

--     on_load(function (package)
--         --package:set("installdir", os.scriptdir())
--         package:set("installdir", path.join(os.projectdir(),"external/wgpu"))
--     end)

--     on_fetch(function (package)
--         --is_debug
--         local result = {}
--         result.links = "wgpu_native"
--         result.linkdirs = package:installdir("debug/lib")
--         result.includedirs = {package:installdir("debug/include"),package:installdir("debug/include/webgpu")}
--         return result
--     end)