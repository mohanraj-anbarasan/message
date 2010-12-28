class ApplicationController < ActionController::Base
  protect_from_forgery



def force_login          
       redirect_to :controller => 'sessions', :action => 'new' unless logged_in?
 end





end
