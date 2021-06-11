output "context" {
  value       = local.input
  description = <<-EOT
  Merged but otherwise unmodified input to this module, to be used as context input to other modules.
  Note: this version will have null values as defaults, not the values actually used as defaults.
EOT
}

output "normalized_context" {
  value = local.output_context
}

# backward compability
output "external_alb_output_map" {
  value = local.external_alb_output_map
}

output "internal_alb_output_map" {
  value = local.internal_alb_output_map
}

output "ecs_module_output_map" {
  value = local.ecs_output_map
}

output "cloudposse_context" {
  value = module.this.context
}

output "id" {
  value = module.this.id
}

