
variable "client_id" {
    description = "Client ID for TF Service Principal"
}

variable "subscription_id" {
    description = "Subscription ID for TF Service Principal"
}

variable "tenant_id" {
    description = "Tenant ID for TF Service Principal"
}

variable "client_secret" {
    description = "Client secret for TF Service Principal"
}

variable "enforce_tags_effect_type" {
    description = "Configures whether or not Tags are enforced on Resource Groups"
    default = "Deny"
}