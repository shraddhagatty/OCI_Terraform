############################################################################
# User Groups:
############################################################################
# common services admins group:

module "group_common_services_admins" {
  source           = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/identity_group"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  group_name       = "common_services_admins"
  group_desc       = "User group with common services admin access policies."
  policy_name      = "common_services_admin_access_policy"
  policy_desc      = "Policy to provide access to common services."
  policy_statements = [
    "Allow group common_services_admins to use virtual-network-family in compartment common_services",
    "Allow group common_services_admins to read app-catalog-listing in tenancy",
  ]
  defined_tags     = local.tags_common
}

############################################################################
# Prod Services admins Group:

module "group_prod_services_admins" {
  source           = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/identity_group"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  group_name       = "production_services_admins"
  group_desc       = "User group with prod services admin access policies."
  policy_name      = "prod_services_admin_access_policy"
  policy_desc      = "Policy to provide admin access to prod services."
  policy_statements = [
    "Allow group production_services_admins to use virtual-network-family in compartment common_services",
    "Allow group production_services_admins to read app-catalog-listing in tenancy",
    "Allow group production_services_admins to use volume-family in compartment prod_services",
    "Allow group production_services_admins to manage instance-family in compartment prod_services",
  ]
  defined_tags     = local.tags_common
}

############################################################################
# Non Prod Services admins Group:

module "group_nonprod_services_admins" {
  source           = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/identity_group"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  group_name       = "nonproduction_services_admins"
  group_desc       = "User group with non prod services admin access policies."
  policy_name      = "nonprod_services_admin_access_policy"
  policy_desc      = "Policy to provide admin access to non prod services."
  policy_statements = [
    "Allow group nonproduction_services_admins to use virtual-network-family in compartment common_services",
    "Allow group nonproduction_services_admins to read app-catalog-listing in tenancy",
    "Allow group nonproduction_services_admins to use volume-family in compartment nonprod_services",
    "Allow group nonproduction_services_admins to manage instance-family in compartment nonprod_services",
  ]
  defined_tags     = local.tags_common
}

############################################################################
# common services read only group:

module "group_common_services_read_only" {
  source           = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/identity_group"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  group_name       = "common_services_read_only"
  group_desc       = "User group with common services read_only access policies."
  policy_name      = "common_services_read_only_access_policy"
  policy_desc      = "Policy to provide read only access to common services."
  policy_statements = [
    "Allow group common_services_read_only to read virtual-network-family in compartment common_services",
    "Allow group common_services_read_only to read app-catalog-listing in tenancy",
  ]
  defined_tags     = local.tags_common
}

############################################################################
# Prod Services read only Group:

module "group_prod_services_read_only" {
  source           = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/identity_group"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  group_name       = "production_services_read_only"
  group_desc       = "User group with prod services read_only access policies."
  policy_name      = "prod_services_read_only_access_policy"
  policy_desc      = "Policy to provide read only access to prod services."
  policy_statements = [
    "Allow group production_services_read_only to read virtual-network-family in compartment common_services",
    "Allow group production_services_read_only to read app-catalog-listing in tenancy",
    "Allow group production_services_read_only to read volume-family in compartment prod_services",
    "Allow group production_services_read_only to read instance-family in compartment prod_services",
  ]
  defined_tags     = local.tags_common
}

############################################################################
# Non-Prod Services read only Group:

module "group_nonprod_services_read_only" {
  source           = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/identity_group"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  group_name       = "nonproduction_services_read_only"
  group_desc       = "User group with non prod services read_only access policies."
  policy_name      = "nonprod_services_read_only_access_policy"
  policy_desc      = "Policy to provide read only access to non prod services."
  policy_statements = [
    "Allow group nonproduction_services_read_only to read virtual-network-family in compartment common_services",
    "Allow group nonproduction_services_read_only to read app-catalog-listing in tenancy",
    "Allow group nonproduction_services_read_only to read volume-family in compartment nonprod_services",
    "Allow group nonproduction_services_read_only to read instance-family in compartment nonprod_services",
  ]
  defined_tags     = local.tags_common
}

############################################################################
# Object Storage Root Policy & User Group:

resource "oci_identity_policy" "objectstorage_service_policy" {
  provider       = oci.home
  name           = "objectstorage_service_policy"
  description    = "Policy for regional Object Storage service to implement lifecycle policies."
  compartment_id = var.tenancy_ocid
  statements = [
    "Allow service objectstorage-${var.region} to manage object-family in tenancy",
  ]
}

module "group_objstorage" {
  source           = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/identity_group"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  group_name       = "object_storage_admins"
  group_desc       = "User group with object storage access policies."
  policy_name      = "object_storage_access_policy"
  policy_desc      = "Policy to provide access to object storage buckets."
  policy_statements = [
    "Allow group object_storage_admins to read buckets in tenancy",
    "Allow group object_storage_admins to manage objects in tenancy",
    "Allow service objectstorage-uk-london-1 to manage object-family in tenancy"
  ]
  defined_tags     = local.tags_common
}

############################################################################
# Scheduler Policy & Dynamic Group:

resource "oci_identity_dynamic_group" "scheduler_dynamic_group" {
    compartment_id = var.tenancy_ocid
    description = "the group which allow the docker container, which runs the scheduler, to have access to the instances to turn on and off"
    matching_rule = "ANY {instance.compartment.id = '${module.compartment-nonprod-services.compartment_id}'}"
    name = "scheduler_dynamic_group"
}

resource "oci_identity_policy" "scheduler_dynamic_group_policy" {
    compartment_id = var.tenancy_ocid
    description = "to allow the docker container which runs the scheduler to have access to the instances to turn on and off"
    name = "scheduler_dynamic_group_policy"
    statements = [
        "Allow dynamic-group scheduler_dynamic_group to manage functions-family in compartment nonprod_services",
        "Allow dynamic-group scheduler_dynamic_group to use virtual-network-family in compartment nonprod_services",
        "Allow dynamic-group scheduler_dynamic_group to use instance-family in compartment nonprod_services",
        "Allow dynamic-group scheduler_dynamic_group to read repos in tenancy",
        "Allow service FAAS to use virtual-network-family in tenancy",
        "Allow service FAAS to use instance-family in tenancy",
        "Allow service FAAS to read repos in tenancy",
      ]
}

############################################################################
