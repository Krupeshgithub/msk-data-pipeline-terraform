output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = aws_msk_cluster.learning.bootstrap_brokers_tls
}

output "zookeeper_connect_string" {
  value = aws_msk_cluster.learning.zookeeper_connect_string
}

output "cluster_arn" {
  description = "The ARN of the MSK cluster"
  value       = aws_msk_cluster.learning.arn
}
