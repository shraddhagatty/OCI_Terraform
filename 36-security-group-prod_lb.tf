############################################################################
# Network Security Groups - prod_lb:
############################################################################
module "security_group_prod_lb" {
    source                         = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "prod_lb"
    defined_tags                   = local.tags_common
}
 
output "security_group_prod_lb_id" {
    value                         = module.security_group_prod_lb.group_id
}
 
/* 
# ingress tcp :
module "prod_lb_ingress_tcp_2" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb.group_id
    net_sec_rule_desc    = "Frontend"
    net_sec_rule_source = var.ip_barts_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "443"
    net_sec_rule_tcp_max = "443"
} */
 
module "prod_lb_ingress_tcp_d" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb.group_id
    net_sec_rule_desc    = "http disco"
    net_sec_rule_source = "0.0.0.0/0"
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "80"
    net_sec_rule_tcp_max = "80"
}

module "prod_lb_ingress_tcp_3" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb.group_id
    net_sec_rule_desc    = "Frontend test access"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "443"
    net_sec_rule_tcp_max = "443"
}

module "prod_lb_egress_all" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_dest = module.security_group_prod_app.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_all            = true
}

############################################################################
# Discovery Backend Rules:
/*
# prod_lb_egress_disco_http1:
module "prod_lb_egress_disco_http1" {
    source                 = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id       = module.security_group_prod_lb.group_id
    net_sec_rule_desc      = "prod_lb_egress_disco_http1"
    net_sec_rule_dest      = module.security_group_disco.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_tcp      = true
    net_sec_rule_tcp_min   = "9001"
    net_sec_rule_tcp_max   = "9001"
}

# prod_lb_egress_disco_all:
module "prod_lb_egress_disco_all" {
    source                 = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id       = module.security_group_prod_lb.group_id
    net_sec_rule_desc      = "prod_lb_egress_disco_all"
    net_sec_rule_dest      = module.security_group_disco.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_all      = true
}

# prod_lb_ingress_disco_http1 :
module "prod_lb_ingress_disco_http1" {
    source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id         = module.security_group_prod_lb.group_id
    net_sec_rule_desc        = "prod_lb_ingress_disco_http1"
    net_sec_rule_source      = module.security_group_disco.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "9001"
    net_sec_rule_tcp_max     = "9001"
}


############################################################################
# ingress tcp : for Homerton VPN 
module "prod_lb_ingress_tcp_4" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb.group_id
    net_sec_rule_desc    = "Homerton"
    net_sec_rule_source = var.ip_barts_homerton
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "443"
    net_sec_rule_tcp_max = "443"
}

*/