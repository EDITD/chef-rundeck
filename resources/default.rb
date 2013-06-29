actions :create
default_action :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :project_name, :kind_of => String, :required => false
attribute :ssh_key, :kind_of => String, :required => false
attribute :ssh_user, :kind_of => String, :required => false

def initialize(*args)
  super
  @action = :create
end
