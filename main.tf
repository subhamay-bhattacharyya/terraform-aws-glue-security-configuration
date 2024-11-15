/*
####################################################################################################
# Terraform Glue Job Configuration
#
# Description: This module creates an Glue Job Security Configuration using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 14-Nov-2024  Updated: 14-Nov-2024
# Version: 1.0
#
####################################################################################################
*/

# --- Glue Security Configuration
resource "aws_glue_security_configuration" "glue_security_configuration" {

  name  = var.security-configuration["name"]

  encryption_configuration {
    cloudwatch_encryption {
      cloudwatch_encryption_mode = var.security-configuration.encryption-configuration.cloudwatch-encryption-mode
    }

    job_bookmarks_encryption {
      job_bookmarks_encryption_mode = var.security-configuration.encryption-configuration.job-bookmark-encryption-mode
    }

    s3_encryption {
      kms_key_arn        = var.security-configuration.kms-key-arn
      s3_encryption_mode = var.security-configuration.s3-encryption-mode
    }
  }
}

