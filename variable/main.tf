terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

/*
resource "azurerm_resource_group" "finance-rg" {
  name     = var.az_details.rgname
  location = var.az_details.location
}

variable "az_rg_name" {

  description = "This is rg name"
  type        = string

}

variable "az_location_name" {

  description = "This is location name"
  type        = string
  default = "West Europe"
}
*/

/*
1) Environment variables "fromenv"
2) The terraform.tfvars file, if present. "fromterratfvars"
3) The terraform.tfvars.json file, if present. 
4) Any *.auto.tfvars or *.auto.tfvars.json files, "fromautotfvars"  processed in lexical order of their filenames.
5) Any -var and -var-file options on the command line, "fromparam" in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

string
number
bool

list(string) ["first","second"]

map(name="dinesh")
object({name = "dinesh", address= thane })
*/

variable "az_details" {
    type = object({
        rgname = string
        location = string
    })

    default = ({rgname="fromobj"
                location="southcentralus"})

}


resource "azurerm_resource_group" "finance-rg3" {
  name     = var.az_val_rgname
  location = var.az_val_location
}

variable "az_val_rgname" {

    type = string
    default = "dinesh-rg"
    validation {

        condition = can(regex("-rg$",var.az_val_rgname))
        error_message = "Resource group name shoudl end with -rg."
    }
}

variable "az_val_location" {
 
    validation {

        condition = can(index(["westus","eastus","us"],var.az_val_location) >= 0)
        error_message = "Location shoud be westus sounthcentralus westeurope."
    }


}


#index(["dinesh","bhuvan","deepak","prathmesh"],"bhuvan") != 0
#index(["dinesh","bhuvan","deepak","prathmesh"],"ajay") != 0

#contains(["dinesh","bhuvan","deepak","prathmesh"],"bhuvan")

/*
index(["westus","eastus","us"],var.az_val_location

0 1 2  >= 0 

item not found  >= 0 

blr-srv-01   mum-srv-01
*/
#substr(var.az_vm_name,0,3) == blr && substr(var.az_vm_name,0,3) == mum || substr(var.az_vm_name,0,3) == del