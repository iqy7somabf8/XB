#pragma once

#ifdef XB_PLATFORM_WINDOWS 
	#ifdef XB_BUILD_DLL
		#define XB_API __declspec(dllexport)
	#else
		#define XB_API __declspec(dllimport)
	#endif
#else
	#error XB only supports Windows!
#endif