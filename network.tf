# VPC and Subnets
resource "aws_vpc" "eks_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "eks_subnet_1"{
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "eks_subnet_2"{
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"
}

#IAM Role for EKS 
resource "aws_iam_role" "eks_cluster_role"{
    name = "eks_cluster_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
                Service="eks.amazon.com"    
            }
        }]
    })
}