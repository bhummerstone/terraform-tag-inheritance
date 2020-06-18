variable "name" {
    description = "Name of Storage Account"
}

variable "location" {
    description = "Location of Storage Account"
}

variable "rg_name" {
    description = "Resource Group for Storage Account"
}

variable "type" {
    description = "Account Tier for Storage Account e.g. Standard, Premium"
}

variable "replication" {
    description = "Replication type for Storage Account e.g. LRS, GRS"
}