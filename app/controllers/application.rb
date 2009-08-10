# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'liquid'
require "#{RAILS_ROOT}/app/drops/sklep_drop.rb"
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '54d82cc1fe208e3bab7a26e314e842d6'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
  
  protected
  
  def self.tab(name, options = {})
    before_filter(options) do |controller|
      controller.instance_variable_set('@current_tab', name)
    end
  end
  
  def self.sub_tab(name, options = {})
    before_filter(options) do |controller|
      controller.instance_variable_set('@current_sub_tab', name)
    end
  end
end
