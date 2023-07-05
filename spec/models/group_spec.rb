require 'rails_helper'

RSpec.describe Group, type: :model do
  @user = User.create(name: 'Tom', email: 'test2@gmail.com', password: 'test123')
  subject { Group.new(author: @user, name: 'test product', icon: 'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg') }

  before { subject.save }
  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name should contan some char' do
    subject.name = '    '
    expect(subject).to_not be_valid
  end

  it 'Icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'Icon should contan some char' do
    subject.icon = '    '
    expect(subject).to_not be_valid
  end
end
