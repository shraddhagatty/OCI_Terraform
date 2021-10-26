############################################################################
# Network Security Groups - nonprod_app:
############################################################################
module "security_group_nonprod_app" {
    source                         = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "nonprod_app"
    defined_tags                   = local.tags_common
}
 
output "security_group_nonprod_app_id" {
    value                         = module.security_group_nonprod_app.group_id
}
 
############################################################################
# EGRESS:

module "nonprod_app_egress_nprd_app_ext_ssh" {
    source                 = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id       = module.security_group_nonprod_app.group_id
    net_sec_rule_desc      = "nonprod_app_egress_nprd_app_ext_ssh"
    net_sec_rule_dest      = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_tcp      = true
    net_sec_rule_tcp_min   = "22"
    net_sec_rule_tcp_max   = "22"
}

############################################################################
# ingress tcp :
module "nonprod_app_ingress_tcp" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_nonprod_lb.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8000"
    net_sec_rule_tcp_max = "8009"
}

module "nonprod_app_ingress_tcp_db" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_nonprod_db.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8000"
    net_sec_rule_tcp_max = "8009"
}

module "nonprod_app_ingress_sftp_external" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_nonprod_lb_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "22"
    net_sec_rule_tcp_max = "22"
}
 /*
# nonprod_app_ingress_sftp_barts:
module "nonprod_app_ingress_sftp_barts" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "nonprod_app_ingress_sftp_barts"
    net_sec_rule_source  = var.ip_barts_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "22"
    net_sec_rule_tcp_max = "22"
}

# nonprod_app_ingress_disco_barts:
module "nonprod_app_ingress_disco_barts" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "nonprod_app_ingress_sftp_barts"
    net_sec_rule_source  = var.ip_barts_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8888"
    net_sec_rule_tcp_max = "8889"
}

# nonprod_app_ingress_smb_tcp1_barts :
module "nonprod_app_ingress_smb_tcp1_barts" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "nonprod_app_ingress_smb_tcp1_barts"
    net_sec_rule_source  = var.ip_barts_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "135"
    net_sec_rule_tcp_max = "139"
}

# nonprod_app_ingress_smb_tcp2_barts :
module "nonprod_app_ingress_smb_tcp2_barts" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "nonprod_app_ingress_smb_tcp2_barts"
    net_sec_rule_source  = var.ip_barts_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "445"
    net_sec_rule_tcp_max = "445"
}

# nonprod_app_ingress_smb_udp1_barts :
module "nonprod_app_ingress_smb_udp1" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "nonprod_app_ingress_smb_udp1_barts"
    net_sec_rule_source  = var.ip_barts_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_udp            = true
    net_sec_rule_udp_min = "135"
    net_sec_rule_udp_max = "139"
}

# nonprod_app_ingress_smb_udp2_barts :
module "nonprod_app_ingress_smb_udp2_barts" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "nonprod_app_ingress_smb_udp2_barts"
    net_sec_rule_source  = var.ip_barts_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_udp            = true
    net_sec_rule_udp_min = "445"
    net_sec_rule_udp_max = "445"
}

# nonprod_app_ingress_ping_imerja :
module "nonprod_app_ingress_ping_imerja" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "nonprod_app_ingress_ping_imerja"
    net_sec_rule_source = var.ip_imerja_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_icmp            = true
}

# nonprod_app_ingress_netbios_udp_imerja :
module "nonprod_app_ingress_netbios_udp_imerja" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "nonprod_app_ingress_netbios_udp_imerja"
    net_sec_rule_source  = var.ip_imerja_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_udp            = true
    net_sec_rule_udp_min = "135"
    net_sec_rule_udp_max = "139"
}

# nonprod_app_ingress_netbios_tcp_imerja:
module "nonprod_app_ingress_netbios_tcp_imerja" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "nonprod_app_ingress_netbios_tcp_imerja"
    net_sec_rule_source  = var.ip_imerja_domain
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "135"
    net_sec_rule_tcp_max = "139"
} */

module "nonprod_app_ingress_tcp_22" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "LB SFTP access"
    net_sec_rule_source = module.security_group_nonprod_lb_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "22"
    net_sec_rule_tcp_max = "22"
}

# nonprod_app_ingress_smt_from_db:
module "nonprod_app_ingress_tcp_25" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "smtp access"
    net_sec_rule_source = module.security_group_nonprod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "25"
    net_sec_rule_tcp_max = "25"
}
/*
# elfc_test_pub 
module "elfc_test_pub_rule" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "4747 access from elfc_test_pub"
    net_sec_rule_source =  var.elfc_test_pub
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "4747"
    net_sec_rule_tcp_max = "4747"
}

# elfc_test_qvs 
module "elfc_test_qvs_rule" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "4747 access from elfc_test_qvs"
    net_sec_rule_source =  var.elfc_test_qvs
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "4747"
    net_sec_rule_tcp_max = "4747"
}

# rule to allow Opsview monitoring for ports 8000-8009:
module "opsview_port_monitoring" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "opsview_port_monitoring"
    net_sec_rule_source  = var.opsview_ip
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8000"
    net_sec_rule_tcp_max = "8009"
}
*/

module "nonprod_app_ingress_nprd_app_ext_http1" {
    source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id         = module.security_group_nonprod_app.group_id
    net_sec_rule_desc        = "nonprod_app_ingress_nprd_app_ext_http1"
    net_sec_rule_source      = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "7005"
    net_sec_rule_tcp_max     = "7009"
}

module "nonprod_app_ingress_nprd_app_ext_http2" {
    source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id         = module.security_group_nonprod_app.group_id
    net_sec_rule_desc        = "nonprod_app_ingress_nprd_app_ext_http2"
    net_sec_rule_source      = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "5560"
    net_sec_rule_tcp_max     = "5564"
}

module "nonprod_app_ingress_nprd_app_ext_http3" {
    source                   = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id         = module.security_group_nonprod_app.group_id
    net_sec_rule_desc        = "nonprod_app_ingress_nprd_app_ext_http3"
    net_sec_rule_source      = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "12349"
    net_sec_rule_tcp_max     = "12349"
}

module "nonprod_app_ingress_ssh_prod_app" {
    source                = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "nonprod_app_ingress_ssh_prod_app"
    net_sec_rule_source = module.security_group_prod_app.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "22"
    net_sec_rule_tcp_max = "22"
}

############################################################################
