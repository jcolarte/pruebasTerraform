# Reto Final Terraform - Despliegue de Infraestructura en Azure

## Objetivo

Construir una solución de infraestructura reutilizable utilizando Terraform siguiendo buenas prácticas de organización, modularidad y gestión del estado.

---

## Escenario

La empresa **Contoso Training** necesita desplegar una aplicación interna en Azure.

El equipo de infraestructura ha definido los siguientes requisitos:

### Infraestructura requerida

#### Resource Group

* Crear un Resource Group para alojar todos los recursos.

#### Red

* Crear una Virtual Network.
* Crear una Subnet.

#### Almacenamiento

* Crear un Storage Account.
* Habilitar versionado de blobs.

#### Cómputo

* Crear una Máquina Virtual Linux.
* La VM debe estar conectada a la Subnet creada.

---

## Requisitos Técnicos

### 1. Separación de archivos

La solución debe contener como mínimo:

* versions.tf
* providers.tf
* main.tf
* variables.tf
* outputs.tf
* terraform.tfvars

---

### 2. Uso de Variables

Todos los siguientes valores deben parametrizarse:

* Nombre del Resource Group
* Región
* Nombre de la VNet
* Espacio de direcciones de la VNet
* Nombre de la Subnet
* Rango de la Subnet
* Nombre del Storage Account
* Nombre de la VM
* Tamaño de la VM

No se permiten valores hardcodeados dentro de los recursos.

---

### 3. Uso de Módulos

Se deben crear como mínimo dos módulos propios:

#### Módulo de Red

Responsable de crear:

* Virtual Network
* Subnet

#### Módulo de Storage

Responsable de crear:

* Storage Account
* Configuración de versionado

Opcional:

Crear un tercer módulo para la VM.

---

### 4. Outputs

Exponer al menos:

* Nombre del Resource Group
* ID de la VNet
* ID de la Subnet
* Nombre del Storage Account

---

### 5. Backend Remoto

Configurar el estado remoto utilizando Azure Storage Account.

El backend debe almacenar:

* terraform.tfstate

No se permite utilizar estado local.

---

### 6. Ambientes

Implementar dos ambientes utilizando archivos tfvars:

#### dev.tfvars

* VM tamaño pequeño
* Naming con sufijo dev

#### prod.tfvars

* VM tamaño mediano
* Naming con sufijo prod

Ejemplo:

terraform plan -var-file="dev.tfvars"

terraform plan -var-file="prod.tfvars"

---

## Estructura Esperada

terraform-final/

├── versions.tf

├── providers.tf

├── main.tf

├── variables.tf

├── outputs.tf

├── dev.tfvars

├── prod.tfvars

└── modules/

```
├── network/

    ├── main.tf

    ├── variables.tf

    └── outputs.tf

└── storage/

    ├── main.tf

    ├── variables.tf

    └── outputs.tf
```

---

## Entregables

Cada grupo deberá presentar:

1. Estructura completa del proyecto.
2. Explicación de los módulos creados.
3. Ejecución de terraform init.
4. Ejecución de terraform plan utilizando dev.tfvars.
5. Evidencia del backend remoto funcionando.
6. Explicación de los outputs generados.
7. Archivo README.md explicando el proyecto.

---

## Criterios de Evaluación

| Criterio                        | Puntos |
| ------------------------------- | ------ |
| Separación correcta de archivos | 20     |
| Uso adecuado de variables       | 20     |
| Construcción de módulos         | 30     |
| Backend remoto funcional        | 20     |
| Outputs correctamente definidos | 10     |

**Total: 100 puntos**

---

## Bonus (No obligatorio)

Agregar:

* Network Security Group.
* Asociación del NSG a la Subnet.
* Tercer módulo para la VM.

 