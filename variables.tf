variable region {
  type        = string
  default     = "us-east-1"
  description = "registra la región donde despliega el modulo"
}

variable  access_key {
    type = string
    description = "llave de acceso"
}

variable secret_key {
    type = string
    description = "llave secreta de acceso"
}

variable key_pair_name{
    type = string
    description = "nombre del par de llaves de seguridad .pem"
}

variable key_pair_public_key {
    type = string
    description = "llave publica de acceso"
}
variable user_data {
   type = string
   description="configuración en ec2 que permite almacenar las configuraciones internas del servidor"
   default = "./userdata.yaml"
}

variable own_vpc{
    type = string
    description = "identificador unico en AWS del vpc"
    default = "vpc-e5b4dc98"
}

variable security_group_name {
   type = string
   description = "nombre del security group"
}

variable security_group_description {
    type = string
    description = "descripción del security group"
}

variable ami_id{
   type = string
   description = "número de id del ami"
   default = "ami-0ed9277fb7eb570c9"
}

variable instance_type_def{
  type = string
  description = "tipo de instancia"
  default = "t2.micro"
}


variable cidr_block_def{
type = string
description = "bloque de red definido para una subnet"
default = "10.0.1.0/24"

}


variable instance_tenancy_def {
  type = string
  description = "tipo de tenancy creado para vpc"
}

variable "aws_region" {
  default     = "us-west-2"
  description = "AWS Region to deploy example API Gateway REST API"
  type        = string
}

variable "rest_api_domain_name" {
  default     = "dominio.personal.diferente.com.co"
  description = "Domain name of the API Gateway REST API for self-signed TLS certificate"
  type        = string
}

variable "rest_api_name" {
  default     = "api-gateway-rest-api-openapi-example-terraform-alex"
  description = "Name of the API Gateway REST API (can be used to trigger redeployments)"
  type        = string
}

variable "rest_api_path" {
  default     = "/path1"
  description = "Path to create in the API Gateway REST API (can be used to trigger redeployments)"
  type        = string
}

variable "dynamo_provided" {
  default = false
  description = "permite conocer si la base de datos sera por costo PROVISIONED o por PAY_PER_REQUEST "
  type  = bool
}


variable "dynamo_hash_key" {
  description = "hash key de la tabla dynamo"
  type = string
  default = "UserId"
}

variable "dynamo_range_key" {
  description = "range key de la tabla dynamo"
  type = string
  default = "GameTitle"
}



variable "dynamo_atributes" {
  description= "registra todo el listado de atributos que existiran en la base de datos"
  type = list (object ({
                name = string
                type = string
               }))
   default = [
             {
               name="UserId"
               type="S"
             },
              {
               name="GameTitle"
               type="S"
             }
             ]            
}

variable "dynamo_read_capacity" {
  description = "dynamo_db read capacity"
  type = number
  default = 20 
}
variable "dynamo_write_capacity" {
  description = "dynamodb_write_capacity"
  type = number
  default = 20
}

variable "dynamo_db_name" {
  description = "name of database "
  type = string
  default = "GameScores"
}