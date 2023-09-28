# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GravesController, type: :controller do
  describe 'GET #edit' do
    let(:user) { create :user }
    let(:cemetery) { create(:cemetery, user:) }
    let(:grave) { create(:grave, cemetery:, user:) }

    it 'PUT #edit' do
      Expected pending 'No reason given'
      # get :edit, params: { cemetery_id: cemetery.id, id: grave.id }

      # expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    let(:user) { create :user }
    let(:cemetery) { create(:cemetery, user:) }
    let(:graves) { create_list :grave, 3, user:, cemetery: }
    before { login(user) }

    context 'some' do
      before { post :create, params: { cemetery_id: cemetery, grave: attributes_for(:grave) } }

      it 'assigns the requested cemetery to @cemetery' do
        expect(assigns(:cemetery)).to eq cemetery
      end

      it 'assigns new grave for cemetery' do
        expect(assigns(:grave)).to be_a(Grave)
      end
    end

    context 'with valid attributes' do
      it 'redirect to cemetery#show view' do
        post :create, params: { cemetery_id: cemetery, grave: attributes_for(:grave) }
        expect(response).to redirect_to(assigns(:cemetery))
      end

      it 'save new grave in db' do
        expect do
          post :create, params: { cemetery_id: cemetery, grave: attributes_for(:grave) }
        end.to change(Grave, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'assigns the requested graves to @graves' do
        post :create, params: { cemetery_id: cemetery, grave: attributes_for(:grave, :invalid) }
        expect(assigns(:graves)).to match_array(graves)
      end

      it 'render cemeteries/show' do
        post :create, params: { cemetery_id: cemetery, grave: attributes_for(:grave, :invalid) }

        expect(response).to render_template 'cemeteries/show'
      end

      it 'does not save new grave in db' do
        expect do
          post :create, params: { cemetery_id: cemetery, grave: attributes_for(:grave, :invalid) }
        end.to_not change(Grave, :count)
      end
    end
  end
end
