name             "rundeck"
maintainer       "Simon Johansson"
maintainer_email "simon@simonjohansson.com"
license          "MIT"
description      "Installs/Configures rundeck"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
supports         "ubuntu", ">= 12.04"
version          "0.1.0"


depends "java", "= 1.11.4"
depends "database", "= 1.3.12"
depends "mysql", "= 3.0.0"
depends "apt", "= 1.9.2"
