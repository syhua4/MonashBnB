using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MonashBnB.Startup))]
namespace MonashBnB
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
