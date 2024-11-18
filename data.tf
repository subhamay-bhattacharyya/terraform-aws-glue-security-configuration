/*
####################################################################################################
# Terraform Data Blocks Configuration
#
# Description: This module creates an Glue Job Security Configuration using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 14-Nov-2024  Updated: 14-Nov-2024
# Version: 1.0
#
####################################################################################################
*/

# AWS Region and Caller Identity
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}