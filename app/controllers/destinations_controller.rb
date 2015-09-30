class DestinationsController < ApplicationController
  
  # authorize_resource

  before_action :set_destination, only: [:show, :edit, :update, :destroy]

    # new model called State statecode and name
  
  # GET /destinations
  # GET /destinations.json
  def index
    query = params[:q].presence || "*"
    @destinations = Destination.search(query)
  end
  
  def random
    randomID = Destination.pluck(:id).sample
    until randomID != $previousRandomID
      randomID = Destination.pluck(:id).sample
    end  
    $previousRandomID = randomID
    @destination = Destination.find(randomID)
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
    
    @new_city = @destination.city
    @new_city_array = @new_city.split(" ")
    @new_city = @new_city_array.join('_')
    
    @abbr_state = State.find_by name: @destination.state
  
    @weather_lookup = WeatherLookup.new(@abbr_state.statecode, @new_city)
      
    # @states = %w(HI AK CA OR WA ID UT NV AZ NM CO WY MT ND SD NB KS OK TX LA AR MO IA MN WI IL IN MI OH KY TN MS AL GA FL SC NC VA WV DE MD PA NY NJ CT RI MA VT NH ME DC )
    
    # @states.sort!
    
    # if params[:city] != nil
    #   params[:city].gsub! " ", "_"
    # end
    
    # if params[:city] != nil
    #   response = HTTParty.get("http://api.wunderground.com/api/4600419770d3f8f8/geolookup/conditions/q/#{params[:state]}-#{params[:city]}.json")
    # else 
    #   redirect_to root_path
    # end
    
    # @location = response['location'][:city]
    # @temp_f = response['current_observation']['temp_f']
    # @temp_c = response['current_observation']['temp_c']
    # @weather_icon = response['current_observation']['icon_url']
    # @weather_words = response['current_observation']['weather'] 
    # @forecast_link = response['current_observation']['forecast_url']
    # @real_feel = response['current_observation']['feelslike_f']
  end
  

  # GET /destinations/new
  def new
    if params[:id]
      @suggestion = Suggestion.find(params[:id])
    end  
    @destination = Destination.new
  end

  # GET /destinations/1/edit
  def edit
  end

  # POST /destinations
  # POST /destinations.json
  def create
    @destination = Destination.new(destination_params)

    respond_to do |format|
      if @destination.save
        Destination.reindex
        format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
        format.json { render :show, status: :created, location: @destination }
      else
        format.html { render :new }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destinations/1
  # PATCH/PUT /destinations/1.json
  def update
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
        format.json { render :show, status: :ok, location: @destination }
      else
        format.html { render :edit }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination.destroy
    respond_to do |format|
      format.html { redirect_to destinations_url, notice: 'Destination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_params
      params.require(:destination).permit(:city, :state, :packing_list, :category, :avatar)
    end
end