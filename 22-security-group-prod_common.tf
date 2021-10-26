############################################################################
# Network Security Groups - prod_common:
############################################################################
module "security_group_prod_common" {
    source                         = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "prod_common"
    defined_tags                   = local.tags_common
}
 
output "security_group_prod_common_id" {
    value                         = module.security_group_prod_common.group_id
}
 
 
# ingress tcp ssh_access_prod_rdp_:
module "prod_common_ingress_tcp_ssh_access_prod_rdp_" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "ssh_access_prod_rdp_"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "3389"
    net_sec_rule_tcp_max = "3389"
}

 
 
# ingress tcp ssh_access_prod_common:
module "prod_common_ingress_tcp_ssh_access_prod_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "ssh_access_prod_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "22"
    net_sec_rule_tcp_max = "22"
}
 
 
# ingress udp snmp_access_prod_common:
module "prod_common_ingress_udp_snmp_access_prod_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "snmp_access_prod_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_udp            = true
    net_sec_rule_udp_min = "161"
    net_sec_rule_udp_max = "161"
}
 
 
# egress all :
module "prod_common_egress_all_3" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "prod_common_egress_all_3"
    net_sec_rule_dest = module.security_group_prod_common.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_all            = true
}
 
/* 
# egress all :
module "prod_common_egress_all_4" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_dest = var.ip_barts_domain
    net_sec_rule_dest_type = "CIDR_BLOCK"
    create_egress_all            = true
}
 
 
# ingress icmp :
module "prod_common_ingress_icmp_3" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = var.ip_barts_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_icmp            = true
}
*/ 
 
# ingress icmp :
module "prod_common_ingress_icmp_4" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_icmp            = true
}
 
 
# ingress tcp vnc_access_prod_common:
module "prod_common_ingress_tcp_vnc_access_prod_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "vnc_access_prod_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "5900"
    net_sec_rule_tcp_max = "5910"
}
 
 
# # egress tcp :
# module "prod_common_egress_tcp_2" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_common.group_id
#     net_sec_rule_desc    = ""
#     net_sec_rule_dest = "0.0.0.0/0"
#     net_sec_rule_dest_type = "CIDR_BLOCK"
#     create_egress_tcp            = true
#     net_sec_rule_tcp_min = "443"
#     net_sec_rule_tcp_max = "443"
# }
 
# # egress_tcp_http80_all :
# module "prod_common_egress_tcp_http80_all" {
#     source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
#     net_sec_group_id      = module.security_group_prod_common.group_id
#     net_sec_rule_desc    = "egress_tcp_http80_all"
#     net_sec_rule_dest = "0.0.0.0/0"
#     net_sec_rule_dest_type = "CIDR_BLOCK"
#     create_egress_tcp            = true
#     net_sec_rule_tcp_min = "80"
#     net_sec_rule_tcp_max = "80"
# }


# egress_all :
module "prod_common_egress_all" {
    source                 = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id       = module.security_group_prod_common.group_id
    net_sec_rule_desc      = "egress_all"
    net_sec_rule_dest      = "0.0.0.0/0"
    net_sec_rule_dest_type = "CIDR_BLOCK"
    create_egress_all      = true
}

# ingress tcp nfs_access_prod_common:
module "prod_common_ingress_tcp_nfs_access_prod_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "vnc_access_prod_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "111"
    net_sec_rule_tcp_max = "111"
}

# ingress tcp nfs_access_prod_common:
module "prod_common_ingress_tcp_nfs_access_prod_common_2" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "vnc_access_prod_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "2049"
    net_sec_rule_tcp_max = "2049"
}


# ingress udp nfs_access_prod_common:
module "prod_common_ingress_udp_nfs_access_prod_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "vnc_access_prod_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_udp            = true
    net_sec_rule_udp_min = "111"
    net_sec_rule_udp_max = "111"
}

# ingress udp nfs_access_prod_common:
module "prod_common_ingress_udp_nfs_access_prod_common_2" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "vnc_access_prod_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_udp            = true
    net_sec_rule_udp_min = "2049"
    net_sec_rule_udp_max = "2049"
}

# prod_app_ingress_smb_tcp1_common :
module "prod_common_ingress_smb_tcp1_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "prod_app_ingress_smb_tcp1_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "135"
    net_sec_rule_tcp_max = "139"
}

# prod_app_ingress_smb_tcp2_common :
module "prod_common_ingress_smb_tcp2_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "prod_app_ingress_smb_tcp2_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "445"
    net_sec_rule_tcp_max = "445"
}
# prod_app_ingress_smb_udp1_common :
module "prod_common_ingress_smb_udp1_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "prod_app_ingress_smb_udp1_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_udp            = true
    net_sec_rule_udp_min = "135"
    net_sec_rule_udp_max = "139"
}

# prod_app_ingress_smb_udp2_common :
module "prod_common_ingress_smb_udp2_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "prod_app_ingress_smb_udp2_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_udp            = true
    net_sec_rule_udp_min = "445"
    net_sec_rule_udp_max = "445"
}

# prod_common_ingress_http_disco_prod_common:
module "prod_common_ingress_http_disco_prod_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "prod_common_ingress_http_disco_prod_common"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "9001"
    net_sec_rule_tcp_max = "9001"
}




# ingress tcp nfs_access_nonprod_common:
module "prod_common_ingress_tcp_nfs_access_nonprod_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "nfs_tcp1_access_nonprod_common"
    net_sec_rule_source = module.security_group_nonprod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "111"
    net_sec_rule_tcp_max = "111"
}

# ingress tcp nfs_access_nonprod_common:
module "prod_common_ingress_tcp_nfs_access_nonprod_common_2" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "nfs_tcp2_access_nonprod_common"
    net_sec_rule_source = module.security_group_nonprod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "2049"
    net_sec_rule_tcp_max = "2049"
}


# ingress udp nfs_access_nonprod_common:
module "prod_common_ingress_udp_nfs_access_nonprod_common" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "nfs_udp1_access_nonprod_common"
    net_sec_rule_source = module.security_group_nonprod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_udp            = true
    net_sec_rule_udp_min = "111"
    net_sec_rule_udp_max = "111"
}

# ingress udp nfs_access_nonprod_common:
module "prod_common_ingress_udp_nfs_access_nonprod_common_2" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "nfs_udp1_access_nonprod_common"
    net_sec_rule_source = module.security_group_nonprod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_udp            = true
    net_sec_rule_udp_min = "2049"
    net_sec_rule_udp_max = "2049"
}
/*
# elfc_prod_pub 4747 access:
module "elfc_prod_pub_rule" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "elfc_prod_pub_rule"
    net_sec_rule_source = var.elfc_prod_pub
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "4747"
    net_sec_rule_tcp_max = "4747"
}

# elfc_qvs_pub 4747 access:
module "elfc_prod_qvs_rule" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "elfc_prod_qvs_rule"
    net_sec_rule_source = var.elfc_prod_qvs
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "4747"
    net_sec_rule_tcp_max = "4747"
}*/

# opsview monitoring of port 8888
module "app_port_8888_opsview_monitoring" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_common.group_id
    net_sec_rule_desc    = "app_port_8888_opsview_monitoring"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8888"
    net_sec_rule_tcp_max = "8888"
}

module "prod_common_ingress_tcp1" {
    source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id         = module.security_group_prod_common.group_id
    net_sec_rule_desc        = "prod_common_ingress_tcp1"
    net_sec_rule_source      = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "7000"
    net_sec_rule_tcp_max     = "7005"
}

module "prod_common_ingress_tcp2" {
    source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id         = module.security_group_prod_common.group_id
    net_sec_rule_desc        = "prod_common_ingress_tcp2"
    net_sec_rule_source      = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "5558"
    net_sec_rule_tcp_max     = "5559"
}

module "prod_common_ingress_tcp3" {
    source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id         = module.security_group_prod_common.group_id
    net_sec_rule_desc        = "prod_common_ingress_tcp3"
    net_sec_rule_source      = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "12347"
    net_sec_rule_tcp_max     = "12347"
}