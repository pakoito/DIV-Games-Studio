# Sample toolchain file for building for Windows from an Ubuntu Linux system.
#
# Typical usage:
#    *) install cross compiler: `sudo apt-get install mingw-w64 g++-mingw-w64`
#    *) cd build
#    *) cmake -DCMAKE_TOOLCHAIN_FILE=~/Toolchain-Ubuntu-mingw64.cmake ..

set(CMAKE_SYSTEM_NAME Linux)
SET(PANDORA=1)
SET(PLATFORM "PANDORA")

SET(HAS_SDL 1)
SET(HAS_SDLTTF 0)
SET(HAS_SDLIMAGE 1)
SET(HAS_ZLIB 1)
SET(HAS_SDLMIXER 1)
SET(HAS_DLL 1)
SET(HAS_JPEG 0)
SET(HAS_FLI 1)
SET(HAS_MODE8 1)
SET(HAS_GIT 0)



set(TOOLCHAIN_PREFIX pandora)
#set(TOOLCHAIN_PREFIX x86_64-w64-mingw32)

# cross compilers to use for C and C++
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)
set(CMAKE_RC_COMPILER ${TOOLCHAIN_PREFIX}-windres)

# target environment on the build host system
#   set 1st to dir with the cross compiler's C/C++ headers/libs
set(CMAKE_FIND_ROOT_PATH /home/mike/pandora-dev/arm-2011.09/)

# modify default behavior of FIND_XXX() commands to
# search for headers/libs in the target environment and
# search for programs in the build host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#TARGET_LINK_LIBRARIES ("mingw32 SDLmain  SDL SDL_Mixer")
#-mwindows /usr/i686-w64-mingw32/lib/x64/SDL_mixer.lib")
#set ( CMAKE_EXE_LINKER_FLAGS "-lmingw32 -lSDLmain  -lSDL -mwindows")
set ( OS_LINK_FLAGS "-L${CMAKE_FIND_ROOT_PATH}usr/lib/ -Wl,-rpath,${CMAKE_FIND_ROOT_PATH}usr/lib" )

SET (OS_DEFINITIONS "-mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp -I${CMAKE_FIND_ROOT_PATH}/usr/include" )

SET(OS_LIBS dl )

#-DMIXER) 

#SET(OSDEP "src/osdep/osdep.c" )

