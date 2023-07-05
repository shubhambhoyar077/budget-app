require 'rails_helper'

RSpec.describe Product, type: :model do
  @user = User.create(name: 'Tom', email: 'test2@gmail.com', password: 'test123')
  subject { Product.new(author: @user, name: 'test product', amount: 20) }

  before { subject.save }
  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name should contan some char' do
    subject.name = '    '
    expect(subject).to_not be_valid
  end

  it 'amount should be greated than zero' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
