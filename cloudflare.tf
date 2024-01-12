terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }
}
resource "cloudflare_record" "terraform_managed_resource_f9bf3529ef83572efab975d717e630c6" {
  name    = "tefo.life"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "13.248.243.5"
  zone_id = "c6df5ea3259930bb26618693600e7e3d"
}

resource "cloudflare_record" "terraform_managed_resource_659113188270238bdf9cd1178a5abeeb" {
  name    = "tefo.life"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "76.223.105.230"
  zone_id = "c6df5ea3259930bb26618693600e7e3d"
}

resource "cloudflare_record" "terraform_managed_resource_76c628ddd39af5d9fec31b267875624c" {
  comment = "NO idea what this is??!"
  name    = "_domainconnect"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "_domainconnect.gd.domaincontrol.com"
  zone_id = "c6df5ea3259930bb26618693600e7e3d"
}

resource "cloudflare_record" "terraform_managed_resource_1c96563dfc98df4ab3583f93b1bba7b1" {
  name    = "www"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "tefo.life"
  zone_id = "c6df5ea3259930bb26618693600e7e3d"
}

resource "cloudflare_record" "terraform_managed_resource_7f25c5be93e366e4bf8ec23307657a2b" {
  name    = "tefo.life"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "\"MS=ms73782001\""
  zone_id = "c6df5ea3259930bb26618693600e7e3d"
}


resource "cloudflare_zone_settings_override" "example-com-settings" {
  zone_id = cloudflare_record.terraform_managed_resource_f9bf3529ef83572efab975d717e630c6.zone_id

  settings {
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
  }
}
