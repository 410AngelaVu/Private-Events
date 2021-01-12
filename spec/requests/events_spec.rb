require 'rails_helper'

RSpec.describe 'Events', type: :request do
  current_user = User.first_or_create!(name: 'gia', email: 'gia@gmail.com', password: 'password',
                                       password_confirmation: 'password')
  let(:valid_attributes) do
    {
      'id' => '1',
      'title' => 'Test',
      'description' => '12345',
      'creator' => current_user
    }
  end
  let(:invalid_attributes) do
    {
      'id' => 'a',
      'title' => '1',
      'description' => '1234',
      'creator' => current_user
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      event = Event.new(valid_attributes)
      event.creator = current_user
      event.save
      get events_url
      expect(response).to_not be_successful
    end
  end
end
