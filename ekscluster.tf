resource "aws_eks_cluster" "eks_cluster"{
    name = "eks_cluster"
    role_arn = aws_iam_role.eks_cluster_role.arn
    vpc_config {
        subnet_ids = [aws_subnet.eks_subnet_1.id, aws_subnet.eks_subnet_2.id]

        #Security vulnerability ,Public endpoint access is enabled for the EKS cluster, which can expose the cluster to potential security risks. It is recommended to disable public endpoint access and use private endpoint access instead to enhance security.
        endpoint_public_access = true
    }
}