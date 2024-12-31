vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

file(GLOB_RECURSE DAWN_HEADERS "${CMAKE_CURRENT_LIST_DIR}/include/dawn/*.h")
file(COPY ${DAWN_HEADERS} DESTINATION "${CURRENT_PACKAGES_DIR}/include/dawn")

file(GLOB_RECURSE WEBGPU_HEADERS "${CMAKE_CURRENT_LIST_DIR}/include/webgpu/*.h")
file(COPY ${WEBGPU_HEADERS} DESTINATION "${CURRENT_PACKAGES_DIR}/include/webgpu")

if (WIN32)
    file(COPY "${CMAKE_CURRENT_LIST_DIR}/bin/webgpu_dawn.dll" DESTINATION "${CURRENT_PACKAGES_DIR}/bin")
    file(COPY "${CMAKE_CURRENT_LIST_DIR}/bin/webgpu_dawn.dll" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/bin")
    file(COPY "${CMAKE_CURRENT_LIST_DIR}/lib/webgpu_dawn.lib" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")
    file(COPY "${CMAKE_CURRENT_LIST_DIR}/lib/webgpu_dawn.lib" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib")
elseif (APPLE)
    file(COPY "${CMAKE_CURRENT_LIST_DIR}/lib/libwebgpu_dawn.dylib" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")
    file(COPY "${CMAKE_CURRENT_LIST_DIR}/lib/libwebgpu_dawn.dylib" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib")
endif()

file(COPY "${CMAKE_CURRENT_LIST_DIR}/DawnConfig.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
