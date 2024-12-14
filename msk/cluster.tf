resource "aws_msk_cluster" "learning" {
  cluster_name           = "learning"
  kafka_version          = "3.2.0"
  number_of_broker_nodes = 2

  broker_node_group_info {
    instance_type = "kafka.t3.small"
    client_subnets = var.subnets
    storage_info {
      ebs_storage_info {
        volume_size = 1
      }
    }
    security_groups = var.security_groups
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = var.cloudwatch
      }
    }
  }

  tags = {
    Name = "msk-cluster-learning"
  }
}
