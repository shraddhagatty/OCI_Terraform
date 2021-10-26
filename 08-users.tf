############################################################################
# Users:
############################################################################
# Object Storage User:
/*
module "user_objstorage" {
  source            = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/identity_user"
  #providers         = oci.home
  tenancy_ocid      = var.tenancy_ocid
  user_ocid         = var.user_ocid
  fingerprint       = var.fingerprint
  private_key_path  = var.private_key_path
  user_desc         = "Object Storage User"
  user_name         = "ObjectStorage"
  group_id          = module.group_objstorage.group_id
  # create_auth_token = true
  defined_tags      = local.tags_common
  can_use_api_keys  = true
}

############################################################################
*/