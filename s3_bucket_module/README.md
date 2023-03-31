## S3 bucket module

This Terraform module creates a S3 bucket: 
* with versioning enabled
* the public access disabled 
* the following tag attached: `managed-by: terraform`
* a lifecycle rule attached. That lifecycle rule will move objects to Infrequent Access after 30 days, and to Glacier after 60 days.