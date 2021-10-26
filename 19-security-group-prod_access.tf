############################################################################
# Network Security Groups - prod_access:
############################################################################
module "security_group_prod_access" {
    source                         = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "prod_access"
    defined_tags                   = local.tags_common
}
 
output "security_group_prod_access_id" {
    value                         = module.security_group_prod_access.group_id
}
 
/*
resource "oci_core_network_security_group_security_rule" "v1_external_access" {
    for_each = var.v1_external_access

    network_security_group_id = module.security_group_prod_access.group_id
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
} */
 
# # ingress tcp ssh_access_v1_dublin:
# module "prod_access_ingress_tcp_ssh_access_v1_dublin" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_dublin"
#     net_sec_rule_source = var.ip_v1_dublin
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_cedar_london:
# module "prod_access_ingress_tcp_ssh_access_v1_cedar_london" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_cedar_london"
#     net_sec_rule_source = var.ip_v1_cedar_london
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_anthony_losty:
# module "prod_access_ingress_tcp_ssh_access_v1_anthony_losty" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_anthony_losty"
#     net_sec_rule_source = var.ip_v1_anthony_losty
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_matthew_macfarlane:
# module "prod_access_ingress_tcp_ssh_access_v1_matthew_macfarlane" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_matthew_macfarlane"
#     net_sec_rule_source = var.ip_v1_matt_macfarlane
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_nikki_wong:
# module "prod_access_ingress_tcp_ssh_access_v1_nikki_wong" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_nikki_wong"
#     net_sec_rule_source = var.ip_v1_nikki_wong
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_cs_jumphost:
# module "prod_access_ingress_tcp_ssh_access_v1_cs_jumphost" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_cs_jumphost"
#     net_sec_rule_source = var.ip_v1_cs_jumphost
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_ca_jumphost:
# module "prod_access_ingress_tcp_ssh_access_v1_ca_jumphost" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_ca_jumphost"
#     net_sec_rule_source = var.ip_v1_ca_jumphost
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_anthony_losty_2:
# module "prod_access_ingress_tcp_ssh_access_v1_anthony_losty_2" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_anthony_losty_2"
#     net_sec_rule_source = var.ip_v1_anthony_losty2
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_john_millington:
# module "prod_access_ingress_tcp_ssh_access_v1_john_millington" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_john_millington"
#     net_sec_rule_source = var.ip_v1_john_millington
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_david_platts:
# module "prod_access_ingress_tcp_ssh_access_v1_david_platts" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_david_platts"
#     net_sec_rule_source = var.ip_v1_david_platts
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_shreekantha_akubal:
# module "prod_access_ingress_tcp_ssh_access_v1_shreekantha_akubal" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_shreekantha_akubal"
#     net_sec_rule_source = var.ip_v1_shreekantha_kakubal
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_sachin_shejwadkar:
# module "prod_access_ingress_tcp_ssh_access_v1_sachin_shejwadkar" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_sachin_shejwadkar"
#     net_sec_rule_source = var.ip_v1_sachin_shejwadkar
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 

# # ingress tcp ssh_access_v1_sachin_shejwadkar2:
# module "prod_access_ingress_tcp_ssh_access_v1_sachin_shejwadka2r" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_sachin_shejwadkar2"
#     net_sec_rule_source = var.ip_v1_sachin_shejwadkar2
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# } 
 
# # ingress tcp ssh_access_v1_meghana_prakash:
# module "prod_access_ingress_tcp_ssh_access_v1_meghana_prakash" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_meghana_prakash"
#     net_sec_rule_source = var.ip_v1_meghana_prakash
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_robert_insley:
# module "prod_access_ingress_tcp_ssh_access_v1_robert_insley" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_robert_insley"
#     net_sec_rule_source = var.ip_v1_robert_insley
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
 
# # ingress tcp ssh_access_v1_paul_higginson:
# module "prod_access_ingress_tcp_ssh_access_v1_paul_higginson" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_paul_higginson"
#     net_sec_rule_source = var.ip_v1_paul_higginson
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }
 
# # ingress tcp ssh_access_v1_vicky chelani:
# module "prod_access_ingress_tcp_ssh_access_v1_vicky_chelani" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_vicky_chelani"
#     net_sec_rule_source = var.ip_v1_vicky_chelani
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }


# # ingress tcp ssh_access_v1_shreekantha_k:
# module "prod_access_ingress_tcp_ssh_access_v1_shreekantha_k" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_shreekantha_k"
#     net_sec_rule_source = var.ip_v1_shreekantha_k
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }

# # ingress tcp ssh_access_v1_raghu_chilukoori:
# module "prod_access_ingress_tcp_ssh_access_v1_raghu_chilukoori" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_access.group_id
#     net_sec_rule_desc    = "ssh_access_v1_raghu_chilukoori"
#     net_sec_rule_source = var.ip_v1_raghu_chilukoori
#     net_sec_rule_source_type = "CIDR_BLOCK"
#     create_ingress_tcp            = true
#     net_sec_rule_tcp_min = "22"
#     net_sec_rule_tcp_max = "22"
# }

