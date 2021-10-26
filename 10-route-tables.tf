############################################################################
# Route Tables:
############################################################################
# Prod Red Tier:

module "route_table_prod_ext" {
    source               = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/route_table"
    display_name         = "prod-red-rt"
    vcn_id               = module.vcn.vcn_id
    compartment_id       = module.compartment-common-services.compartment_id
    route_rules          = [
        {
        destination       = "0.0.0.0/0"  
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.igw_id[0]
        },
      /*  {
        destination       = var.ip_imerja_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_barts_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cw_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cl_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        }*/
    ]
    defined_tags         = local.tags_common
}

############################################################################
# Prod Amber Tier:

module "route_table_prod_app" {
    source               = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/route_table"
    display_name         = "prod-amber-rt"
    vcn_id               = module.vcn.vcn_id
    compartment_id       = module.compartment-common-services.compartment_id
    route_rules          = [
        {
        destination       = "0.0.0.0/0"  
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.ngw_id[0]
        },
        {
        destination       = lookup(data.oci_core_services.core_services.services[0], "cidr_block")
        destination_type  = "SERVICE_CIDR_BLOCK"
        network_entity_id = module.vcn.sgw_id[0]
        },
       /* {
        destination       = var.ip_imerja_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]
        },        
        {
        destination       = var.ip_imerja_domain2
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]
        },
        
        {
        destination       = var.ip_barts_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_barts_domain3
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cw_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cl_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_barts_homerton
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        } */
    ]
    defined_tags         = local.tags_common
}

############################################################################
# Prod Green Tier:

module "route_table_prod_db" {
    source               = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/route_table"
    display_name         = "prod-green-rt"
    vcn_id               = module.vcn.vcn_id
    compartment_id       = module.compartment-common-services.compartment_id
    route_rules          = [
        {
        destination       = "0.0.0.0/0"  
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.ngw_id[0]
        },
        {
        destination       = lookup(data.oci_core_services.core_services.services[0], "cidr_block")
        destination_type  = "SERVICE_CIDR_BLOCK"
        network_entity_id = module.vcn.sgw_id[0]
        },
       /* {
        destination       = var.ip_imerja_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]
        },
        {
        destination       = var.ip_barts_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cw_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cl_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        }*/
    ]
    defined_tags         = local.tags_common
}

############################################################################
# NonProd Red Tier:

module "route_table_nonprod_ext" {
    source               = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/route_table"
    display_name         = "nonprod-red-rt"
    vcn_id               = module.vcn.vcn_id
    compartment_id       = module.compartment-common-services.compartment_id
    route_rules          = [
        {
        destination       = "0.0.0.0/0"  
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.igw_id[0]
        },
       /* {
        destination       = var.ip_imerja_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]
        },
        {
        destination       = var.ip_barts_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cw_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cl_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        }*/
    ]
    defined_tags         = local.tags_common
}


############################################################################
# NonProd Amber Tier:

module "route_table_nonprod_app" {
    source               = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/route_table"
    display_name         = "nonprod-amber-rt"
    vcn_id               = module.vcn.vcn_id
    compartment_id       = module.compartment-common-services.compartment_id
    route_rules          = [
        {
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.ngw_id[0]
        },
        {
        destination       = lookup(data.oci_core_services.core_services.services[0], "cidr_block")
        destination_type  = "SERVICE_CIDR_BLOCK"
        network_entity_id = module.vcn.sgw_id[0]
        },
       /* {
        destination       = var.ip_imerja_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]
        },
        {
        destination       = var.ip_imerja_domain2
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]
        },
        
        {
        destination       = var.ip_barts_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_barts_domain3
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cw_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cl_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        }*/
    ]
    defined_tags         = local.tags_common
}

############################################################################
# NonProd Database Tier:

module "route_table_nonprod_db" {
    source               = "git::https://git.version1.com/scm/ivo/oci-terraform-modules-v0.12.git//modules/route_table"
    display_name         = "nonprod-green-rt"
    vcn_id               = module.vcn.vcn_id
    compartment_id       = module.compartment-common-services.compartment_id
    route_rules          = [
       {
        destination       = "0.0.0.0/0"  
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.ngw_id[0]
        },
        {
        destination       = lookup(data.oci_core_services.core_services.services[0], "cidr_block")
        destination_type  = "SERVICE_CIDR_BLOCK"
        network_entity_id = module.vcn.sgw_id[0]
        },
        /*{
        destination       = var.ip_imerja_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]
        },
        {
        destination       = var.ip_barts_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cw_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        },
        {
        destination       = var.ip_v1_cl_domain
        destination_type  = "CIDR_BLOCK"
        network_entity_id = module.vcn.drg_id[0]  
        }*/
    ]
    defined_tags         = local.tags_common
}

############################################################################
