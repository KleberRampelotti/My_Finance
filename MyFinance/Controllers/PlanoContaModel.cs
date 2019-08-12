using System;
using Microsoft.AspNetCore.Http;

namespace MyFinance.Controllers
{
    internal class PlanoContaModel
    {
        private IHttpContextAccessor httpContextAccessor;

        public PlanoContaModel(IHttpContextAccessor httpContextAccessor)
        {
            this.httpContextAccessor = httpContextAccessor;
        }

        public IHttpContextAccessor HttpContextAccessor { get; internal set; }

        internal dynamic ListaPlanoContas()
        {
            throw new NotImplementedException();
        }
    }
}