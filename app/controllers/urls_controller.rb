class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  # GET /urls
  # GET /urls.json
  def index
    # @urls = Url.all
    @user = User.find(params[:user_id])
    @urls = @user.urls
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
  end

  # GET /urls/new
  def new
    @url = Url.new
    @user = User.find(params[:user_id])
  end

  # GET /urls/1/edit
  def edit
    @user = User.find(params[:user_id])
  end

  # POST /urls
  # POST /urls.json
  def create
    @user = User.find(params[:user_id])
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        @url.capture
        format.html { redirect_to user_urls_url(@user), notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    @user = User.find(params[:user_id])

    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to user_urls_url(@user), notice: 'Url was successfully updated.' }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @user = User.find(params[:user_id])
    @url = Url.find(params[:id])
    puts @url.id

    @url.destroy
    respond_to do |format|
      format.html { redirect_to user_urls_url(@user), notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:name, :url, :user_id)
    end
end
