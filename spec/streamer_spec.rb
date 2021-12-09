require './spec/rails_helper.rb'
require './lib/ElevatorMedia/streamer.rb'

RSpec.describe "Streamer" do
    describe "Streamer.rb is functionnal" do
        it "Streamer.rb exist" do
            expect(Pathname.new('./lib/ElevatorMedia/streamer.rb')).to exist
        end
    end
    describe "Method getContent is functionnal" do
        it "getContent exist" do
            expect(ElevatorMedia::Streamer).to respond_to(:getContent)
        end
        it "getContent return a string" do
            expect(ElevatorMedia::Streamer.getContent).is_a? String
        end
    end
end