/*
###################################################################################################
# Terraform Variables Configuration
#
# Description: This module creates an Glue Job Security Configuration using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 14-Nov-2024  Updated: 14-Nov-2024
# Version: 1.0
#
####################################################################################################
*/

######################################## AWS Configuration #########################################
variable "aws-region" {
  type    = string
  default = "us-east-1"
}

######################################## Project Name ##############################################
variable "project-name" {
  description = "The name of the project"
  type        = string
  default     = "your-project-name"
}

######################################## Environment Name ##########################################
variable "environment-name" {
  type        = string
  description = <<EOF
  (Optional) The environment in which to deploy our resources to.

  Options:
  - devl : Development
  - test: Test
  - prod: Production

  Default: devl
  EOF
  default     = "devl"

  validation {
    condition     = can(regex("^devl$|^test$|^prod$", var.environment-name))
    error_message = "Err: environment is not valid."
  }
}

######################################## Security Configuration ####################################
# Security configuration for Glue jobs
variable "security-configuration" {
  description = "Security configurations for Glue jobs"
  type = object({
    enabled            = bool
    name               = string
    description        = string
    kms-key-arn        = string
    s3-encryption-mode = string
    encryption-configuration = object({
      cloudwatch-encryption-mode   = string
      job-bookmark-encryption-mode = string
      s3-encryption-mode           = string
    })
  })
  default = {
    enabled            = true
    name               = "glue-job-security"
    description        = "Glue Job Security Configuration"
    kms-key-arn        = "arn:aws:kms:us-east-1:637423502513:key/494509e4-3bc5-44b8-9c4d-12449900d395"
    s3-encryption-mode = "SSE-KMS"
    encryption-configuration = {
      cloudwatch-encryption-mode   = "DISABLED"
      job-bookmark-encryption-mode = "DISABLED"
      s3-encryption-mode           = "DISABLED"
    }
  }
}
######################################## GitHub ####################################################
# The CI build string
variable "ci-build" {
  description = "The CI build string"
  type        = string
  default     = "gitops"
}
