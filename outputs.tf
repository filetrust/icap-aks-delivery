output "aks01_cluster_outputs" {
	value 	  = module.create_aks_cluster
	sensitive = true
}

output "storage_acccount_outputs" {
	value = module.create_storage_account
}

output "file_drop_cluster_outputs" {
	value = module.create_aks_cluster_file_drop
	sensitive = true
}