
class AdminController < ApplicationController
skip_before_action :authorize 
  def index
  	user = User.find_by(name: params[:name])
    
    
  
  end
end
