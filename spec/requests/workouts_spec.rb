require "rails_helper"

RSpec.describe "Workouts API", :type => :request do
  it "should send a list of workouts" do
    create_list(:workout, 5)

    get '/api/workouts'

    expect(response).to be_success

    expect(json['workouts'].length).to eq(5)
  end

end
