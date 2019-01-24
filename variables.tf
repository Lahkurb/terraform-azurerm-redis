## GLOBAL INPUTS ##

variable "location" {
  description = "Azure region in which instance will be hosted"
}

variable "location_short" {
  description = "Azure region trigram"
}

variable "environment" {
  description = "Name of application's environnement"
}

variable "stack" {
  description = "Name of application stack"
}

variable "server_name" {
  description = "Custom name of redis server"
  default     = ""
}

variable "client_name" {
  description = "Name of client"
}

variable "resource_group_name" {
  description = "Name of the application ressource group, herited from infra module"
}

variable "datadog_integration" {
  description = "Enable datadog tags --> true/false"
  default     = false
}

variable "extra_tags" {
  type        = "map"
  default     = {}
  description = "Map of extra tags"
}

## REDIS PARAMETERS ##

variable "redis_name" {
  description = "Redis instance name"
  default     = "test"
}

variable "redis_capacity" {
  default     = 2
  description = "Redis size: (Basic/Standard: 1,2,3,4,5,6) (Premium: 1,2,3,4)  https://docs.microsoft.com/fr-fr/azure/redis-cache/cache-how-to-premium-clustering"
}

variable "redis_family" {
  default     = "C"
  description = "Sku family C=Basic/Standard, P=Premium "
}

variable "redis_sku_name" {
  default     = "Standard"
  description = "Sku name: Basic, Standard, Premium"
}

variable "redis_shard_count" {
  default     = "3"
  description = "Number of shard wanted in case of cluster setup"
}

variable "redis_configuration" {
  type        = "map"
  description = "Set of redis configuration, accepted parameters: maxmemory_reserved (default: 10), maxmemory_delta (default: 2), maxmemory_policy (default: allkeys-lru), backup_frequency, snapshot_count"

  default = {
    maxmemory_reserved = 10
    maxmemory_delta    = 2
    maxmemory_policy   = "allkeys-lru"
  }
}

variable "redis_fw_authorized_cidrs" {
  type        = "list"
  description = "List of authorized cidrs, must be provided using remote states cloudpublic/cloudpublic/global/vars/terraform.state --> authorized_cidrs"
}

variable "storage_account_tier" {
  default     = "Standard"
  description = "Storage account for backup policy"
}

variable "storage_account_replication_type" {
  default     = "GRS"
  description = "Type of storage replication : LRS,GRS,RAGRS,ZRS https://docs.microsoft.com/fr-fr/azure/storage/common/storage-redundancy"
}

## OPTIONAL REDIS PARAMETERS ##

variable "redis_cluster_enabled" {
  description = "Enable cluster feature --> 0 (disabled) 1 (enabled)"
  default     = 0
}

variable "redis_backup_enabled" {
  description = "Enable backup feature --> 0 (disabled) 1 (enabled)"
  default     = 0
}

variable "redis_enable_ssl" {
  default     = "false"
  description = "Activate Ssl port (6789) of Redis instance"
}