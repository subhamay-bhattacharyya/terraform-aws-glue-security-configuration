![](https://img.shields.io/github/commit-activity/t/subhamay-bhattacharyya/terraform-aws-glue-security-configuration)&nbsp;![](https://img.shields.io/github/last-commit/subhamay-bhattacharyya/terraform-aws-glue-security-configuration)&nbsp;![](https://img.shields.io/github/release-date/subhamay-bhattacharyya/terraform-aws-glue-security-configuration)&nbsp;![](https://img.shields.io/github/repo-size/subhamay-bhattacharyya/terraform-aws-glue-security-configuration)&nbsp;![](https://img.shields.io/github/directory-file-count/subhamay-bhattacharyya/terraform-aws-glue-security-configuration)&nbsp;![](https://img.shields.io/github/issues/subhamay-bhattacharyya/terraform-aws-glue-security-configuration)&nbsp;![](https://img.shields.io/github/languages/top/subhamay-bhattacharyya/terraform-aws-glue-security-configuration)&nbsp;![](https://img.shields.io/github/commit-activity/m/subhamay-bhattacharyya/terraform-aws-glue-security-configuration)&nbsp;![](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/bsubhamay/1ebc020e3a412dbbed286ba4e3fe1a93/raw/terraform-aws-glue-security-configuration.json?)

# Terraform AWS Glue Job Security Configuration Module

This Terraform module creates AWS Glue Job Security Configuration with various configurations.

## Usage

```hcl
module "glue_job_security_configuration" {
  source  = "app.terraform.io/subhamay-bhattacharyya/glue-security-configuration/aws"
  version = "1.0.0"

  aws-region       = "us-east-1"
  project-name     = "your-project-name"
  environment-name = "devl"
  
  security-configuration = {
    enabled                  = true
    name                     = "glue-job-security"
    description              = "Glue Job Security Configuration"
    kms-key-arn              = "arn:aws:kms:us-east-1:637423502513:key/494509e4-3bc5-44b8-9c4d-12449900d395"
    s3-encryption-mode       = "SSE-KMS"
    
    encryption-configuration = {
      cloudwatch-encryption-mode   = "DISABLED"
      job-bookmark-encryption-mode = "DISABLED"
      s3-encryption-mode           = "DISABLED"
    }
  }
}
```


## Inputs

| Name                      | Description                                                     | Type          | Default | Required |
|---------------------------|-----------------------------------------------------------------|---------------|---------|----------|
| aws-region                | The AWS region to deploy resources                              | string        | us-east-1| yes       |
| project-name              | The name of the project                                         | string        | n/a  | yes       |
| environment-name          | The environment in which to deploy resources                    | string        | devl    | no       |
| security-configuration    | Security configurations for Glue jobs                           | object        | <see below> | no       |

### security-configuration object

| Name                      | Description                                                     | Type          | Default | Required |
|---------------------------|-----------------------------------------------------------------|---------------|---------|----------|
| enabled                   | Whether the security configuration is enabled                   | bool          | true    | no       |
| name                      | The name of the security configuration                          | string        | glue-job-security | no |
| description               | The description of the security configuration                   | string        | Glue Job Security Configuration | no |
| kms-key-arn               | The ARN of the KMS key used for encryption                      | string        | < KMS Key Arn > | no |
| s3-encryption-mode        | The S3 encryption mode                                          | string        | SSE-KMS | no       |
| encryption-configuration  | The encryption configuration object                             | object        | < see below > | no       |

### encryption-configuration object

| Name                      | Description                                                     | Type          | Default | Required |
|---------------------------|-----------------------------------------------------------------|---------------|---------|----------|
| cloudwatch-encryption-mode| The CloudWatch encryption mode                                  | string        | DISABLED| no       |
| job-bookmark-encryption-mode | The job bookmark encryption mode                             | string        | DISABLED| no       |
| s3-encryption-mode        | The S3 encryption mode                                          | string        | DISABLED| no       |

## Outputs

| Name                      | Description                                           |
|---------------------------|-------------------------------------------------------|
| security_configuration_id | The ID of the Glue Job Security Configuration         |
