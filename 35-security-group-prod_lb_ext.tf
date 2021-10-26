############################################################################
# Network Security Groups - prod_lb_ext:
############################################################################
module "security_group_prod_lb_ext" {
    source                         = "./modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "prod_lb_ext"
    defined_tags                   = local.tags_common
}
 
output "security_group_prod_lb_ext_id" {
    value                         = module.security_group_prod_lb_ext.group_id
}
 
/*
resource "oci_core_network_security_group_security_rule" "prod_lb_ext_ingress_tcp_sftp" {
    for_each = var.external_sftp_parties

    network_security_group_id = module.security_group_prod_lb_ext.group_id
    direction = "INGRESS"
    protocol = "6"
    description = each.key

    source = each.value
    source_type = "CIDR_BLOCK"
    stateless = false
    tcp_options {
        destination_port_range {
            max = "22"
            min = "22"
        }
}
}
*/
# ingress tcp :
# module "prod_lb_ext_ingress_tcp_2" {
#     source                = "./modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_lb_ext.group_id
#     net_sec_rule_desc    = ""
#     net_sec_rule_source = "0.0.0.0/0"
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "443"
#     net_sec_rule_tcp_max = "443"
# }

/*
module "prod_lb_ext_ingress_tcp_BACS_4443" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb_ext.group_id
    net_sec_rule_desc    = "BACS access for banks"
    net_sec_rule_source  = var.ip_v1_josh_test
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "4443"
    net_sec_rule_tcp_max = "4443"
}
*/

module "prod_lb_ext_egress_all" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb_ext.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_dest = module.security_group_prod_app_ext.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_all            = true
}

module "prod_lb_ext_egress_all_int" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb_ext.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_dest = module.security_group_prod_app.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_all            = true
}

module "prod_lb_ext_egress_prod_db" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb_ext.group_id
    net_sec_rule_desc    = "prod_lb_ext_egress_prod_db"
    net_sec_rule_dest = module.security_group_prod_db.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_all            = true
}
/*
resource "oci_core_network_security_group_security_rule" "prod_lb_ext_ingress_db_qlik" {
    for_each                  = var.qlik
    network_security_group_id = module.security_group_prod_lb_ext.group_id
    direction                 = "INGRESS"
    protocol                  = "6"
    description               = each.key
    source                    = each.value
    source_type               = "CIDR_BLOCK"
    stateless                 = false
    tcp_options {
        destination_port_range {
            min = "1523"
            max = "1523"
        }
    }
}
*/
# resource "oci_core_network_security_group_security_rule" "prod_lb_ext_ingress_https_v1_users" {
#     for_each                  = var.v1_users
#     network_security_group_id = module.security_group_prod_lb_ext.group_id
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