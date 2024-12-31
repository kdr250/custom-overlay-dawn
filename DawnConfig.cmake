add_library(dawn::webgpu_dawn SHARED IMPORTED)
get_filename_component(DAWN_BASE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

# add info about location of the dynamic library file
if (WIN32)
    cmake_path(SET DAWN_DLL_PATH_DEBUG NORMALIZE ${DAWN_BASE_DIR}/debug/bin/webgpu_dawn.dll)
    cmake_path(SET DAWN_LIB_PATH_DEBUG NORMALIZE ${DAWN_BASE_DIR}/debug/lib/webgpu_dawn.lib)
    set_target_properties(
        dawn::webgpu_dawn PROPERTIES
        IMPORTED_LOCATION_DEBUG "${DAWN_DLL_PATH_DEBUG}"
        IMPORTED_IMPLIB_DEBUG "${DAWN_LIB_PATH_DEBUG}"
    )

    cmake_path(SET DAWN_DLL_PATH_RELEASE NORMALIZE ${DAWN_BASE_DIR}/bin/webgpu_dawn.dll)
    cmake_path(SET DAWN_LIB_PATH_RELEASE NORMALIZE ${DAWN_BASE_DIR}/lib/webgpu_dawn.lib)
    set_target_properties(
        dawn::webgpu_dawn PROPERTIES
        IMPORTED_LOCATION_RELEASE "${DAWN_DLL_PATH_RELEASE}"
        IMPORTED_IMPLIB_RELEASE "${DAWN_LIB_PATH_RELEASE}"
    )

elseif (APPLE)
    set_target_properties(
        dawn::webgpu_dawn PROPERTIES
        IMPORTED_IMPLIB_DEBUG "${DAWN_BASE_DIR}/debug/lib/libwebgpu_dawn.dylib"
    )
    set_target_properties(
        dawn::webgpu_dawn PROPERTIES
        IMPORTED_IMPLIB_RELEASE "${DAWN_BASE_DIR}/lib/libwebgpu_dawn.dylib"
    )
endif()

target_include_directories(dawn::webgpu_dawn INTERFACE "${DAWN_BASE_DIR}/include")
