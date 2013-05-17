class PropertiesController < ApplicationController
  # GET /properties
  # GET /properties.json
  def index
    @property = Property.new  #for custom search
    @properties = Property.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @properties }
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = Property.find(params[:id])
    #find close properties, and reject the first one(it will always be itself, no need to redundant)
    @properties = Property.search_by_rooms(@property).near(@property, 20, :order => :distance)[1..-1]
    @google_maps = "http://maps.googleapis.com/maps/api/staticmap?center=#{@property.latitude},#{@property.longitude}&markers=color:red%7Clabel:*%7C#{@property.latitude},#{@property.longitude}&zoom=11&size=600x400&sensor=false"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property }
    end
  end

  # GET /properties/new
  # GET /properties/new.json
  def new
    @property = Property.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @property }
    end
  end

  # GET /properties/1/edit
  def edit
    @property = Property.find(params[:id])
  end

  # POST search method
  def search_property
    @property = Property.new(params[:property])
    location = Geocoder.coordinates(@property.name)
    @property.latitude = location[0]
    @property.longitude = location[1]
    if !(@property.name.empty? || @property.bedroom.nil?)
      #find all the properties got more than the requesst bedrooms(and order them), then order by distance
      @properties = Property.search_by_rooms(@property).near(@property, 20, :order => :distance)
    else
      redirect_to properties_path, :notice => "Must fill both location/area, and a minimum benroom number !"
    end
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(params[:property])

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render json: @property, status: :created, location: @property }
      else
        format.html { render action: "new" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /properties/1
  # PUT /properties/1.json
  def update
    @property = Property.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(params[:property])
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end
end
