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

# Pages project managing project source
resource "cloudflare_pages_project" "source_config" {
  account_id        = "57cfd03a9dc176b07c4a598dc25c844f"
  name              = "profile-here"
  production_branch = "main"
  source {
    type = "github"
    config {
      owner                         = "TefoAM"
      repo_name                     = "cloudflare-iac"
      production_branch             = "main"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "custom"
      preview_branch_includes       = ["dev", "preview"]
      preview_branch_excludes       = ["main", "prod"]
    }
  }
}