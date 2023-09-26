# frozen_string_literal: true

class CemeteryDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user
end
