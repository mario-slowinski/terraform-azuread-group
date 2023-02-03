variable "administrative_unit_ids" {
  type        = set(string)
  description = "The object IDs of administrative units in which the group is a member."
  default     = null
}

variable "assignable_to_role" {
  type        = bool
  description = "Indicates whether this group can be assigned to an Azure Active Directory role. Defaults to false."
  default     = null
}

variable "auto_subscribe_new_members" {
  type        = bool
  description = "Indicates whether new members added to the group will be auto-subscribed to receive email notifications. Can only be set for Unified groups."
  default     = null
}

variable "behaviors" {
  type        = set(string)
  description = "A set of behaviors for a Microsoft 365 group. Possible values are AllowOnlyMembersToPost, HideGroupInOutlook, SubscribeMembersToCalendarEventsDisabled, SubscribeNewGroupMembers and WelcomeEmailDisabled."
  default     = null
}

variable "description" {
  type        = string
  description = "The description for the group."
  default     = null
}

variable "display_name" {
  type        = string
  description = "The display name for the group."
  default     = null
}

variable "dynamic_membership" {
  type = object({
    enabled = string # Whether rule processing is "On" (true) or "Paused" (false).
    rule    = string # The rule that determines membership of this group.
  })
  description = "A dynamic_membership block as documented below. Required when types contains DynamicMembership."
  default     = { enabled = null, rule = null }
}

variable "external_senders_allowed" {
  type        = string
  description = "Indicates whether people external to the organization can send messages to the group. Can only be set for Unified groups."
  default     = null
}

variable "hide_from_address_lists" {
  type        = bool
  description = "Indicates whether the group is displayed in certain parts of the Outlook user interface: in the Address Book, in address lists for selecting message recipients, and in the Browse Groups dialog for searching groups. Can only be set for Unified groups."
  default     = null
}

variable "hide_from_outlook_clients" {
  type        = bool
  description = "Indicates whether the group is displayed in Outlook clients, such as Outlook for Windows and Outlook on the web. Can only be set for Unified groups."
  default     = null
}

variable "mail_enabled" {
  type        = bool
  description = "Whether the group is a mail enabled, with a shared group mailbox. At least one of mail_enabled or security_enabled must be specified."
  default     = null
}

variable "mail_nickname" {
  type        = string
  description = "The mail alias for the group, unique in the organisation. Required for mail-enabled groups."
  default     = null
}

variable "members" {
  type = list(object({
    employee_id         = optional(string) # The employee identifier assigned to the user by the organisation.
    mail                = optional(string) # The SMTP address for the user.
    mail_nickname       = optional(string) # The email alias of the user.
    object_id           = optional(string) # The object ID of the user.
    user_principal_name = optional(string) # The user principal name (UPN) of the user.
  }))
  description = "A list of members attributes who should be present in this group."
  default     = []
}

variable "onpremises_group_type" {
  type        = string
  description = "The on-premises group type that the AAD group will be written as, when writeback is enabled. Possible values are UniversalDistributionGroup, UniversalMailEnabledSecurityGroup, or UniversalSecurityGroup."
  default     = null
}

variable "owners" {
  type = list(object({
    employee_id         = optional(string) # The employee identifier assigned to the user by the organisation.
    mail                = optional(string) # The SMTP address for the user.
    mail_nickname       = optional(string) # The email alias of the user.
    object_id           = optional(string) # The object ID of the user.
    user_principal_name = optional(string) # The user principal name (UPN) of the user.
  }))
  description = "A list of members attributes who will be granted ownership of the group."
  default     = []
}

variable "prevent_duplicate_names" {
  type        = bool
  description = "If true, will return an error if an existing group is found with the same name."
  default     = true
}

variable "provisioning_options" {
  type        = set(string)
  description = "A set of provisioning options for a Microsoft 365 group. The only supported value is Team."
  default     = null
}

variable "security_enabled" {
  type        = string
  description = "Whether the group is a security group for controlling access to in-app resources. At least one of security_enabled or mail_enabled must be specified."
  default     = null
}

variable "theme" {
  type        = string
  description = "The colour theme for a Microsoft 365 group. Possible values are Blue, Green, Orange, Pink, Purple, Red or Teal."
  default     = null
}

variable "types" {
  type        = set(string)
  description = "A set of group types to configure for the group. Supported values are DynamicMembership, which denotes a group with dynamic membership, and Unified, which specifies a Microsoft 365 group."
  default     = null
}

variable "visibility" {
  type        = string
  description = "The group join policy and group content visibility. Possible values are Private, Public, or Hiddenmembership."
  default     = null
}

variable "writeback_enabled" {
  type        = bool
  description = "Whether the group will be written back to the configured on-premises Active Directory when Azure AD Connect is used."
  default     = null
}
