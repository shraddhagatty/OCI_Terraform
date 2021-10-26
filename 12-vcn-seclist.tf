############################################################################
# Empty Default Sec List:

resource "oci_core_security_list" "security_list_default_empty" {
    compartment_id = module.compartment-common-services.compartment_id
    vcn_id         = module.vcn.vcn_id
    display_name   = "${var.customer_label}-sl-default-empty"
    defined_tags   = local.tags_common
    lifecycle {
        ignore_changes = [
            defined_tags["Account.Created_By"],
            defined_tags["Account.Created_At"]
        ]
    }
}