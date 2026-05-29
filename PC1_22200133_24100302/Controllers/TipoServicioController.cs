using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PC1_22200133_24100302.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TipoServicioController : ControllerBase
    {
        private readonly ITipoServicioRepository _tipoServicioRepository;
        public TipoServicioController(ITipoServicioRepository tipoServicioRepository)
        {
            _tipoServicioRepository = tipoServicioRepository;
        }

        [HttpGet]
        public async Task<IActionResult> GetTipoServicio()
        {
            var tipoServicios = await _tipoServicioRepository.GetTipoServicio();
            return Ok(tipoServicios);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetTipoServicioById(int id)
        {
            var tipoServicio = await _tipoServicioRepository.GetTipoServicioById(id);
            if (tipoServicio == null)
            {
                return NotFound();
            }
            return Ok(tipoServicio);
        }

        [HttpPost]
        public async Task<IActionResult> CreateTipoServicio(TipoServicio tipoServicio)
        {
            await _tipoServicioRepository.CreateTipoServicio(tipoServicio);
            return CreatedAtAction(nameof(GetTipoServicioById), new { id = tipoServicio.Id }, tipoServicio);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTipoServicio(int id)
        {
            await _tipoServicioRepository.DeleteTipoServicio(id);
            return NoContent();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateTipoServicio(int id, TipoServicio tipoServicio)
        {
            if (id != tipoServicio.Id)
            {
                return BadRequest();
            }
            await _tipoServicioRepository.UpdateTipoServicio(tipoServicio);
            return NoContent();
        }

    }
}
