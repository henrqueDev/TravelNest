class PixKeysController < ApplicationController
    before_action :set_pix_key, only: [:show, :edit, :update, :destroy]
  
    # GET /pix_keys
    def index
      @pix_keys = PixKey.all
    end
  
    # GET /pix_keys/1
    def show
    end
  
    # GET /pix_keys/new
    def new
      @hotel = Hotel.find(params[:hotel_id])
      @pix_key = PixKey.new
    end
  
    # POST /pix_keys
    def create
      @pix_key = PixKey.new(pix_key_params)
      
      if @pix_key.save
        redirect_to @pix_key, notice: 'Pix key was successfully created.'
      else
        render :new
      end
    end
  
    # GET /pix_keys/1/edit
    def edit
    end
  
    # PATCH/PUT /pix_keys/1
    def update
      if @pix_key.update(pix_key_params)
        redirect_to @pix_key, notice: 'Pix key was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /pix_keys/1
    def destroy
      @pix_key.destroy
      redirect_to pix_keys_url, notice: 'Pix key was successfully destroyed.'
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_pix_key
      @pix_key = PixKey.find(params[:id])
    end
  
    # Only allow a trusted parameter "whitelist" through.
    def pix_key_params
      params.require(:pix_key).permit(:key, :hotel_id)
    end
  end
  