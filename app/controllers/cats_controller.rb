class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      fail "Cat not found".
      render :index
    end
  end

  def new
    # @cat = Cat.create(params[:cats])
    @cat = Cat.new
    # render :index
  end

  def create
    @cat = Cat.new(params[:cat])
    @cat.save
    redirect_to cat_url(@cat)
  end

end
