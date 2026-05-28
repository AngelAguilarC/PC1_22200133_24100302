CREATE DATABASE MecanicaPC1;

USE MecanicaPC1;

CREATE TABLE TipoServicio (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    precioBase DECIMAL(10,2) NOT NULL
);

CREATE TABLE Cliente (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    paterno NVARCHAR(50) NOT NULL,
    materno NVARCHAR(50) NOT NULL,
    nombres NVARCHAR(100) NOT NULL,
    correo NVARCHAR(100),
    telefono NVARCHAR(20)
);

CREATE TABLE Vehiculo (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    placa NVARCHAR(20) NOT NULL UNIQUE,
    marca NVARCHAR(50) NOT NULL,
    modelo NVARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    clienteId INT NOT NULL,
    CONSTRAINT FK_Vehiculo_Cliente FOREIGN KEY (clienteId) 
        REFERENCES Cliente(Id)
        ON DELETE CASCADE
);

CREATE TABLE OrdenServicio (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    fechaIngreso DATETIME NOT NULL DEFAULT GETDATE(),
    descripcionProblema NVARCHAR(500),
    costoEstimado DECIMAL(10,2),
    estado NVARCHAR(50) NOT NULL, -- Por ejemplo: 'Abierta', 'En proceso', 'Finalizada'
    vehiculoId INT NOT NULL,
    tiposervicioId INT NOT NULL,
    CONSTRAINT FK_OrdenServicio_Vehiculo FOREIGN KEY (vehiculoId)
        REFERENCES Vehiculo(Id)
        ON DELETE CASCADE,
    CONSTRAINT FK_OrdenServicio_TipoServicio FOREIGN KEY (tiposervicioId)
        REFERENCES TipoServicio(Id)
);

CREATE INDEX IDX_Vehiculo_ClienteId ON Vehiculo(clienteId);

CREATE INDEX IDX_OrdenServicio_VehiculoId ON OrdenServicio(vehiculoId);

CREATE INDEX IDX_OrdenServicio_TipoServicioId ON OrdenServicio(tiposervicioId);