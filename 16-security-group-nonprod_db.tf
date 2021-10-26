############################################################################
# Network Security Groups - nonprod_db:
############################################################################

module "security_group_nonprod_db" {
    source                         = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "nonprod_db"
    defined_tags                   = local.tags_common
}
 
output "security_group_nonprod_db_id" {
    value                         = module.security_group_nonprod_db.group_id
}

############################################################################
# INGRESS: 
 
# ingress tcp :
module "nonprod_db_ingress_tcp" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_db.group_id
    net_sec_rule_desc    = "nonprod_db_ingress_tcp"
    net_sec_rule_source = module.security_group_nonprod_app.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "1521"
    net_sec_rule_tcp_max = "1525"
}
 
/* 
# ingress tcp :
module "nonprod_db_ingress_tcp_2" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_db.group_id
    net_sec_rule_desc    = "nonprod_db_ingress_tcp_2"
    net_sec_rule_source = module.security_group_ocr.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "1521"
    net_sec_rule_tcp_max = "1525"
}
 
 
# ingress tcp :
module "nonprod_db_ingress_tcp_3" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_db.group_id
    net_sec_rule_desc    = "nonprod_db_ingress_tcp_3"
    net_sec_rule_source = module.security_group_qlik.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "1521"
    net_sec_rule_tcp_max = "1525"
}


# nonprod_db_ingress_tcp_ssh_imerja:
module "nonprod_db_ingress_tcp_ssh_imerja" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_db.group_id
    net_sec_rule_desc    = "nonprod_db_ingress_tcp_ssh_imerja"
    net_sec_rule_source = var.ip_imerja_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "22"
    net_sec_rule_tcp_max = "22"
}
 
 
# nonprod_db_ingress_tcp_sql_imerja:
module "nonprod_db_ingress_tcp_sql_imerja" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_db.group_id
    net_sec_rule_desc    = "nonprod_db_ingress_tcp_sql_imerja"
    net_sec_rule_source = var.ip_imerja_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "1521"
    net_sec_rule_tcp_max = "1525"
}

# nonprod_db_ingress_tcp_sql_barts:
module "nonprod_db_ingress_tcp_sql_barts" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_db.group_id
    net_sec_rule_desc    = "nonprod_db_ingress_tcp_sql_barts"
    net_sec_rule_source = var.ip_barts_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "1521"
    net_sec_rule_tcp_max = "1525"
} */

# nonprod_db_ingress_sql_nonprod_db:
module "nonprod_db_ingress_sql_nonprod_db" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_db.group_id
    net_sec_rule_desc    = "nonprod_db_ingress_sql_nonprod_db"
        net_sec_rule_source = module.security_group_nonprod_db.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "1521"
    net_sec_rule_tcp_max = "1526"
}

# nonprod_db_ingress_sql_prod_db:
module "nonprod_db_ingress_sql_prod_db" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_db.group_id
    net_sec_rule_desc    = "nonprod_db_ingress_sql_prod_db"
        net_sec_rule_source = module.security_group_prod_db.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "1521"
    net_sec_rule_tcp_max = "1526"
}

module "nonprod_db_ingress_sql_nprd_app_ext" {
    source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id         = module.security_group_nonprod_db.group_id
    net_sec_rule_desc        = "nonprod_db_ingress_sql_nprd_app_ext"
    net_sec_rule_source      = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "1521"
    net_sec_rule_tcp_max     = "1525"
}

module "nonprod_db_ingress_sql_nprd_lb_ext" {
    source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id         = module.security_group_nonprod_db.group_id
    net_sec_rule_desc        = "nonprod_db_ingress_sql_nprd_lb_ext"
    net_sec_rule_source      = module.security_group_nonprod_lb_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "1521"
    net_sec_rule_tcp_max     = "1525"
}

############################################################################