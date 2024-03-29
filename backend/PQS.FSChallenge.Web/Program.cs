using Microsoft.EntityFrameworkCore;
using PQS.FSChallenge.Business.Services;
using PQS.FSChallenge.Business.Models;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Habilitar CORS
builder.Services.AddCors();
//Db Context
builder.Services.AddDbContext<FSChallengeContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("PQSDB"));
});

//Services
builder.Services.AddScoped<OrderService>();
//Service para ignorar ciclos.
builder.Services.AddControllers().AddJsonOptions(x => x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
//Parametros para CORS.
app.UseCors(builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());

app.UseAuthorization();

app.MapControllers();

app.Run();
