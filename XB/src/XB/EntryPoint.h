#pragma once

#ifdef XB_PLATFORM_WINDOWS

extern XB::Application* XB::CreateApplication();

int main(int argc, char** argv)
{
	auto app = XB::CreateApplication();
	app->Run();
	delete app;
}

#endif