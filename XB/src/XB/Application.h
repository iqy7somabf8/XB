#pragma once

#include "Core.h"


namespace XB {

	class XB_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in CLIENT
	Application* CreateApplication();

}