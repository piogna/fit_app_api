class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::ImplicitRender
  before_filter :parse_request, only: :create

  def parse_request
    @json = JSON.parse(request.body.read)
  end
end
