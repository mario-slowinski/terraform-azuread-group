locals {
  group = one([for display_name, group in azuread_group.display_name : group])
}
