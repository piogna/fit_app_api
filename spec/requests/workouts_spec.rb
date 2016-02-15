require "rails_helper"

RSpec.describe "Workouts API", :type => :request do
  context "#index" do
    before(:each) do
      create_list(:workout, 5)
      get "/api/workouts"
    end
    it "should send a list of workouts" do
      expect(response).to be_success
      expect(json["workouts"].length).to eq(5)
    end

    it "should not contain workout_exercises_attributes" do
      expect(json["workouts"][0]["workout_exercises_attributes"]).to be_nil
    end

    it "should not contain timestamp values" do
      expect(json["workouts"][0]["created_at"]).to be_nil
      expect(json["workouts"][0]["updated_at"]).to be_nil
    end
  end
  context "#show" do
    before(:each) do
      @workout = create(:workout)
      get "/api/workouts/#{@workout.id}"
    end

    it "should return the right workout" do
      expect(json["workout"]["id"]).to eq(@workout.id)
    end

    it "should return a single workout" do
      expect(json.length).to eq(1)
    end

    it "should include workout_exercises_attributes" do
      expect(json["workout"]["workout_exercises_attributes"]).to_not be_nil
    end

    it "should include ex_sets_attributes" do
      expect(json["workout"]["workout_exercises_attributes"][0]["ex_sets_attributes"]).to_not be_nil
    end
  end
  context "#create" do
    describe "with a valid workout" do
      before(:each) do
        @workout = Workout.new(date: Date.today)
        @workout_exercise = WorkoutExercise.new(order: 1, exercise_name: "Some Exercise")
        @ex_set = ExSet.new(weight: 10, reps: 10, order: 1)
        @workout_exercise.ex_sets << @ex_set
        @workout.workout_exercises << @workout_exercise
        serializer = WorkoutSerializer.new(@workout)

        post "/api/workouts", serializer.to_json, format: :json
      end

      it "should return the created workout" do
        expect(json["workout"]).to_not be_nil
      end
    end
  end
end
