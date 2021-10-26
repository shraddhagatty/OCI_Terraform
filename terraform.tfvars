#### Uncomment the variable and provide an appropriate value.
/*
### Tenancy Connectivity variables
tenancy_ocid         = "<tenancy_ocid>"
user_ocid            = "<user_ocid>"



### Environment/IAM variables
region        = "<tenancy_region>"
customer_label = "<Label used as a prefix for naming resources>"

### Backend
tfstate_bucket_name = "<>"
tfstate_endpoint = "<>"
tfstate_key = "<>"
tfstate_profile = "<>"

### Networking variables
# IPAM:
ip_vcn = "<VCN CIDR>"
ip_subnet_ext_prod = "<Subnet IP - Prod External>"
ip_subnet_app_prod = "<Subnet IP - Prod Application>"
ip_subnet_db_prod =" <Subnet IP - Prod Database>"
ip_subnet_app_nonprod = "<Subnet IP- NonProd Application>"
ip_subnet_db_nonprod =" <Subnet IP- NonProd Database>"
ip_subnet_dmz_prod = "<Subnet IP- Prod DMZ>"
ip_subnet_dmz_nonprod = "<Subnet IP- Nonprod DMZ>"
ip_subnet_ext_nonprod = "<Subnet IP- Nonprod External>"

### Tags Name
StackName = "<>"
StackOwner = "<>"
ProjectName = "<>"
BillingOwner = "<>"
CostCenter = "<>"
Workload = "<>"


### Exadata variables
# exacs_vcn_cidrs           = ["<cidr_1>,"<cidr_2>","...","<cidr_n>"] # list of CIDRs to be used when creating the VCNs. One CIDR to one VCN. 
# exacs_client_subnet_cidrs = ["<cidr_1>,"<cidr_2>","...","<cidr_n>"] # list of CIDR blocks for the client subnets of Exadata Cloud Service VCNs, in CIDR notation. One subnet CIDR to one VCN CIDR, the nth element corresponding to exa_vcn_cidrs' nth element.
# exacs_backup_subnet_cidrs = ["<cidr_1>,"<cidr_2>","...","<cidr_n>"] # list of CIDR blocks for the backup subnets of Exadata Cloud Service VCNs, in CIDR notation. One subnet CIDR to one VCN CIDR, the nth element corresponding to exa_vcn_cidrs' nth element.
# exacs_vcn_names           = ["<name_1>,"<name_2>","...","<name_n>"] # list of VCN names to override default names with. One name to one VCN CIDR, the nth element corresponding to exa_vcn_cidrs' nth element. 
# deploy_exainfra_cmp       = true # whether to deploy a compartment for Exadata infrastructure.


### Network Connectivity variables
# public_src_lbr_cidrs     = ["<cidr_1>","<cidr_2>","...","<cidr_n>"] # external IP ranges in CIDR notation allowed to make HTTPS inbound connections.
# public_src_bastion_cidrs = ["<cidr_1>","<cidr_2>","...","<cidr_n>"] # external IP ranges in CIDR notation allowed to make SSH inbound connections. 0.0.0.0/0 is not allowed in the list.
# public_dst_cidrs         = ["<cidr_1>","<cidr_2>","...","<cidr_n>"] # external IP ranges in CIDR notation for HTTPS outbound connections.
# onprem_cidrs             = ["<cidr_1>","<cidr_2>","...","<cidr_n>"] # list of on-premises CIDRs that are routeable to Landing Zone networks.
# onprem_src_ssh_cidrs     = ["<cidr_1>","<cidr_2>","...","<cidr_n>"] # list of on-premises CIDRs allowed to connect to Landing Zone networks over SSH. They must be a subset of onprem_cidrs.




*/