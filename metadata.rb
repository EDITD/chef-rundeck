name             "rundeck"
maintainer       "Simon Johansson"
maintainer_email "simon@simonjohansson.com"
license          "MIT"
description      "Installs/Configures rundeck"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
supports         "ubuntu", ">= 12.04"
version          "0.2.0"


depends "java", ">= 1.10.2"
depends "database", ">= 1.3.12"
depends "mysql", ">= 2.1.2"
depends "apt", ">= 1.9.2"
depends "nginx", ">= 0.100.2"
