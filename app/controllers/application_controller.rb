class ApplicationController < ActionController::API
  include ActionController::Serialization
  before_filter :parse_request, only: :create

  def parse_request
    @json = JSON.parse(request.body.read)
  end
end
