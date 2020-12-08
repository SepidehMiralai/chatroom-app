require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "#validations" do
    it 'should validate the presence of title ' do
      room = FactoryBot.create :room
      expect(room).to be_valid
      room.title = ''
      expect(room).not_to be_valid
      expect(room.errors.messages[:title]).to include("can't be blank")

    end
  end
end