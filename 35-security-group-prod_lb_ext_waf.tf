############################################################################
# Network Security Groups - prod_lb_ext_waf:
############################################################################

module "security_group_prod_lb_ext_waf" {
    source                         = "./modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "prod_lb_ext_waf"
    defined_tags                   = local.tags_common
}
 
output "security_group_prod_lb_ext_waf_id" {
    value                         = module.security_group_prod_lb_ext_waf.group_id
}
 
############################################################################
/*
resource "oci_core_network_security_group_security_rule" "prod_lb_ext_waf_ingress_https_oci_waf" {
    for_each                  = local.oci_waf
    network_security_group_id = module.security_group_prod_lb_ext_waf.group_id
    direction                 = "INGRESS"
    protocol                  = "6"
    description               = each.key
    source                    = each.value
    source_type               = "CIDR_BLOCK"
    stateless                 = false
    tcp_options {
        destination_port_range {
            min = "443"
            max = "443"
        }
    }
} 
*/
############################################################################