class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :update_pin, only: [:show]
 
  


  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page])
  end


    def profile
      @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page])
  end

  def show
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page])
  end

  def new
    @pin = current_user.pins.build
    
    

  end

  def edit
  end

  def create
 
    #If it was created already will go to else statement, if first time being created will display 'pin was succ...'



    
   @pin = current_user.pins.build(pin_params)

   
  

    #If it was created already will go to else statement, if first time being created will display 'pin was succ...'
    if @pin.save

      tempNum = 0

      while tempNum < 30

        @check = Check.create

        tempNum = tempNum + 1

      end

      redirect_to @pin, notice: 'Goal was successfully created.'

    else
      render action: 'new'
    end
  end

  def update


    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Goal was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def update_pin
      @pin = Pin.find(params[:id])
    end 

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this Goal" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image, :title, :completed)
    end


end