class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordInvalid, with: :invalid_response

private
  def invalid_response(invalid)
  render json: { errors: invalid.record.errors.full_messages }, status: 422
  end
end
