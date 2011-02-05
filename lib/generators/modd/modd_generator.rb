require "rails/generators/active_record"
class ModdGenerator < ActiveRecord::Generators::Base
  def install_modd
    model_name = "#{name}".downcase
    route "resources :#{name}s".downcase
    invoke "active_record:model", ["#{name}"]
    invoke "controller", ["#{name}"]
    inject_into_class "app/controllers/#{model_name}_controller.rb", "#{name}Controller", "  respond_to :html, :js\n\n 
    def index\n
      @#{model_name}s = #{name}.all\n
      @#{model_name} = #{name}.new\n
      respond_with(@#{model_name})\n 
    end\n\n

    def create\n
      @#{model_name}s = #{name}.all\n
      @#{model_name} = #{name}.new(params[:post])\n
      @#{model_name}.save\n
      respond_with(@#{model_name})\n 
    end\n\n

    def destroy\n
      @#{model_name} = #{name}.find(params[:id])\n
      @#{model_name}.destroy\n
      respond_with(@#{model_name})\n
    end\n\n
    "
    
    
    invoke "active_record:migration", ["add_flag_to_user"]
  end
end