require 'spec_helper'

describe FlyersController do
  let(:flyer) { FactoryGirl.create(:flyer) }

  describe '#index' do
    context 'html format' do
      before :each do
        get :index
      end

      it { should render_template(:index) }
    end

    context 'atom format' do
      before :each do
        get :index, format: :atom
      end

      it { should respond_with_content_type(:atom) }
    end
  end

  describe '#show' do
    before :each do
      get :show, id: flyer.id
    end

    it { should render_template(:show) }
    it { should assign_to(:flyer) }
  end

  describe '#new' do
    context 'logged in' do
      before :each do
        login_user
        get :new
      end

      it { should render_template(:new) }
    end

    context 'not logged in' do
      before :each do
        get :new
      end

      it { should redirect_to(:new_user_session) }
    end
  end

  describe '#create' do
    context 'logged in' do
      before :each do
        login_user
      end
      
      context 'valid attributes' do
        it "persists a flyer" do
          expect {
            post :create, flyer: FactoryGirl.attributes_for(:flyer)
          }.to change(Flyer, :count).by(1)
        end

        it "redirects to flyers#show" do
          post :create, flyer: FactoryGirl.attributes_for(:flyer)
          expect(response).to redirect_to flyer_path(assigns[:flyer])
        end
      end

      context 'invalid attributes' do
        it "does not persist" do
          expect {
            post :create, flyer: {}
          }.to_not change(Flyer, :count)
        end

        it {
          post :create, flyer: {}
          should render_template(:new)
        }
      end
    end

    context 'not logged in' do
      before :each do
        post :create, flyer: FactoryGirl.attributes_for(:flyer)
      end

      it { should redirect_to(:new_user_session) }
    end
  end

  describe '#edit' do
    context 'logged in' do
      before :each do
        login_user
        get :edit, id: flyer.id
      end

      it { should render_template(:edit) }
    end

    context 'not logged in' do
      before :each do
        get :edit, id: flyer.id
      end

      it { should redirect_to(:new_user_session) }
    end
  end

  describe '#update' do
    context 'logged in' do
      before :each do
        login_user
      end

      context 'valid attributes' do
        before :each do
          put :update, flyer: { notes: 'Good stuff!'}, id: flyer.id
        end

        it "updates the flyer" do
          flyer.reload
          expect(flyer.notes).to eq 'Good stuff!'
        end

        it {
          should redirect_to flyer
        }
      end

      context 'invalid attributes' do
        before :each do
          put :update, flyer: { happened_on: nil }, id: flyer.id
        end 

        it { should render_template :edit }
      end
    end

    context 'not logged in' do
      before :each do
        put :update, flyer: {}, id: flyer.id
      end

      it { should redirect_to(:new_user_session) }
    end
  end
end
