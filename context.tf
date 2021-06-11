variable "enabled" {
  type        = bool
  default     = null
  description = "Set to false to prevent the module from creating any resources"
}

variable "namespace" {
  type        = string
  default     = null
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "environment" {
  type        = string
  default     = null
  description = "Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT'"
}

variable "stage" {
  type        = string
  default     = null
  description = "Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release'"
}

variable "name" {
  type        = string
  default     = null
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "delimiter" {
  type        = string
  default     = null
  description = <<-EOT
    Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.
    Defaults to `-` (hyphen). Set to `""` to use no delimiter at all.
  EOT
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

variable "additional_tag_map" {
  type        = map(string)
  default     = {}
  description = "Additional tags for appending to tags_as_list_of_maps. Not added to `tags`."
}

variable "label_order" {
  type        = list(string)
  default     = null
  description = <<-EOT
    The naming order of the id output and Name tag.
    Defaults to ["namespace", "environment", "stage", "name", "attributes"].
    You can omit any of the 5 elements, but at least one must be present.
  EOT
}

variable "regex_replace_chars" {
  type        = string
  default     = null
  description = <<-EOT
    Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.
    If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits.
  EOT
}

variable "id_length_limit" {
  type        = number
  default     = null
  description = <<-EOT
    Limit `id` to this many characters.
    Set to `0` for unlimited length.
    Set to `null` for default, which is `0`.
    Does not affect `id_full`.
  EOT
}


locals {
  input_context = {
    enabled             = var.enabled != null ? var.enabled : (var.context-ecs.enabled != null ? var.context-ecs.enabled : null)
    namespace           = var.namespace != null ? var.namespace : (var.context-ecs.namespace != null ? var.context-ecs.namespace : null)
    environment         = var.environment != null ? var.environment : (var.context-ecs.environment != null ? var.context-ecs.environment : null)
    stage               = var.stage != null ? var.stage : (var.context-ecs.stage != null ? var.context-ecs.stage : null)
    name                = var.name != null ? var.name : (var.context-ecs.name != null ? var.context-ecs.name : null)
    delimiter           = var.delimiter != null ? var.delimiter : (var.context-ecs.delimiter != null ? var.context-ecs.delimiter : null)
    attributes          = compact(distinct(concat(coalesce(var.context-ecs.attributes, []), coalesce(var.attributes, []))))
    tags                = merge(var.context-ecs.tags, var.tags)
    additional_tag_map  = merge(var.context-ecs.additional_tag_map, var.additional_tag_map)
    label_order         = var.label_order == null ? var.context-ecs.label_order : var.label_order
    regex_replace_chars = var.regex_replace_chars != null ? var.regex_replace_chars : (var.context-ecs.regex_replace_chars != null ? var.context-ecs.regex_replace_chars : null)
    id_length_limit     = var.id_length_limit != null ? var.id_length_limit : (var.context-ecs.id_length_limit != null ? var.context-ecs.id_length_limit : null)
  }
}


module "this" {
  source  = "cloudposse/label/null"
  version = "0.24.1"

  enabled             = local.input_context.enabled
  namespace           = local.input_context.namespace
  environment         = local.input_context.environment
  stage               = local.input_context.stage
  name                = local.input_context.name
  delimiter           = local.input_context.delimiter
  attributes          = local.input_context.attributes
  tags                = local.input_context.tags
  additional_tag_map  = local.input_context.additional_tag_map
  label_order         = local.input_context.label_order
  regex_replace_chars = local.input_context.regex_replace_chars
  id_length_limit     = local.input_context.id_length_limit

}
