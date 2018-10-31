# - Try to find Terra
# Once done this will define
#
#  Terra_FOUND - system has Terra
#  Terra_INCLUDES - the Terra include directory
#  Terra_LIBRARY - Link these to use Terra

FIND_LIBRARY (Terra_LIBRARY_RELEASE NAMES terra
    PATHS
      ${Terra_ROOT}
      $ENV{Terra_ROOT}
      $ENV{LD_LIBRARY_PATH}
      $ENV{LIBRARY_PATH}
      /usr
      /usr/local
      /opt/local
    PATH_SUFFIXES
      lib
      lib64
    )
	
FIND_LIBRARY (Terra_LIBRARY_DEBUG NAMES terra
    PATHS
      ${Terra_ROOT}
      $ENV{Terra_ROOT}
      $ENV{LD_LIBRARY_PATH}
      $ENV{LIBRARY_PATH}
      /usr
      /usr/local
      /opt/local
    PATH_SUFFIXES
      lib
      lib64
    )	
	
	

FIND_PATH (Terra_INCLUDES terra/terra.h
    PATHS
      ${Terra_ROOT}
      $ENV{Terra_ROOT}
      ${CPATH}
      $ENV{CPATH}
      /usr
      /usr/local
      /opt/local
    PATH_SUFFIXES
      include
    )
 
IF(Terra_INCLUDES AND Terra_LIBRARY_RELEASE)
    SET(Terra_FOUND TRUE)
ENDIF(Terra_INCLUDES AND Terra_LIBRARY_RELEASE)

IF(NOT Terra_LIBRARY_DEBUG)
    SET(Terra_LIBRARY_DEBUG ${Terra_LIBRARY_RELEASE})
ENDIF()

IF(Terra_FOUND)
  SET(Terra_INCLUDES ${Terra_INCLUDES})

  find_package(ZLIB REQUIRED)
  
   IF (CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE)
        SET(Terra_LIBRARY optimized ${Terra_LIBRARY_RELEASE} debug ${Terra_LIBRARY_DEBUG} ${ZLIB_LIBRARIES} dl)
      ELSE()
        # if there are no configuration types and CMAKE_BUILD_TYPE has no value
        # then just use the release libraries
        SET(Terra_LIBRARY ${Terra_LIBRARY_RELEASE} ${ZLIB_LIBRARIES} dl)
      ENDIF()
  IF(NOT Terra_FIND_QUIETLY)
    MESSAGE(STATUS "Found Terra: ${Terra_LIBRARIES}")
  ENDIF(NOT Terra_FIND_QUIETLY)
ELSE(Terra_FOUND)
  IF(Terra_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Could not find Terra")
  ENDIF(Terra_FIND_REQUIRED)
ENDIF(Terra_FOUND)

