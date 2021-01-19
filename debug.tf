output "tags" {
  value = local.tags
}

output "input_context" {
  //value = local.input_context
  value = var.context-ecs
}