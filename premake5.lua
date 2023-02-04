

workspace "Axon" 
    configurations {
        -- standard debug config, all symbols on
        "Debug64",
        -- release config, optimised for binary size
        "ReleaseSize64",
        -- release config, optimised for binary speed 
        "ReleaseSpeed64",
        -- release config, with all optimisations turned on
        "Release64",

        -- 32-bit opposites (probably won't be used much, if at all)

        "Debug32",
        "ReleaseSize32",
        "ReleaseSpeed32",
        "Release32"
    }

project "AxonEngine"
    -- Make this a library eventually
    kind "WindowedApp"
    language "C++"
    -- Using C++20, for concepts
    cppdialect "C++20"

    targetdir "build/bin/%{cfg.buildcfg}"
    objdir "build/obj/%{cfg.buildcfg}"
    
    files {
        "src/**.cpp",
        "include/**.h"
    }

    includedirs "include"
    links {
        "SDL2",
        "SDL2_image"
    }

    
    -- 32 Bit arch
    filter "configurations:*32"
        architecture "x86"
    
        
    filter "configurations:Debug32"
        defines {
            "AXON_DEBUG", 
            "AXON_32"
        }
        symbols "On"
        optimize "Off"
    
    filter "configurations:ReleaseSize32"
        defines {
            "AXON_RELEASE_SIZE",
            "AXON_32"
        } 
        symbols "Off"
        optimize "Size"
        
    filter "configurations:ReleaseSpeed32"
        defines {
            "AXON_RELEASE_SPEED",
            "AXON_32"
        }
        symbols "Off"
        optimize "Speed"

    filter "configurations:Release32"
        defines {
            "AXON_RELEASE",
            "AXON_32"
        }
        symbols "Off"
        optimize "Full"
        
        -- 64 Bit arch        
    filter "configurations:*64"
    architecture "x86_64"

    filter "configurations:Debug64"
    defines {"AXON_DEBUG", "AXON_64"}
    symbols "On"
        optimize "Off"

        filter "configurations:ReleaseSize64"
        defines {
            "AXON_RELEASE_SIZE",
            "AXON_64"
        }
        symbols "Off"
        optimize "Size"

    filter "configurations:ReleaseSpeed64"
        defines {
            "AXON_RELEASE_SPEED",
            "AXON_64"
        }
        symbols "Off"
        optimize "Speed"

        filter "configurations:Release64"
        defines {
            "AXON_RELEASE",
            "AXON_64"
        }
        symbols "Off"
        optimize "Full"
        

    filter {"action:gmake*", "system:linux"}        
        -- Warnings
        buildoptions {
            "-Wall",
            "-Wpedantic",
            "-Wextra"
        }


        
        