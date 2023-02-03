data "azuread_user" "member" {
  for_each = {
    for user in var.members :
    coalesce(
      user.employee_id,
      user.mail,
      user.mail_nickname,
      user.object_id,
      user.user_principal_name,
    ) => user
    if user.employee_id != null ||
    user.mail != null ||
    user.mail_nickname != null ||
    user.object_id != null ||
    user.user_principal_name != null
  }

  employee_id         = each.value.employee_id
  mail                = each.value.mail
  mail_nickname       = each.value.mail_nickname
  object_id           = each.value.object_id
  user_principal_name = each.value.user_principal_name
}

data "azuread_user" "owner" {
  for_each = {
    for user in var.owners :
    coalesce(
      user.employee_id,
      user.mail,
      user.mail_nickname,
      user.object_id,
      user.user_principal_name,
    ) => user
    if user.employee_id != null ||
    user.mail != null ||
    user.mail_nickname != null ||
    user.object_id != null ||
    user.user_principal_name != null
  }

  employee_id         = each.value.employee_id
  mail                = each.value.mail
  mail_nickname       = each.value.mail_nickname
  object_id           = each.value.object_id
  user_principal_name = each.value.user_principal_name
}
