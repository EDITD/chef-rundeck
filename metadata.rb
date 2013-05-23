name             "chef-rundeck"
maintainer       "Simon Johansson"
maintainer_email "simon@simonjohansson.com"
license          "All rights reserved"
description      "Installs/Configures chef-rundeck"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "java", "= 1.11.4"
depends "database", "= 1.3.12"
depends "mysql", "= 3.0.0"
