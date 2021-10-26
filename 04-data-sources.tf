############################################################################
# Data Sources:
############################################################################

# Tenancy:
data "oci_identity_tenancy" "tenancy" {
  tenancy_id = var.tenancy_ocid
}

# Tenancy Home Region:
data "oci_identity_regions" "home-region" {
  filter {
    name   = "key"
    values = [data.oci_identity_tenancy.tenancy.home_region_key]
  }
}

# Tenancy Availability Domains:
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

# Object Storage Services:
data "oci_core_services" "core_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

# Object Storage Namespace:
data "oci_objectstorage_namespace" "namespace" {
}

############################################################################
#Provides list of images in OCI core service
/*
data "oci_core_images" "test_images" {

    compartment_id = var.tenancy_ocid
    operating_system = var.operating_system
    operating_system_version = var.operating_system_version

}


############################################################################
# Custom Images:

data "oci_core_images" "v1_oel79_golden_image" {
    compartment_id = module.compartment-common-services.compartment_id
    display_name   = "OEL7.9 Golden Image"
}

data "oci_core_images" "v1_oel8_golden_image" {
    compartment_id = module.compartment-common-services.compartment_id
    display_name   = "oel8_golden_image"
}

data "oci_core_images" "v1_oel6_golden_image" {
    compartment_id = module.compartment-common-services.compartment_id
    display_name   = "OEL6.10 Golden Image"
}
############################################################################


data "oci_core_image_shapes" "test_image_shapes" {
    #Required
    image_id = data.oci_core_images.v1_oel8_golden_image.images[0].id
}*/