# # Create custom policy to enforce specific tags on Resource Groups
# resource "azurerm_policy_definition" "enforce_tags_resource_groups" {
#   name                 = "enforce-tags-resource-groups"
#   policy_type          = "Custom"
#   mode                 = "All"
#   display_name         = "TF Enforce Tags on Resource Groups"
#   parameters           = <<PARAMETERS
# 	{
# 		"effectType"         : {
# 			"type"               : "String",
# 			"allowedValues"     : [
# 				"Audit",
# 				"Deny",
# 				"Disabled"
# 			],
# 			"metadata"          : {
# 				"displayName"      : "Effect",
# 				"description"      : "Configure the execution of the policy"
# 			}
# 		}
# 	}
#   PARAMETERS
#   policy_rule          = <<POLICY_RULE
# {
# 	"if": {
# 		"allOf": [
# 			{
# 				"anyOf": [
# 					{
# 						"field": "tags",
# 						"notContainsKey": "business_owner"
# 					},
# 					{
# 						"field": "tags",
# 						"notContainsKey": "cost_centre"
# 					},
# 					{
# 						"field": "tags",
# 						"notContainsKey": "application_name"
# 					}
# 				]
# 			},
# 			{
#             	"field": "type",
#             	"equals": "Microsoft.Resources/subscriptions/resourceGroups"
#           	}
# 		]
# 	},
# 	"then": {
# 		"effect": "[parameters('effectType')]"
# 	}
# }
# POLICY_RULE
# }

# # Assign above custom Policy to subscription
# resource "azurerm_policy_assignment" "enforce_tags_resource_groups" {
#   name                 = "enforce-tags-resource-groups"
#   scope                = "/subscriptions/${var.subscription_id}"
#   policy_definition_id = azurerm_policy_definition.enforce_tags_resource_groups.id
#   description          = "Policy Assignment for enforcing tagging strategy on Resource Groups"
#   display_name         = "TF Enforce Tags on Resource Groups"

# 	parameters            = <<PARAMETERS
#     {
#     "effectType": {
#     	"value"            : "${var.enforce_tags_effect_type}"
#     }
#   }
# PARAMETERS
# }

