class FlyersController < ApplicationController

  before_filter :authenticate_user!, except: [ :index, :show ]

  # GET /flyers
  # GET /flyers.json
  def index
    @flyers = Flyer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flyers }
    end
  end

  # GET /flyers/1
  # GET /flyers/1.json
  def show
    @flyer = Flyer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flyer }
    end
  end

  # GET /flyers/new
  # GET /flyers/new.json
  def new
    @flyer = Flyer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flyer }
    end
  end

  # GET /flyers/1/edit
  def edit
    @flyer = Flyer.find(params[:id])
  end

  # POST /flyers
  # POST /flyers.json
  def create
    @flyer = Flyer.new(params[:flyer])

    if @flyer.save
      redirect_to @flyer, notice: 'Successfully created flyer.'
    else
      render action: "new"
    end
  end

  # PUT /flyers/1
  # PUT /flyers/1.json
  def update
    @flyer = Flyer.find(params[:id])

    if @flyer.update_attributes(params[:flyer])
      redirect_to @flyer, notice: 'Successfully updated flyer.'
    else
      render action: "edit"
    end
  end
end
