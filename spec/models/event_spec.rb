require 'rails_helper'

RSpec.describe Event, type: :model do
  current_user = User.first_or_create!(name: 'gia', email: 'gia@gmail.com', password: 'password',
                                       password_confirmation: 'password')
  it 'has title' do
    event = Event.new(
      title: '',
      description: 'A valid description',
      creator: current_user
    )
    expect(event).to_not be_valid
    event.title = 'A valid title'
    expect(event).to be_valid
  end

  it 'has description' do
    event = Event.new(
      title: 'A valid title',
      description: '',
      creator: current_user
    )
    expect(event).to_not be_valid
    event.description = 'A valid description'
    expect(event).to be_valid
  end

  it 'has a title at least 2 chars long' do
    event = Event.new(
      title: 'a',
      description: 'A valid description',
      creator: current_user
    )
    expect(event).to_not be_valid
    event.title = 'ab'
    expect(event).to be_valid
  end

  it 'has description between 5 and 100 chars' do
    event = Event.new(
      title: 'A Valid title',
      description: 'hi',
      creator: current_user
    )
    expect(event).to_not be_valid
    event.description = '12345'
    expect(event).to be_valid
  end
end
