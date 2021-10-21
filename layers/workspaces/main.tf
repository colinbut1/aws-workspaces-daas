resource "aws_workspaces_directory" "main" {
  directory_id = aws_directory_service_directory.ad_directory.id
}

data "aws_workspaces_bundle" "value_windows_10" {
  bundle_id = "wsb-bh8rsxt14"
}

resource "aws_workspaces_workspace" "workspace" {
  directory_id                   = aws_workspaces_directory.main.id
  bundle_id                      = data.aws_workspaces_bundle.value_windows_10.id
  user_name                      = var.user_name
  root_volume_encryption_enabled = true
  user_volume_encryption_enabled = true
  volume_encryption_key          = var.kms_key_id

  workspace_properties {
    compute_type_name = "VALUE"
    # We wouldn't want the user to always bother us to restart the workspace
    running_mode = "ALWAYS_ON"
  }
}