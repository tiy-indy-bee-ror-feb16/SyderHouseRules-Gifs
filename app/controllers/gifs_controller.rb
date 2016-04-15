class GifsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @gifs = Gif.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @gif = Gif.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.new(gif_params)
    @gif.user = current_user
    if @gif.save
      respond_to do |format|
        format.html {
          flash[:success] = "A new gif terrorizes the internet"
          redirect_to :root
        }
        format.js { }
      end
    else
      flash[:danger] = "Invalid, try again"
      render :new
    end
  end

  def destroy
    gif = Gif.find(params[:id])
    gif.destroy if gif.user == current_user
    respond_to do |format|
      format.html {
        flash[:success] = "Gif successfully deleted"
        redirect_to :root
      }
      format.js { }
    end
  end

  private

  def gif_params
    params.require(:gif).permit(:url, :description)
  end

end
