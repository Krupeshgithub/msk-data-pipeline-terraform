module "cloudwatch" {
    source = "./cloudwatch"
}

module "network" {
    source = "./network"
}

module "msk" {
    source = "./msk"
    subnets = module.network.subnet_msk
    security_groups = [module.network.security_group_id]
    cloudwatch = module.cloudwatch.log_group
}

module "bucket" {
    source = "./bucket"
}

module "aws_iam_role" {
    source = "./iam"
}

module "lambda" {
    source = "./lambda"
    iam = module.aws_iam_role.role_arn
    cluster_arn = module.msk.cluster_arn
    bucket_name = module.bucket.bucket_name
    bootstrap_brokers = module.msk.bootstrap_brokers_tls
}
