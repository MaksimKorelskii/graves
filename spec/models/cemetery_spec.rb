# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cemetery, type: :model do
  # without gem 'shoulda-matchers'
  # it 'validates presence of title' do
  #   cemetery = Cemetery.new(description: 'some description')

  #   expect(cemetery.valid?).to be_falsey
  #   expect(cemetery).to_not be_valid
  # end

  it { should belong_to :user }
  it { should have_many(:graves).dependent(:destroy) }

  it { should validate_presence_of :title }
end
