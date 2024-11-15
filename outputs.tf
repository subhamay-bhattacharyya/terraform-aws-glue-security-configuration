/*
####################################################################################################
# Terraform Glue Job Outputs Configuration
#
# Description: This module creates an Glue Job Security Configuration using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 14-Nov-2024  Updated: 14-Nov-2024
# Version: 1.0
#
####################################################################################################
*/


# --- Glue Job Configuration Outputs ---
output "glue_security_configuration" {
  description = "The Glue Security Configuration ID"
  value       = aws_glue_security_configuration.glue_security_configuration.id
}