class DogsController < ApplicationController
  before_action :set_dog, only: %i[show edit update destroy]

  def index
    @dogs = Dog.order(:id)
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

  def show; end

  def edit; end

  def update
    if @dog.update(params[:dog])
      redirect_to root_path, notice: 'Dog was updated.'
    else
      redirect_to @dog, alert: 'An error has ocurred, please try again.'
    end
  end

  def destroy
    @dog.destroy
    redirect_to root_path, notice: 'Dog was deleted.'
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
