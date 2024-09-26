package("kpackage-yoga")
    set_homepage("https://yogalayout.com/")
    set_description("Yoga is a cross-platform layout engine which implements Flexbox. Follow https://twitter.com/yogalayout for updates.")
    set_license("MIT")

    --add_urls("https://github.com/facebook/yoga.git")

    set_urls("https://github.com/gebo-10/KRepo/releases/download/untagged-833bb57b1e0c7985d9b2/yoga.zip")
    add_versions("3.1.0")
    on_install("windows", function (package)
        os.cp("include", package:installdir())
        --(package:debug() and "Debug" or "Release")
        os.cp("lib/MDd/*.lib", package:installdir("lib"))
        os.cp("lib/MDd/*.dll", package:installdir("lib"))
    end)