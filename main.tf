terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.73"
    }
  }
}

resource "aws_fms_policy" "example" {
  name                  = "Security-Prod-E1-FW001"
  exclude_resource_tags = false
  remediation_enabled   = true
  resource_type         = "AWS::EC2::Instance"

  security_service_policy_data {
    type = "SECURITY_GROUPS_COMMON"

    managed_service_data = jsonencode({
      type = "SECURITY_GROUPS_COMMON",
      securityGroups = [{
        id = var.sg_id
        }]
      revertManualSecurityGroupChanges = false
      exclusiveResourceSecurityGroupManagement = false
      applyToAllEC2InstanceENIs = false
      includeSharedVPC = false
      enableTagDistribution = false
    })
  }

  tags = {
    Name = "Security-Prod-E1-FW001"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "transit-attachment" {
  subnet_ids         = var.subnet_id
  transit_gateway_id = var.tgw
  vpc_id             = var.vpc
  ipv6_support       = "disable"
  tags = {
    "Name" = "Network-Prod-E1-TGShareAttachment001"
  }
}

resource "aws_route" "transit_gateway_route" {
  route_table_id         = var.route_table_id
  destination_cidr_block = var.cidr
  gateway_id             = var.tgw
  depends_on = [aws_ec2_transit_gateway_vpc_attachment.transit-attachment]
}
