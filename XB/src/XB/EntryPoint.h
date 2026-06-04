#pragma once

#ifdef XB_PLATFORM_WINDOWS

extern XB::Application* XB::CreateApplication();

int main(int argc, char** argv)
{
	XB::Log::Init();
	XB_CORE_INFO("Initialized Log!");
	int a = 5;
	XB_INFO("Hello! we gucci. Var={0}", a);

	auto app = XB::CreateApplication();
	app->Run();
	delete app;
}

#endif