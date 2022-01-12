terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

provider "aws" {
 
 region = var.region
 access_key= var.access_key
 secret_key= var.secret_key
 
}





resource "aws_dynamodb_table" "basic-dynamodb-table_provisioned" {
  count = var.dynamo_provided == true ? 1 : 0
  name           = var.dynamo_db_name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.dynamo_read_capacity
  write_capacity = var.dynamo_write_capacity
  hash_key       = var.dynamo_hash_key
  range_key      = var.dynamo_range_key


  replica {
    region_name = "us-east-2"
  }

  replica {
    region_name = "us-west-2"
  }

  dynamic "attribute" {
    for_each = var.dynamo_atributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}



resource "aws_dynamodb_table" "basic-dynamodb-table_pay_per_request" {
  count = var.dynamo_provided == false ? 1 : 0
  name           = var.dynamo_db_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.dynamo_hash_key
  range_key      = var.dynamo_range_key


  dynamic "attribute" {
    for_each = var.dynamo_atributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  replica {
    region_name = "us-east-2"
  }

  replica {
    region_name = "us-west-2"
  }


  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}










/*

resource "aws_dynamodb_table" "basic-dynamodb-table_pay_per_request" {
  count = var.dynamo_provided == false ? 1 : 0
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  attribute {
    name = "TopScore"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "GameTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "TopScore"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}
*/