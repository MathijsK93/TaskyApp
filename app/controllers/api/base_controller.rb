class Api::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    
  def record_not_found
    render json: { message: 'Record not found' }
  end
  
  def record_invalid
    render json: { message: 'Record invalid' }
  end  
end
