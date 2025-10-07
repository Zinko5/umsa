
var builder = WebApplication.CreateBuilder(args);

// Agregar soporte para controladores
builder.Services.AddControllers();

builder.WebHost.UseUrls("http://localhost:5001");

var app = builder.Build();

// Configuración del pipeline
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseRouting();
app.MapControllers();

app.Run();