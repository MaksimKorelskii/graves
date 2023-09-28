# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'render index view' do
      get :index

      expect(response).to render_template :index
    end
  end
end
