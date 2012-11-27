class FlyersController < ApplicationController

  before_filter :authenticate_user!, except: [ :index, :show ]

  def index
    respond_to do |format|
      format.html { @flyers = Flyer.all }
      format.atom { @flyers = Flyer.order("updated_at desc").limit(10) }
    end
  end

  def show
    @flyer = Flyer.find(params[:id])
  end

  def new
    @flyer = Flyer.new
  end

  def edit
    @flyer = Flyer.find(params[:id])
  end

  def create
    @flyer = Flyer.new(params[:flyer])

    if @flyer.save
      redirect_to @flyer, notice: 'Successfully created flyer.'
    else
      render action: "new"
    end
  end

  def update
    @flyer = Flyer.find(params[:id])

    if @flyer.update_attributes(params[:flyer])
      redirect_to @flyer, notice: 'Successfully updated flyer.'
    else
      render action: "edit"
    end
  end
end
