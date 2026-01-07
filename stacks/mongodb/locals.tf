locals {
  executor_ip = chomp(data.http.current_ip.response_body)
}
