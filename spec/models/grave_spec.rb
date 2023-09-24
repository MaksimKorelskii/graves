# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Grave, type: :model do
  it { should belong_to :user }
  it { should belong_to :cemetery }

  it { should validate_presence_of :last_name }
end
