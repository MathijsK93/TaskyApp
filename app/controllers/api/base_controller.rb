class Api::BaseController < ApplicationController
  protect_from_forgery :except => [:create, :update, :destroy]  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    
  # before_action :authenticate
  # before_filter :authenticate_user!
  respond_to :json
  
  def record_not_found
    render json: { message: 'Record not found' }
  end
  
  def record_invalid
    render json: { message: 'Record invalid' }
  end 
  
  def unauthorized
    render json: { message: 'Unauthorized request'}
  end
  
  private
  
    def authenticate
      unless params[:token]
        unauthorized
      end
    end
end
