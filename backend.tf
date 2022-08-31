# Set the access key and secret key as env variables
# MY_ACCESS_KEY and MY_SECRET_KEY, MY_S3_ENDPOINT, and run 
# terraform init --backend-config="access_key=$MY_ACCESS_KEY" --backend-config="secret_key=$MY_SECRET_KEY" --backend-config="endpoint=$MY_S3_ENDPOINT"

terraform {
  backend "s3" {
    bucket = "terraform-state-remote-bucket"
    key    = "terraform.tfstate"

    region                      = "main"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true

  }
}