packer {
  required_plugins {
    docker = {
      source  = "github.com/hashicorp/docker"
      version = "~> 1.1"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:24.04"
  commit = true

  changes = [
    "EXPOSE 80",
    "CMD [\"/usr/sbin/apache2ctl\", \"-D\", \"FOREGROUND\"]"
  ]
}

build {
  name    = "ubuntu-apache"
  sources = ["source.docker.ubuntu"]

  provisioner "file" {
    source      = "playbook.yml"
    destination = "/tmp/playbook.yml"
  }

  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }

  provisioner "shell" {
    environment_vars = [
      "DEBIAN_FRONTEND=noninteractive"
    ]
    inline = [
      "apt-get update",
      "apt-get install -y ansible",
      "ansible-playbook -i localhost, -c local /tmp/playbook.yml",
      "apt-get clean",
      "rm -rf /var/lib/apt/lists/* /tmp/playbook.yml /tmp/index.html"
    ]
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "ubuntu-apache-packer"
      tags       = ["latest"]
    }
  }
}
