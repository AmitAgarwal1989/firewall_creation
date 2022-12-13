terraform{
    backend "s3" {
        bucket = "network-e1-ifirewall-terraformstate"
        encrypt = true
        key = "terraform.tfstate"
        region = "us-east-1"
      
    }
}
