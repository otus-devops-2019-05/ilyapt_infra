resource "google_compute_instance_group" "reddit-cluster" {
  name = "reddit-cluster"
  zone = "${var.zone}"
  instances = ["${google_compute_instance.app.*.self_link}"]
  named_port {
    name = "puma-http"
    port = "9292"
  }
}
resource "google_compute_target_http_proxy" "puma-proxy" {
  name = "puma-proxy"
  url_map = "${google_compute_url_map.puma-map.self_link}"
}
resource "google_compute_url_map" "puma-map" {
  name = "puma-map"
  default_service = "${google_compute_backend_service.reddit-backend.self_link}"
}

resource "google_compute_backend_service" "reddit-backend" {
  name = "reddit-backend"
  protocol = "HTTP"
  port_name = "puma-http"
  backend = [{group = "${google_compute_instance_group.reddit-cluster.self_link}"}]
  health_checks = ["${google_compute_http_health_check.http-health-check.self_link}"]
}

resource "google_compute_http_health_check" "http-health-check" {
  name = "http-health-check"
  check_interval_sec = 10
  timeout_sec = 5
  port = "9292"
}

resource "google_compute_global_forwarding_rule" "reddit-forward" {
  name = "reddit-forward"
  target = "${google_compute_target_http_proxy.puma-proxy.self_link}"
  port_range = "80"
}
