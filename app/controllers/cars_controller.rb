class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :check_if_logged_in
  
  # GET /cars
  # GET /cars.json
  def index
    get_cars
    @cars = Car.all
    @cars = @cars.order(:id)
    car_array = []
    @cars.each do |car|
      car_array << car
    end
    gon.cars = car_array
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @car = Car.find(params[:id])
    gon.car = @car
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
  Car.destroy_all
    base_uri = "https://cndlunarlocator.herokuapp.com/vehicles/"
    ending = "/locate.json"

    i = 0

    until HTTParty.get(base_uri + "#{i}" + ending)["message"] == "Resource not found"
      response = HTTParty.get(base_uri + "#{i}" + ending)
      Car.create :vehicle_id => response["vehicle_id"], :latitude => response["lat"], :longitude => response["long"]
      i +=1
    end

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:latitude, :longitude)
    end

    def check_if_logged_in
      redirect_to root_path unless @current_user.present?
    end

    def get_cars
      base_uri = "https://cndlunarlocator.herokuapp.com/vehicles/"
      ending = "/locate.json"

      i = 0
      arr = []
      while JSON.parse(Curl.get(base_uri + "#{i}" + ending).body_str)["message"] != "Resource not found"
        response = JSON.parse(Curl.get(base_uri + "#{i}" + ending).body_str)
        arr << response
        i +=1
      end

      arr.each_with_index do |car, i|
        vehicle = Car.where(:id => i).first
        if vehicle.present? && vehicle.latitude == car['latitude'] && vehicle.longitude == car['longitude']
          next
        elsif vehicle.present? && (vehicle.latitude != car['latitude'] || vehicle.longitude != car['longitude'])
          vehicle.destroy
          Car.create :id => car["vehicle_id"], :latitude => car["lat"], :longitude => car["long"]
          i+=1
        else
          Car.create :id => car["vehicle_id"], :latitude => car["lat"], :longitude => car["long"]
          i+=1
        end
      end
    end
end
