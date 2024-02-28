resource "azuread_group" "display_name" {
  for_each = var.display_name != null ? toset([var.display_name]) : toset([])

  administrative_unit_ids    = var.administrative_unit_ids
  assignable_to_role         = var.assignable_to_role
  auto_subscribe_new_members = var.auto_subscribe_new_members
  behaviors                  = var.behaviors
  description                = var.description
  display_name               = var.display_name
  external_senders_allowed   = var.external_senders_allowed
  hide_from_address_lists    = var.hide_from_address_lists
  hide_from_outlook_clients  = var.hide_from_outlook_clients
  mail_enabled               = var.mail_enabled
  mail_nickname              = var.mail_nickname
  members                    = length(var.members) > 0 ? var.members : null
  onpremises_group_type      = var.onpremises_group_type
  owners                     = length(var.owners) > 0 ? var.owners : null
  prevent_duplicate_names    = var.prevent_duplicate_names
  provisioning_options       = var.provisioning_options
  security_enabled           = var.security_enabled
  theme                      = var.theme
  types                      = var.types
  visibility                 = var.visibility
  writeback_enabled          = var.writeback_enabled

  dynamic "dynamic_membership" {
    for_each = var.dynamic_membership.enabled != null ? toset([var.dynamic_membership]) : toset([])
    content {
      enabled = dynamic_membership.value.enabled
      rule    = dynamic_membership.value.rule
    }
  }
}
