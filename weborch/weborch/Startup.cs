using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(weborch.Startup))]
namespace weborch
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
