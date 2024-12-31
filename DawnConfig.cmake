add_library(dawn::webgpu_dawn SHARED IMPORTED)
get_filename_component(DAWN_BASE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

# add info about location of the dynamic library file
if (WIN32)
    # TODO
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
