class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    dog = Dog.new(
      name: params[:dog][:name],
      age: params[:dog][:age]
    )
    if dog.save
      redirect_to root_path, notice: 'The dog was created sucessfully!'
    else
      redirect_to root_path, notice: 'An error has ocurred, please try again.'
    end
  end
end
