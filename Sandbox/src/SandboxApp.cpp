#include <XB.h>

class Sandbox : public XB::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}

};

XB::Application* XB::CreateApplication()
{
	return new Sandbox();
}