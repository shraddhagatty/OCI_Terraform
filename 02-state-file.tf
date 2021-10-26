/*############################################################################
# State Files:
############################################################################
# Terraform S3 State:

terraform {
  backend "s3" {
    bucket                      = "v1erp-remote-state"
    key                         = "a.tfstate"
    region                      = "eu-frankfurt-1"
    endpoint                    = "https://v1erp.compat.objectstorage.eu-frankfurt-1.oraclecloud.com"
    profile                     = "v1erp"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}

############################################################################
*/