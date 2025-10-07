using Microsoft.AspNetCore.Mvc;

namespace _6_2.Controllers  // Ajustado al nombre del proyecto "6-2"
{
    [ApiController]
    [Route("[controller]")]  // Ruta base: /calculadora
    public class CalculadoraController : ControllerBase
    {
        [HttpGet("suma")]  // Endpoint: /calculadora/suma?num1=5&num2=3
        public IActionResult Suma(double num1, double num2)
        {
            try
            {
                double resultado = num1 + num2;
                return Ok(new { Resultado = resultado });  // Respuesta JSON: {"Resultado": 8}
            }
            catch (Exception ex)
            {
                return BadRequest($"Error: {ex.Message}");
            }
        }
    }
}