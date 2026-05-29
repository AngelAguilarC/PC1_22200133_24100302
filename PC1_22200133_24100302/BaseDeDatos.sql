CREATE DATABASE TallerMecanicoDB;
GO

USE TallerMecanicoDB;
GO

CREATE TABLE TipoServicio (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    PrecioBase DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE Cliente (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Paterno NVARCHAR(50) NOT NULL,
    Materno NVARCHAR(50) NOT NULL,
    Nombres NVARCHAR(100) NOT NULL,
    Correo NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(20) NOT NULL
);
GO

CREATE TABLE Vehiculo (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Placa NVARCHAR(10) NOT NULL,
    Marca NVARCHAR(50) NOT NULL,
    Modelo NVARCHAR(50) NOT NULL,
    Anio INT NOT NULL,
    ClienteId INT NOT NULL,
    CONSTRAINT FK_Vehiculo_Cliente FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
);
GO

CREATE TABLE OrdenServicio (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FechaIngreso DATETIME NOT NULL,
    DescripcionProblema NVARCHAR(500) NOT NULL,
    CostoEstimado DECIMAL(10,2) NOT NULL,
    Estado NVARCHAR(50) NOT NULL,
    VehiculoId INT NOT NULL,
    TipoServicioId INT NOT NULL,
    CONSTRAINT FK_OrdenServicio_Vehiculo FOREIGN KEY (VehiculoId) REFERENCES Vehiculo(Id),
    CONSTRAINT FK_OrdenServicio_TipoServicio FOREIGN KEY (TipoServicioId) REFERENCES TipoServicio(Id)
);
GO
