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


# resource "cloudflare_zone_settings_override" "example-com-settings" {
#   zone_id = cloudflare_record.terraform_managed_resource_f9bf3529ef83572efab975d717e630c6.zone_id

#   settings {
#     tls_1_3                  = "on"
#     automatic_https_rewrites = "on"
#     ssl                      = "strict"
#   }
# }

resource "cloudflare_zone_settings_override" "example-com-settings" {
    zone_id           = "c6df5ea3259930bb26618693600e7e3d"
    settings {
        always_online               = "off"
        always_use_https            = "on"
        automatic_https_rewrites    = "on"
        binary_ast                  = "off"
        brotli                      = "on"
        browser_cache_ttl           = 14400
        browser_check               = "on"
        cache_level                 = "aggressive"
        challenge_ttl               = 1800
        ciphers                     = []
        cname_flattening            = "flatten_at_root"
        development_mode            = "off"
        early_hints                 = "off"
        email_obfuscation           = "on"
        filter_logs_to_cloudflare   = "off"
        fonts                       = "off"
        h2_prioritization           = "off"
        hotlink_protection          = "off"
        http2                       = "on"
        http3                       = "on"
        ip_geolocation              = "on"
        ipv6                        = "on"
        log_to_cloudflare           = "on"
        max_upload                  = 100
        min_tls_version             = "1.0"
        mirage                      = "off"
        opportunistic_encryption    = "on"
        opportunistic_onion         = "on"
        orange_to_orange            = "off"
        origin_error_page_pass_thru = "off"
        origin_max_http_version     = "2"
        polish                      = "off"
        prefetch_preload            = "off"
        privacy_pass                = "on"
        proxy_read_timeout          = "100"
        pseudo_ipv4                 = "off"
        response_buffering          = "off"
        rocket_loader               = "off"
        security_level              = "medium"
        server_side_exclude         = "on"
        sort_query_string_for_cache = "off"
        ssl                         = "full"
        tls_1_3                     = "on"
        tls_client_auth             = "off"
        true_client_ip_header       = "off"
        visitor_ip                  = "on"
        waf                         = "off"
        websockets                  = "on"
        zero_rtt                    = "off"

        minify {
            css  = "off"
            html = "off"
            js   = "off"
        }

        security_header {
            enabled            = false
            include_subdomains = false
            max_age            = 0
            nosniff            = false
            preload            = false
        }
    }
}