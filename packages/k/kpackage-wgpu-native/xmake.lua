package("kpackage-wgpu-native")
    set_homepage("https://github.com/gfx-rs/wgpu-native")
    set_description("Native WebGPU implementation based on wgpu-core")
    set_license("Apache-2.0")

    --if is_plat("windows") and is_arch("x64") then
        --if is_debug() then
            add_urls("https://github.com/gfx-rs/wgpu-native/releases/download/v22.1.0.5/wgpu-windows-x86_64-msvc-debug.zip")
            add_versions("22.1.0.5", "4D63E16941B7ABD8491ACBABF78B3F74A52025276A2A8FADF22E7BD20C1540BE")
        -- else
        --     add_urls("https://github.com/gfx-rs/wgpu-native/releases/download/$(version)/wgpu-windows-x86_64-msvc-release.zip")
        --     add_versions("v22.1.0.5", "9e1591d60c2d2ee20d6d4a63bc01c7c5eecf7734761673160aa639e550a1ba4d")
        -- end
    --end

    -- if is_plat("windows") then
    --     add_configs("vs_runtime", {description = "Set vs compiler runtime.", default = "MD", readonly = true})
    -- end

    add_includedirs("include", "include/webgpu","include/wgpu")

    on_load("windows", function (package)
        if not package:config("shared") then
            package:add("syslinks", "Advapi32", "bcrypt", "d3dcompiler", "NtDll", "User32", "Userenv", "WS2_32", "Gdi32", "Opengl32")
        end
    end)

    on_install("windows|x64", function (package)
        os.cp("include/", package:installdir("include"))
        if package:is_plat("windows") then
                os.cp("wgpu_native.lib", package:installdir("lib"))
        end
    end)