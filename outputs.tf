output "id" {
  value       = local.enabled ? local.id : ""
  description = "ID string"
}

output "enabled" {
  value       = local.enabled
  description = "True if module is enabled, false otherwise"
}

output "team" {
  value       = local.enabled ? local.team : ""
  description = "Normalized team"
}

output "environment" {
  value       = local.enabled ? local.environment : ""
  description = "Normalized environment"
}

output "name" {
  value       = local.enabled ? local.name : ""
  description = "Normalized name"
}

output "region" {
  value       = local.enabled ? local.region : ""
  description = "Normalized region"
}

output "delimiter" {
  value       = local.enabled ? local.delimiter : ""
  description = "Delimiter between  `tenant`, `environment`, `stage`, `name` and `attributes`"
}

output "attributes" {
  value       = local.enabled ? local.attributes : []
  description = "List of attributes"
}

output "tags" {
  value       = local.enabled ? local.tags : {}
  description = "Normalized Tag map"
}

output "additional_tag_map" {
  value       = local.additional_tag_map
  description = "The merged additional_tag_map"
}

output "label_order" {
  value       = local.label_order
  description = "The naming order actually used to create the ID"
}

output "regex_replace_chars" {
  value       = local.regex_replace_chars
  description = "The regex_replace_chars actually used to create the ID"
}

output "tags_as_list_of_maps" {
  value       = local.tags_as_list_of_maps
  description = <<-EOT
    This is a list with one map for each `tag`. Each map contains the tag `key`,
    `value`, and contents of `var.additional_tag_map`. Used in the rare cases
    where resources need additional configuration information for each tag.
    EOT
}

output "normalized_context" {
  value       = local.output_context
  description = "Normalized context of this module"
}

output "context" {
  value       = local.input
  description = <<-EOT
  Merged but otherwise unmodified input to this module, to be used as context input to other modules.
  Note: this version will have null values as defaults, not the values actually used as defaults.
EOT
}
