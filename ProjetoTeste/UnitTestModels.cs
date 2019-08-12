using System;
using Xunit;
using MyFinance.Models;

namespace ProjetoTeste
{
    public class UnitTestModels
    {
        [Fact]
        public void TestLoginUsuario()
        {
            UsuarioModel usuarioModel = new UsuarioModel();
            usuarioModel.Email = "kleber.rampelotti@gmail.com";
            usuarioModel.Senha = "123456";
            bool result = usuarioModel.ValidarLogin();
            Assert.True(result);          
                       
        }
    }
}
