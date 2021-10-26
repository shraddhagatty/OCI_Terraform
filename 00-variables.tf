############################################################################
# Variables:
############################################################################
# Tenancy:

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

##Label used as a prefix for naming resources
variable customer_label{
    default = ""
}


#Tags Name
variable "StackName" {
    default = ""
}
variable "StackOwner" {
    default = ""
}
variable "ProjectName" {
    default = ""
}
variable "BillingOwner" {
    default = ""
}
variable "CostCenter" {
    default = ""
}
variable "Workload" {
    default = ""
}

variable "shapes" {
  type = map(string)
  default = {
    "E2_1Micro"= "VM.Standard.E2.1.Micro"
    "E2_1"  = "VM.Standard.E2.1"
    "E2_2"  = "VM.Standard.E2.2"
    "E2_4"  = "VM.Standard.E2.4"
    "E2_8"  = "VM.Standard.E2.8"
  }
}