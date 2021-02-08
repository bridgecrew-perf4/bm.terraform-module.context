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
    private_subnets                     = list(string)
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
    service_internal_security_group     = string
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
    private_subnets                     = null
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
    service_internal_security_group     = null
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
  type    = string
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
  type    = string
  default = null
}

variable "region" {
  type    = string
  default = null
}

variable "service_internal_security_group" {
  type    = string
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

variable "private_subnets" {
  type    = list(string)
  default = null
}