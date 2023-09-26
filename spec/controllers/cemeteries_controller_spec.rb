# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CemeteriesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    let(:cemeteries) { create_list :cemetery, 3, user: }

    # it 'Populates an array of all cemeteries' do
    #   cemetery1 = FactoryBot.create(:cemetery, user: user)
    #   cemetery2 = FactoryBot.create(:cemetery, user: user)

    #   get :index

    #   expect(assigns(:cemeteries)).to match_array([cemetery1, cemetery2])
    # end

    before { get :index }

    it 'Populates an array of all cemeteries' do
      expect(assigns(:cemeteries)).to match_array(cemeteries)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { login(user) }

    before { get :new }

    it 'Assigns a new Cemetery to @cemetery' do
      expect(assigns(:cemetery)).to be_a_new(Cemetery)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end
end
