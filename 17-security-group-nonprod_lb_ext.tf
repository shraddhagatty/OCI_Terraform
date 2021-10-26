############################################################################
# Network Security Groups - nonprod_lb_ext:
############################################################################

module "security_group_nonprod_lb_ext" {
    source                         = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "nonprod_lb_ext"
    defined_tags                   = local.tags_common
}
 
output "security_group_nonprod_lb_ext_id" {
    value                         = module.security_group_nonprod_lb_ext.group_id
}

############################################################################
# INGRESS:
/*
resource "oci_core_network_security_group_security_rule" "nonprod_lb_ext_ingress_https_oci_waf" {
    for_each                  = local.oci_waf
    network_security_group_id = module.security_group_nonprod_lb_ext.group_id
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

# resource "oci_core_network_security_group_security_rule" "nonprod_lb_ext_ingress_http_v1_users" {
#     for_each                  = var.v1_users
#     network_security_group_id = module.security_group_nonprod_lb_ext.group_id
#     direction                 = "INGRESS"
#     protocol                  = "6"
#     description               = each.key
#     source                    = each.value
#     source_type               = "CIDR_BLOCK"
#     stateless                 = false
#     tcp_options {
#         destination_port_range {
#             min = "80"
#             max = "80"
#         }
#     }
# }

# resource "oci_core_network_security_group_security_rule" "nonprod_lb_ext_ingress_https_v1_users" {
#     for_each                  = var.v1_users
#     network_security_group_id = module.security_group_nonprod_lb_ext.group_id
#     direction                 = "INGRESS"
#     protocol                  = "6"
#     description               = each.key
#     source                    = each.value
#     source_type               = "CIDR_BLOCK"
#     stateless                 = false
#     tcp_options {
#         destination_port_range {
#             min = "443"
#             max = "443"
#         }
#     }
# }

# module "nonprod_lb_ext_ingress_db_losty" {
#     source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id         = module.security_group_nonprod_lb_ext.group_id
#     net_sec_rule_desc        = "nonprod_lb_ext_ingress_db_losty"
#     net_sec_rule_source      = "37.228.211.37/32"
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp       = true
#     net_sec_rule_tcp_min     = "1524"
#     net_sec_rule_tcp_max     = "1525"
# }

resource "oci_core_network_security_group_security_rule" "nonprod_lb_ext_ingress_db_qlik" {
    for_each                  = var.qlik
    network_security_group_id = module.security_group_nonprod_lb_ext.group_id
    direction                 = "INGRESS"
    protocol                  = "6"
    description               = each.key
    source                    = each.value
    source_type               = "CIDR_BLOCK"
    stateless                 = false
    tcp_options {
        destination_port_range {
            min = "1524"
            max = "1525"
        }
    }
}

# resource "oci_core_network_security_group_security_rule" "nonprod_lb_ext_ingress_https_barts_users" {
#     for_each                  = var.barts_users
#     network_security_group_id = module.security_group_nonprod_lb_ext.group_id
#     direction                 = "INGRESS"
#     protocol                  = "6"
#     description               = each.key
#     source                    = each.value
#     source_type               = "CIDR_BLOCK"
#     stateless                 = false
#     tcp_options {
#         destination_port_range {
#             min = "443"
#             max = "443"
#         }
#     }
# }

# module "nonprod_lb_ext_ingress_https_nonprod_app" {
#     source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id         = module.security_group_nonprod_lb_ext.group_id
#     net_sec_rule_desc        = "nonprod_lb_ext_ingress_https_nonprod_app"
#     net_sec_rule_source      = module.security_group_nonprod_app.group_id
#     net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
#     create_ingress_tcp       = true
#     net_sec_rule_tcp_min     = "443"
#     net_sec_rule_tcp_max     = "443"
# }

# module "nonprod_lb_ext_ingress_https_nonprod_app_ext" {
#     source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id         = module.security_group_nonprod_lb_ext.group_id
#     net_sec_rule_desc        = "nonprod_lb_ext_ingress_https_nonprod_app_ext"
#     net_sec_rule_source      = module.security_group_nonprod_app_ext.group_id
#     net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
#     create_ingress_tcp       = true
#     net_sec_rule_tcp_min     = "443"
#     net_sec_rule_tcp_max     = "443"
# }

############################################################################
# EGRESS:

# module "nonprod_lb_ext_egress_http_dev_app_ext" {
#     source                 = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id       = module.security_group_nonprod_lb_ext.group_id
#     net_sec_rule_desc      = "nonprod_lb_ext_egress_http_dev_app_ext"
#     net_sec_rule_dest      = module.security_group_nonprod_app_ext.group_id
#     net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
#     create_egress_tcp      = true
#     net_sec_rule_tcp_min   = "8004"
#     net_sec_rule_tcp_max   = "8004"
# }

module "nonprod_lb_ext_egress_all" {
    source                 = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id       = module.security_group_nonprod_lb_ext.group_id
    net_sec_rule_desc      = "nonprod_lb_ext_egress_all"
    net_sec_rule_dest      = "0.0.0.0/0"
    net_sec_rule_dest_type = "CIDR_BLOCK"
    create_egress_all      = true
}

############################################################################
*/