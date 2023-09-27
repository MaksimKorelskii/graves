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

  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'saves a new cemetery in the db' do
        expect { post :create, params: { cemetery: attributes_for(:cemetery) } }.to change(Cemetery, :count).by(1)
      end

      it 'redirect to show views' do
        post :create, params: { cemetery: attributes_for(:cemetery) }
        expect(response).to redirect_to(assigns(:cemetery))
      end
    end

    context 'with invalid attributes' do
      it 'does not save new cemetery in the db' do
        expect { post :create, params: { cemetery: attributes_for(:cemetery, :invalid) } }.to_not change(Cemetery, :count)
      end

      it 'render new views' do
        post :create, params: { cemetery: attributes_for(:cemetery, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    let(:cemetery) { create(:cemetery, user:) }
    let(:graves) { create_list(:grave, 5, user:, cemetery:) }

    before { get :show, params: { id: cemetery } }

    it 'assigns the requested cemetery to @cemetery' do
      expect(assigns(:cemetery)).to eq cemetery
    end

    it 'Assigns a new Grave to @grave' do
      expect(assigns(:grave)).to be_a_new(Grave)
    end

    it 'Populates an array of all graves' do
      expect(assigns(:graves)).to match_array(graves)
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit'do
    let(:cemetery) { create :cemetery, user: }
    before { get :edit, params: { id: cemetery } }

    it 'render edit view' do
      Expected pending 'No reason given'

      # get edit_cemetery_path(cemetery)
      # expect(response).to be_successful # render_template :edit
    end
  end

  describe 'PUT #update' do
    before { login(user) }
    let!(:cemetery) { create :cemetery, user: }

    context 'update with valid attributes' do
      before { put :update, params: { id: cemetery, cemetery: { title: 'Updated title', description: 'New' } } }
      
      it 'change cemetery attributes' do
        cemetery.reload

        expect(cemetery.title).to eq 'Updated title'
        expect(cemetery.description).to eq 'New'
      end

      it 'redirect to cemetery_path' do
        expect(response).to redirect_to(cemetery_path(cemetery))
      end
    end

    context 'update with invalid attributes' do
      it 'does not change cemetery attributes' do
        expect do
          put :update, params: { id: cemetery, cemetery: attributes_for(:cemetery, :invalid) }
        end.to_not change(cemetery, :title)
      end

      it 'render edit view' do
        put :update, params: { id: cemetery, cemetery: attributes_for(:cemetery, :invalid) }

        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }
    let!(:cemetery) { create :cemetery, user: }

    it 'User deletes the cemetery from db' do
      expect { delete :destroy, params: { id: cemetery } }.to change(Cemetery, :count).by(-1)
    end

    it 'redirect to Cemetery #index' do
      delete :destroy, params: { id: cemetery }

      expect(response).to redirect_to(cemeteries_path)
    end
  end
end
