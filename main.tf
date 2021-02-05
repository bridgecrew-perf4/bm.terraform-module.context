

locals {

  # Backward compability to ecs_module_output_map
  /*  legacy_name                            = var.ecs_module_output_map != null ? var.ecs_module_output_map["name"] : null
  legacy_stage                           = var.ecs_module_output_map != null ? var.ecs_module_output_map["stage"] : null
  legacy_namespace                       = var.ecs_module_output_map != null ? var.ecs_module_output_map["namespace"] : null
  legacy_attributes                      = var.ecs_module_output_map != null ? var.ecs_module_output_map["attributes"] : []
  legacy_tags                            = var.ecs_module_output_map != null ? var.ecs_module_output_map["tags"] : {}
  legacy_delimiter                       = var.ecs_module_output_map != null ? var.ecs_module_output_map["delimiter"] : null
  legacy_region                          = var.ecs_module_output_map != null ? var.ecs_module_output_map["region"] : null
  legacy_vpc_id                          = var.ecs_module_output_map != null ? var.ecs_module_output_map["vpc_id"] : null
  legacy_service_internal_security_group = var.ecs_module_output_map != null ? var.ecs_module_output_map["service_internal_security_group"] : null
  legacy_launch_type                     = var.ecs_module_output_map != null ? var.ecs_module_output_map["launch_type"] : null
  legacy_ecs_cluster_arn                 = var.ecs_module_output_map != null ? var.ecs_module_output_map["ecs_cluster_arn"] : null
  legacy_aws_logs_region                 = var.ecs_module_output_map != null ? var.ecs_module_output_map["aws_logs_region"] : null
  legacy_aws_cloudwatch_log_group_name   = var.ecs_module_output_map != null ? var.ecs_module_output_map["aws_cloudwatch_log_group_name"] : null
  legacy_deploy_iam_access_key           = var.ecs_module_output_map != null ? var.ecs_module_output_map["deploy_iam_access_key"] : null
  legacy_deploy_iam_secret_key           = var.ecs_module_output_map != null ? var.ecs_module_output_map["deploy_iam_secret_key"] : null
  legacy_domain_name                     = var.ecs_module_output_map != null ? var.ecs_module_output_map["domain_name"] : null
  legacy_domain_zone_id                  = var.ecs_module_output_map != null ? var.ecs_module_output_map["domain_zone_id"] : null
  legacy_alb_acm_certificate_arn         = var.ecs_module_output_map != null ? var.ecs_module_output_map["alb_acm_certificate_arn"] : null
  legacy_kms_key_alias_arn               = var.ecs_module_output_map != null ? var.ecs_module_output_map["kms_key_alias_arn"] : null
  legacy_kms_key_alias_name              = var.ecs_module_output_map != null ? var.ecs_module_output_map["kms_key_alias_name"] : null
  legacy_kms_key_arn                     = var.ecs_module_output_map != null ? var.ecs_module_output_map["kms_key_arn"] : null
  legacy_kms_key_id                      = var.ecs_module_output_map != null ? var.ecs_module_output_map["kms_key_id"] : null
  legacy_kms_key_access_policy_arn       = var.ecs_module_output_map != null ? var.ecs_module_output_map["kms_key_access_policy_arn"] : null
  legacy_service_discovery_namespace_id  = var.ecs_module_output_map != null ? var.ecs_module_output_map["service_discovery_namespace_id"] : null
  legacy_service_discovery_name          = var.ecs_module_output_map != null ? var.ecs_module_output_map["service_discovery_name"] : null*/
  /*legacy_alb_listener_arn           = var.ecs_module_alb_output_map.listener_arn
  legacy_alb_dns_name               = var.ecs_module_alb_output_map.dns_name
  legacy_alb_dns_zone_id            = var.ecs_module_alb_output_map.dns_zone_id
  legacy_alb_allowed_security_group = var.ecs_module_alb_output_map.allowed_security_group_id
  legacy_alb_enabled                = local.legacy_alb_listener_arn != null*/



  # compatibile with new context, if value not provided, tries to use leagacy one (new is over legacy in hierarchy)
  /*  new_name       = var.context-ecs.name != null ? var.context-ecs.name : local.legacy_name
  new_stage      = var.context-ecs.stage != null ? var.context-ecs.stage : local.legacy_stage
  new_namespace  = var.context-ecs.namespace != null ? var.context-ecs.namespace : local.legacy_namespace
  new_tags       = merge(var.context-ecs.tags, var.tags, local.legacy_tags)
  new_delimiter  = var.context-ecs.delimiter != null ? var.context-ecs.delimiter : local.legacy_delimiter
  new_region     = var.context-ecs.region != null ? var.context-ecs.region : local.legacy_region
  new_vpc_id     = var.context-ecs.vpc_id != null ? var.context-ecs.vpc_id : local.legacy_vpc_id
  new_service_internal_security_group = var.context-ecs.service_internal_security_group != null ? var.context-ecs.service_internal_security_group : local.legacy_service_internal_security_group
  new_launch_type                    = var.context-ecs.launch_type != null ? var.context-ecs.launch_type : local.legacy_launch_type
  new_ecs_cluster_arn                = var.context-ecs.ecs_cluster_arn != null ? var.context-ecs.ecs_cluster_arn : local.legacy_ecs_cluster_arn
  new_aws_logs_region                = var.context-ecs.aws_logs_region != null ? var.context-ecs.aws_logs_region : local.legacy_aws_logs_region
  new_aws_cloudwatch_log_group_name  = var.context-ecs.aws_cloudwatch_log_group_name != null ? var.context-ecs.aws_cloudwatch_log_group_name : local.legacy_aws_cloudwatch_log_group_name
  new_deploy_iam_access_key          = var.context-ecs.deploy_iam_access_key != null ? var.context-ecs.deploy_iam_access_key : local.legacy_deploy_iam_access_key
  new_deploy_iam_secret_key          = var.context-ecs.deploy_iam_secret_key != null ? var.context-ecs.deploy_iam_secret_key : local.legacy_deploy_iam_secret_key
  new_domain_name                    = var.context-ecs.domain_name != null ? var.context-ecs.domain_name : local.legacy_domain_name
  new_domain_zone_id                 = var.context-ecs.domain_zone_id != null ? var.context-ecs.domain_zone_id : local.legacy_domain_zone_id
  new_alb_acm_certificate_arn        = var.context-ecs.alb_acm_certificate_arn != null ? var.context-ecs.alb_acm_certificate_arn : local.legacy_alb_acm_certificate_arn
  new_kms_key_alias_arn              = var.context-ecs.kms_key_alias_arn != null ? var.context-ecs.kms_key_alias_arn : local.legacy_kms_key_alias_arn
  new_kms_key_alias_name             = var.context-ecs.kms_key_alias_name != null ? var.context-ecs.kms_key_alias_name : local.legacy_kms_key_alias_name
  new_kms_key_arn                    = var.context-ecs.kms_key_arn != null ? var.context-ecs.kms_key_arn : local.legacy_kms_key_arn
  new_kms_key_id                     = var.context-ecs.kms_key_id != null ? var.context-ecs.kms_key_id : local.legacy_kms_key_id
  new_kms_key_access_policy_arn      = var.context-ecs.kms_key_access_policy_arn != null ? var.context-ecs.kms_key_access_policy_arn : local.legacy_kms_key_access_policy_arn
  new_service_discovery_namespace_id = var.context-ecs.service_discovery_namespace_id != null ? var.context-ecs.service_discovery_namespace_id : local.legacy_service_discovery_namespace_id
  new_service_discovery_name         = var.context-ecs.service_discovery_name != null ? var.context-ecs.service_discovery_name : local.legacy_service_discovery_name*/


  temp_alb_external_enabled = var.alb_external_enabled == null ? var.context-ecs.alb_external_enabled : var.alb_external_enabled
  temp_alb_internal_enabled = var.alb_internal_enabled == null ? var.context-ecs.alb_internal_enabled : var.alb_internal_enabled
  alb_external_enabled      = local.temp_alb_external_enabled == null ? false : local.temp_alb_external_enabled
  alb_internal_enabled      = local.temp_alb_internal_enabled == null ? false : local.temp_alb_internal_enabled
  temp_depends_on_modules   = var.depends_on_modules == null ? var.context-ecs.depends_on_modules : var.depends_on_modules

  input = {
    name                                = var.name != null ? var.name : var.context-ecs.name
    stage                               = var.stage != null ? var.stage : var.context-ecs.stage
    namespace                           = var.namespace != null ? var.namespace : var.context-ecs.namespace
    attributes                          = distinct(concat(var.context-ecs.attributes, var.attributes))
    tags                                = merge(var.context-ecs.tags, var.tags, module.this.tags)
    delimiter                           = var.delimiter != null ? var.delimiter : var.context-ecs.delimiter
    region                              = var.region != null ? var.region : var.context-ecs.region
    vpc_id                              = var.vpc_id != null ? var.vpc_id : var.context-ecs.vpc_id
    enabled                             = module.this.enabled
    environment                         = module.this.environment
    additional_tag_map                  = module.this.additional_tag_map
    regex_replace_chars                 = module.this.regex_replace_chars
    label_order                         = module.this.label_order
    id_length_limit                     = module.this.id_length_limit
    service_internal_security_group     = var.service_internal_security_group != null ? var.service_internal_security_group : var.context-ecs.service_internal_security_group
    private_subnets = var.private_subnets != null ? var.private_subnets : var.context-ecs.private_subnets
    alb_external_enabled                = var.alb_external_enabled == null ? var.context-ecs.alb_external_enabled : var.alb_external_enabled
    alb_external_listener_arn           = local.alb_external_enabled ? (var.alb_external_listener_arn != null ? var.alb_external_listener_arn : var.context-ecs.alb_external_listener_arn) : null
    alb_external_dns_name               = local.alb_external_enabled ? (var.alb_external_dns_name != null ? var.alb_external_dns_name : var.context-ecs.alb_external_dns_name) : null
    alb_external_dns_zone_id            = local.alb_external_enabled ? (var.alb_external_dns_zone_id != null ? var.alb_external_dns_zone_id : var.context-ecs.alb_external_dns_zone_id) : null
    alb_external_allowed_security_group = local.alb_external_enabled ? (var.alb_external_allowed_security_group != null ? var.alb_external_allowed_security_group : var.context-ecs.alb_external_allowed_security_group) : null
    alb_internal_enabled                = var.alb_internal_enabled == null ? var.context-ecs.alb_internal_enabled : var.alb_internal_enabled
    alb_internal_listener_arn           = local.alb_internal_enabled ? (var.alb_internal_listener_arn != null ? var.alb_internal_listener_arn : var.context-ecs.alb_internal_listener_arn) : null
    alb_internal_dns_name               = local.alb_internal_enabled ? (var.alb_internal_dns_name != null ? var.alb_internal_dns_name : var.context-ecs.alb_internal_dns_name) : null
    alb_internal_dns_zone_id            = local.alb_internal_enabled ? (var.alb_internal_dns_zone_id != null ? var.alb_internal_dns_zone_id : var.context-ecs.alb_internal_dns_zone_id) : null
    alb_internal_allowed_security_group = local.alb_internal_enabled ? (var.alb_internal_allowed_security_group != null ? var.alb_internal_allowed_security_group : var.context-ecs.alb_internal_allowed_security_group) : null
    launch_type                         = var.launch_type == null ? var.context-ecs.launch_type : var.launch_type
    ecs_cluster_arn                     = var.ecs_cluster_arn == null ? var.context-ecs.ecs_cluster_arn : var.ecs_cluster_arn
    aws_logs_region                     = var.aws_logs_region == null ? var.context-ecs.aws_logs_region : var.aws_logs_region
    aws_cloudwatch_log_group_name       = var.aws_cloudwatch_log_group_name == null ? var.context-ecs.aws_cloudwatch_log_group_name : var.aws_cloudwatch_log_group_name
    deploy_iam_access_key               = var.deploy_iam_access_key == null ? var.context-ecs.deploy_iam_access_key : var.deploy_iam_access_key
    deploy_iam_secret_key               = var.deploy_iam_secret_key == null ? var.context-ecs.deploy_iam_secret_key : var.deploy_iam_secret_key
    domain_name                         = var.domain_name == null ? var.context-ecs.domain_name : var.domain_name
    domain_zone_id                      = var.domain_zone_id == null ? var.context-ecs.domain_zone_id : var.domain_zone_id
    alb_acm_certificate_arn             = var.alb_acm_certificate_arn == null ? var.context-ecs.alb_acm_certificate_arn : var.alb_acm_certificate_arn
    kms_key_alias_arn                   = var.kms_key_alias_arn == null ? var.context-ecs.kms_key_alias_arn : var.kms_key_alias_arn
    kms_key_alias_name                  = var.kms_key_alias_name == null ? var.context-ecs.kms_key_alias_name : var.kms_key_alias_name
    kms_key_arn                         = var.kms_key_arn == null ? var.context-ecs.kms_key_arn : var.kms_key_arn
    kms_key_id                          = var.kms_key_id == null ? var.context-ecs.kms_key_id : var.kms_key_id
    kms_key_access_policy_arn           = var.kms_key_access_policy_arn == null ? var.context-ecs.kms_key_access_policy_arn : var.kms_key_access_policy_arn
    service_discovery_namespace_id      = var.service_discovery_namespace_id == null ? var.context-ecs.service_discovery_namespace_id : var.service_discovery_namespace_id
    service_discovery_name              = var.service_discovery_name == null ? var.context-ecs.service_discovery_name : var.service_discovery_name
    depends_on_modules                  = var.additional_depends_on_modules == null ? local.temp_depends_on_modules : concat(local.temp_depends_on_modules, var.additional_depends_on_modules)
  }

  enabled             = local.input.enabled == null ? true : local.input.enabled
  namespace           = local.input.namespace == null ? "" : local.input.namespace
  stage               = local.input.stage == null ? "" : local.input.stage
  tags                = local.input.tags
  environment         = local.input.environment == null ? "" : local.input.environment
  name                = local.input.name == null ? "" : local.input.name
  delimiter           = local.input.delimiter == null ? "" : local.input.delimiter
  attributes          = local.input.attributes
  additional_tag_map  = local.input.additional_tag_map
  regex_replace_chars = local.input.regex_replace_chars == null ? "" : local.input.regex_replace_chars
  label_order         = local.input.label_order
  id_length_limit     = local.input.id_length_limit
  private_subnets = local.input.private_subnets == null ? [] : local.input.private_subnets


  alb_external_listener_arn           = local.input.alb_external_listener_arn == null ? "" : local.input.alb_external_listener_arn
  alb_external_dns_name               = local.input.alb_external_dns_name == null ? "" : local.input.alb_external_dns_name
  alb_external_dns_zone_id            = local.input.alb_external_dns_zone_id == null ? "" : local.input.alb_external_dns_zone_id
  alb_external_allowed_security_group = local.input.alb_external_allowed_security_group == null ? "" : local.input.alb_external_allowed_security_group
  alb_internal_listener_arn           = local.input.alb_internal_listener_arn == null ? "" : local.input.alb_internal_listener_arn
  alb_internal_dns_name               = local.input.alb_internal_dns_name == null ? "" : local.input.alb_internal_dns_name
  alb_internal_dns_zone_id            = local.input.alb_internal_dns_zone_id == null ? "" : local.input.alb_internal_dns_zone_id
  alb_internal_allowed_security_group = local.input.alb_internal_allowed_security_group == null ? "" : local.input.alb_internal_allowed_security_group

  region                          = local.input.region == null ? "" : local.input.region
  vpc_id                          = local.input.vpc_id == null ? "" : local.input.vpc_id
  service_internal_security_group = local.input.service_internal_security_group == null ? "" : local.input.service_internal_security_group
  launch_type                     = local.input.launch_type == null ? "" : local.input.launch_type
  ecs_cluster_arn                 = local.input.ecs_cluster_arn == null ? "" : local.input.ecs_cluster_arn
  aws_logs_region                 = local.input.aws_logs_region == null ? "" : local.input.aws_logs_region
  aws_cloudwatch_log_group_name   = local.input.aws_cloudwatch_log_group_name == null ? "" : local.input.aws_cloudwatch_log_group_name
  deploy_iam_access_key           = local.input.deploy_iam_access_key == null ? "" : local.input.deploy_iam_access_key
  deploy_iam_secret_key           = local.input.deploy_iam_secret_key == null ? "" : local.input.deploy_iam_secret_key
  domain_name                     = local.input.domain_name == null ? "" : local.input.domain_name
  domain_zone_id                  = local.input.domain_zone_id == null ? "" : local.input.domain_zone_id
  alb_acm_certificate_arn         = local.input.alb_acm_certificate_arn == null ? "" : local.input.alb_acm_certificate_arn
  kms_key_alias_arn               = local.input.kms_key_alias_arn == null ? "" : local.input.kms_key_alias_arn
  kms_key_alias_name              = local.input.kms_key_alias_name == null ? "" : local.input.kms_key_alias_name
  kms_key_arn                     = local.input.kms_key_arn == null ? "" : local.input.kms_key_arn
  kms_key_id                      = local.input.kms_key_id == null ? "" : local.input.kms_key_id
  kms_key_access_policy_arn       = local.input.kms_key_access_policy_arn == null ? "" : local.input.kms_key_access_policy_arn
  service_discovery_namespace_id  = local.input.service_discovery_namespace_id == null ? "" : local.input.service_discovery_namespace_id
  service_discovery_name          = local.input.service_discovery_name == null ? "" : local.input.service_discovery_name
  depends_on_modules              = local.input.depends_on_modules

  # Normalization (for future use)
  output_context = {
    enabled             = local.enabled
    namespace           = local.namespace
    stage               = local.stage
    tags                = local.tags
    environment         = local.environment
    name                = local.name
    delimiter           = local.delimiter
    attributes          = local.attributes
    additional_tag_map  = local.additional_tag_map
    regex_replace_chars = local.regex_replace_chars
    label_order         = local.label_order
    id_length_limit     = local.id_length_limit
    private_subnets = local.private_subnets

    alb_external_enabled                = local.alb_external_enabled
    alb_external_listener_arn           = local.alb_external_listener_arn
    alb_external_dns_name               = local.alb_external_dns_name
    alb_external_dns_zone_id            = local.alb_external_dns_zone_id
    alb_external_allowed_security_group = local.alb_external_allowed_security_group
    alb_internal_enabled                = local.alb_internal_enabled
    alb_internal_listener_arn           = local.alb_internal_listener_arn
    alb_internal_dns_name               = local.alb_internal_dns_name
    alb_internal_dns_zone_id            = local.alb_internal_dns_zone_id
    alb_internal_allowed_security_group = local.alb_internal_allowed_security_group

    region                          = local.region
    vpc_id                          = local.vpc_id
    service_internal_security_group = local.service_internal_security_group
    launch_type                     = local.launch_type
    ecs_cluster_arn                 = local.ecs_cluster_arn
    aws_logs_region                 = local.aws_logs_region
    aws_cloudwatch_log_group_name   = local.aws_cloudwatch_log_group_name
    deploy_iam_access_key           = local.deploy_iam_access_key
    deploy_iam_secret_key           = local.deploy_iam_secret_key
    domain_name                     = local.domain_name
    domain_zone_id                  = local.domain_zone_id
    alb_acm_certificate_arn         = local.alb_acm_certificate_arn
    kms_key_alias_arn               = local.kms_key_alias_arn
    kms_key_alias_name              = local.kms_key_alias_name
    kms_key_arn                     = local.kms_key_arn
    kms_key_id                      = local.kms_key_id
    kms_key_access_policy_arn       = local.kms_key_access_policy_arn
    service_discovery_namespace_id  = local.service_discovery_namespace_id
    service_discovery_name          = local.service_discovery_name
    depends_on_modules              = local.depends_on_modules
  }

  # used in ecs-service - to provide backward compability
  external_alb_output_map = {
    listener_arn              = local.alb_external_listener_arn
    dns_name                  = local.alb_external_dns_name
    dns_zone_id               = local.alb_external_dns_zone_id
    allowed_security_group_id = local.alb_external_allowed_security_group
  }

  internal_alb_output_map = {
    listener_arn              = local.alb_internal_listener_arn
    dns_name                  = local.alb_internal_dns_name
    dns_zone_id               = local.alb_internal_dns_zone_id
    allowed_security_group_id = local.alb_internal_allowed_security_group
  }

  ecs_output_map = {
    name                            = local.output_context.name
    stage                           = local.output_context.stage
    namespace                       = local.output_context.namespace
    attributes                      = local.output_context.attributes
    tags                            = local.output_context.tags
    delimiter                       = local.output_context.delimiter
    region                          = local.output_context.region
    vpc_id                          = local.output_context.vpc_id
    service_internal_security_group = local.output_context.service_internal_security_group
    ecs_cluster_arn                 = local.output_context.ecs_cluster_arn
    launch_type                     = local.output_context.launch_type
    aws_logs_region                 = local.output_context.aws_logs_region
    aws_cloudwatch_log_group_name   = local.output_context.aws_cloudwatch_log_group_name
    deploy_iam_access_key           = local.output_context.deploy_iam_access_key
    deploy_iam_secret_key           = local.output_context.deploy_iam_secret_key
    domain_name                     = local.output_context.domain_name
    domain_zone_id                  = local.output_context.domain_zone_id
    alb_acm_certificate_arn         = local.output_context.alb_acm_certificate_arn
    kms_key_alias_arn               = local.output_context.kms_key_alias_arn
    kms_key_alias_name              = local.output_context.kms_key_alias_name
    kms_key_arn                     = local.output_context.kms_key_arn
    kms_key_id                      = local.output_context.kms_key_id
    kms_key_access_policy_arn       = local.output_context.kms_key_access_policy_arn
    service_discovery_namespace_id  = local.output_context.service_discovery_namespace_id
    service_discovery_name          = local.output_context.service_discovery_name
  }

}