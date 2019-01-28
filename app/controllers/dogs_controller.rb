class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    dog = Dog.new(dog_params)
    if dog.save
      redirect_to root_path, notice: 'The dog was created sucessfully!'
    else
      redirect_to root_path, alert: 'An error has ocurred, please try again.'
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end
  

  private

  def dog_params
    params.require(:dog).permit(:name, :age)
  end
end
