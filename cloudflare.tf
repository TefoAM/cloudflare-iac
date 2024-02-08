terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }

  backend "remote" {
    organization = "tefo-life"
    workspaces {
      name = "cloudflare-api-github"
    }
  }
}
provider "cloudflare" {
  api_token = "iZKSeN_T0ESSFH0bQijl1su-Uvuh64lznAURk_b4"
}

resource "cloudflare_record" "tefoam_github_io_profile" {
  comment = "This is from github"
  name    = "@"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "tefoam.github.io"
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
