output "group" {
  description = "Group's data."
  value       = local.group
  sensitive   = false
}

output "object_id" {
  description = "The object ID of the group."
  value       = local.group.id
  sensitive   = false
}
