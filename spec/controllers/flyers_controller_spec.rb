require 'spec_helper'

describe FlyersController do

  def valid_attributes
    { "happened_on" => "2012-11-19" }
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all flyers as @flyers" do
      flyer = Flyer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:flyers).should eq([flyer])
    end
  end

  describe "GET show" do
    it "assigns the requested flyer as @flyer" do
      flyer = Flyer.create! valid_attributes
      get :show, {:id => flyer.to_param}, valid_session
      assigns(:flyer).should eq(flyer)
    end
  end

  describe "GET new" do
    it "assigns a new flyer as @flyer" do
      get :new, {}, valid_session
      assigns(:flyer).should be_a_new(Flyer)
    end
  end

  describe "GET edit" do
    it "assigns the requested flyer as @flyer" do
      flyer = Flyer.create! valid_attributes
      get :edit, {:id => flyer.to_param}, valid_session
      assigns(:flyer).should eq(flyer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Flyer" do
        expect {
          post :create, {:flyer => valid_attributes}, valid_session
        }.to change(Flyer, :count).by(1)
      end

      it "assigns a newly created flyer as @flyer" do
        post :create, {:flyer => valid_attributes}, valid_session
        assigns(:flyer).should be_a(Flyer)
        assigns(:flyer).should be_persisted
      end

      it "redirects to the created flyer" do
        post :create, {:flyer => valid_attributes}, valid_session
        response.should redirect_to(Flyer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved flyer as @flyer" do
        # Trigger the behavior that occurs when invalid params are submitted
        Flyer.any_instance.stub(:save).and_return(false)
        post :create, {:flyer => { "happened_on" => "invalid value" }}, valid_session
        assigns(:flyer).should be_a_new(Flyer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Flyer.any_instance.stub(:save).and_return(false)
        post :create, {:flyer => { "happened_on" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested flyer" do
        flyer = Flyer.create! valid_attributes
        # Assuming there are no other flyers in the database, this
        # specifies that the Flyer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Flyer.any_instance.should_receive(:update_attributes).with({ "happened_on" => "2012-11-19" })
        put :update, {:id => flyer.to_param, :flyer => { "happened_on" => "2012-11-19" }}, valid_session
      end

      it "assigns the requested flyer as @flyer" do
        flyer = Flyer.create! valid_attributes
        put :update, {:id => flyer.to_param, :flyer => valid_attributes}, valid_session
        assigns(:flyer).should eq(flyer)
      end

      it "redirects to the flyer" do
        flyer = Flyer.create! valid_attributes
        put :update, {:id => flyer.to_param, :flyer => valid_attributes}, valid_session
        response.should redirect_to(flyer)
      end
    end

    describe "with invalid params" do
      it "assigns the flyer as @flyer" do
        flyer = Flyer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Flyer.any_instance.stub(:save).and_return(false)
        put :update, {:id => flyer.to_param, :flyer => { "happened_on" => "invalid value" }}, valid_session
        assigns(:flyer).should eq(flyer)
      end

      it "re-renders the 'edit' template" do
        flyer = Flyer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Flyer.any_instance.stub(:save).and_return(false)
        put :update, {:id => flyer.to_param, :flyer => { "happened_on" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested flyer" do
      flyer = Flyer.create! valid_attributes
      expect {
        delete :destroy, {:id => flyer.to_param}, valid_session
      }.to change(Flyer, :count).by(-1)
    end

    it "redirects to the flyers list" do
      flyer = Flyer.create! valid_attributes
      delete :destroy, {:id => flyer.to_param}, valid_session
      response.should redirect_to(flyers_url)
    end
  end

end
