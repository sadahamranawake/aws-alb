output "AlbArn" {
  value = aws_lb.AlbInternetFacing.arn
}

output "AlbDnsName" {
  value = aws_lb.AlbInternetFacing.dns_name
}

output "AlbZoneId" {
  value = aws_lb.AlbInternetFacing.zone_id
}
