class LinksController < ApplicationController
  before_action :set_link, only: [:destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
    if params[:short_url]
      @link = Link.find_by(short_url: params[:short_url])
      if @link
        if redirect_to @link.full_url
          @link.clicks += 1
          @link.save
        end
      else
        redirect_to root_path
      end

    else
      @link = Link.find(params[:id])
    end
  end

  # GET /links/new
  def new
    @link = Link.new
    render :layout => 'application'
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to root_path, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:full_url, :short_url, :clicks)
    end
end
