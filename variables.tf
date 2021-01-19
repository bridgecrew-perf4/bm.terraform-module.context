/*locals {
  # External ALB output map
  external_alb_output_map = {
    "listener_arn"              = var.alb_external_enabled ? module.alb_default_external.https_listener_arn : ""
    "dns_name"                  = var.alb_external_enabled ? module.alb_default_external.alb_dns_name : ""
    "dns_zone_id"               = var.alb_external_enabled ? module.alb_default_external.alb_zone_id : ""
    "allowed_security_group_id" = var.alb_external_enabled ? module.alb_default_external.security_group_id : ""
  }
  # Internal ALB output map
  internal_alb_output_map = {
    "listener_arn"              = var.alb_internal_enabled ? module.alb_default_internal.https_listener_arn : ""
    "dns_name"                  = var.alb_internal_enabled ? module.alb_default_internal.alb_dns_name : ""
    "dns_zone_id"               = var.alb_internal_enabled ? module.alb_default_internal.alb_zone_id : ""
    "allowed_security_group_id" = var.alb_internal_enabled ? module.alb_default_internal.security_group_id : ""
  }
  # Map passed to ecs-service module to simplify manifests
  output_map = {
    #General variables
    "label_id"   = module.label.id
    "name"       = var.name
    "stage"      = var.stage
    "namespace"  = var.namespace
    "attributes" = var.attributes
    "tags"       = var.tags
    "region"     = var.region
    "delimiter"  = var.delimiter
    #Network variables
    "vpc_id"                          = var.vpc_id
    "service_internal_security_group" = aws_security_group.ecs_sg_internal.id
    #ECS Cluster variables
    "ecs_cluster_arn"               = aws_ecs_cluster.default.arn
    "launch_type"                   = var.launch_type
    "aws_logs_region"               = var.region
    "aws_cloudwatch_log_group_name" = aws_cloudwatch_log_group.app.name
    "deploy_iam_access_key"         = var.drone-io_enabled ? module.drone-io.access_key : ""
    "deploy_iam_secret_key"         = var.drone-io_enabled ? module.drone-io.secret_key : ""
    #"ecr_urls"                        = var.ecr_enabled ? module.ecr.name_to_url : ""
    # ALB variables
    "domain_name"             = "${var.name}.${var.namespace}.${var.alb_main_domain}"
    "domain_zone_id"          = (var.alb_internal_enabled || var.alb_external_enabled) && var.alb_main_domain != "" ? data.aws_route53_zone.zone.zone_id : ""
    "alb_acm_certificate_arn" = (var.alb_internal_enabled || var.alb_external_enabled) && length(aws_acm_certificate.alb_cert) > 0 ? aws_acm_certificate.alb_cert[0].arn : ""
    # KMS outputs
    "kms_key_alias_arn"              = module.kms_key.alias_arn
    "kms_key_alias_name"             = module.kms_key.alias_name
    "kms_key_arn"                    = module.kms_key.key_arn
    "kms_key_id"                     = module.kms_key.key_id
    "kms_key_access_policy_arn"      = aws_iam_policy.kms_key_access_policy.arn
    # Service discovery outputs
    "service_discovery_namespace_id" = join("", aws_service_discovery_private_dns_namespace.default.*.id)
    "service_discovery_name"         = join("", aws_service_discovery_private_dns_namespace.default.*.name)
  }
}*/

variable "context-ecs" {
  type = object({
    enabled                             = bool
    namespace                           = string
    environment                         = string
    stage                               = string
    name                                = string
    delimiter                           = string
    attributes                          = list(string)
    tags                                = map(string)
    additional_tag_map                  = map(string)
    regex_replace_chars                 = string
    label_order                         = list(string)
    id_length_limit                     = number
    alb_external_enabled                = bool
    alb_external_listener_arn           = string
    alb_external_dns_name               = string
    alb_external_dns_zone_id            = string
    alb_external_allowed_security_group = string
    alb_internal_enabled                = bool
    alb_internal_listener_arn           = string
    alb_internal_dns_name               = string
    alb_internal_dns_zone_id            = string
    alb_internal_allowed_security_group = string
    service_internal_security_group    = string
    region                              = string
    vpc_id                              = string
    launch_type                         = string
    ecs_cluster_arn                     = string
    aws_logs_region                     = string
    aws_cloudwatch_log_group_name       = string
    deploy_iam_access_key               = string
    deploy_iam_secret_key               = string
    domain_name                         = string
    domain_zone_id                      = string
    alb_acm_certificate_arn             = string
    kms_key_alias_arn                   = string
    kms_key_alias_name                  = string
    kms_key_arn                         = string
    kms_key_id                          = string
    kms_key_access_policy_arn           = string
    service_discovery_namespace_id      = string
    service_discovery_name              = string
    depends_on_modules                  = list(string)
  })
  default = {
    enabled                             = true
    namespace                           = null
    environment                         = null
    stage                               = null
    name                                = null
    delimiter                           = null
    attributes                          = []
    tags                                = {}
    additional_tag_map                  = {}
    regex_replace_chars                 = null
    label_order                         = []
    id_length_limit                     = null
    alb_external_enabled                = false
    alb_external_listener_arn           = null
    alb_external_dns_name               = null
    alb_external_dns_zone_id            = null
    alb_external_allowed_security_group = null
    alb_internal_enabled                = false
    alb_internal_listener_arn           = null
    alb_internal_dns_name               = null
    alb_internal_dns_zone_id            = null
    alb_internal_allowed_security_group = null
    service_internal_security_group    = null
    region                              = null
    vpc_id                              = null
    launch_type                         = null
    ecs_cluster_arn                     = null
    aws_logs_region                     = null
    aws_cloudwatch_log_group_name       = null
    deploy_iam_access_key               = null
    deploy_iam_secret_key               = null
    domain_name                         = null
    domain_zone_id                      = null
    alb_acm_certificate_arn             = null
    kms_key_alias_arn                   = null
    kms_key_alias_name                  = null
    kms_key_arn                         = null
    kms_key_id                          = null
    kms_key_access_policy_arn           = null
    service_discovery_namespace_id      = null
    service_discovery_name              = null
    depends_on_modules                  = []
  }
}

variable "alb_external_enabled" {
  type    = bool
  default = null
}
variable "alb_external_listener_arn" {
  type    = string
  default = null
}
variable "alb_external_dns_name" {
  type    = string
  default = null
}
variable "alb_external_dns_zone_id" {
  type    = string
  default = null
}
variable "alb_external_allowed_security_group" {
  type    = list(string)
  default = null
}

variable "alb_internal_enabled" {
  type    = bool
  default = null
}
variable "alb_internal_listener_arn" {
  type    = string
  default = null
}
variable "alb_internal_dns_name" {
  type    = string
  default = null
}
variable "alb_internal_dns_zone_id" {
  type    = string
  default = null
}
variable "alb_internal_allowed_security_group" {
  type    = list(string)
  default = null
}

variable "region" {
  type    = string
  default = null
}

variable "service_internal_security_group" {
  type = string
  default = null
}

variable "vpc_id" {
  type    = string
  default = null
}

variable "launch_type" {
  type    = string
  default = "FARGATE"
}

variable "ecs_cluster_arn" {
  type    = string
  default = null
}

variable "aws_logs_region" {
  type    = string
  default = null
}

variable "aws_cloudwatch_log_group_name" {
  type    = string
  default = null
}

variable "deploy_iam_access_key" {
  type    = string
  default = null
}

variable "deploy_iam_secret_key" {
  type    = string
  default = null
}

variable "domain_name" {
  type    = string
  default = null
}

variable "domain_zone_id" {
  type    = string
  default = null
}

variable "alb_acm_certificate_arn" {
  type    = string
  default = null
}

variable "kms_key_alias_arn" {
  type    = string
  default = null
}

variable "kms_key_alias_name" {
  type    = string
  default = null
}

variable "kms_key_arn" {
  type    = string
  default = null
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "kms_key_access_policy_arn" {
  type    = string
  default = null
}

variable "service_discovery_namespace_id" {
  type    = string
  default = null
}

variable "service_discovery_name" {
  type    = string
  default = null
}

variable "depends_on_modules" {
  type    = list(string)
  default = null
}

variable "additional_depends_on_modules" {
  type    = list(string)
  default = null
}

# backward compability
variable "ecs_module_output_map" {
  type = object({
    name                            = string
    stage                           = string
    namespace                       = string
    attributes                      = list(string)
    tags                            = map(string)
    delimiter                       = string
    region                          = string
    vpc_id                          = string
    service_internal_security_group = string
    ecs_cluster_arn                 = string
    launch_type                     = string
    aws_logs_region                 = string
    aws_cloudwatch_log_group_name   = string
    deploy_iam_access_key           = string
    deploy_iam_secret_key           = string
    domain_name                     = string
    domain_zone_id                  = string
    alb_acm_certificate_arn         = string
    kms_key_alias_arn               = string
    kms_key_alias_name              = string
    kms_key_arn                     = string
    kms_key_id                      = string
    kms_key_access_policy_arn       = string
    service_discovery_namespace_id  = string
    service_discovery_name          = string
  })
  description = "ECS module output map"
  default     = null
}

/*
variable "ecs_module_alb_output_map" {
  type = object({
    listener_arn              = string
    dns_name                  = string
    dns_zone_id               = string
    allowed_security_group_id = string
  })
  description = "ECS module target alb output map"
  default = {
    listener_arn              = null
    dns_name                  = null
    dns_zone_id               = null
    allowed_security_group_id = null
  }
}*/
