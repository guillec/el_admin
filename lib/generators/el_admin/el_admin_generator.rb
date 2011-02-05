require 'rails/generators/active_record'
require 'generators/modd/modd_generator'

class ElAdminGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :modd, :type => :boolean, :desc => "Install message of the day (modd)"
  
  def install_crap
    invoke("modd", ["#{name}"]) if options[:modd]
  end
  
end
