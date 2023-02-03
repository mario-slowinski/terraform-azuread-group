resource "azuread_group_member" "object_id" {
  for_each = {} # for user in data.azuread_user.member : user.object_id => user if user.object_id != null }

  group_object_id  = local.group
  member_object_id = each.value.object_id
}
