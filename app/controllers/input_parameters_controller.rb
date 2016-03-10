class InputParametersController < ApplicationController
  before_action :set_algorithm, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_input_parameter, only: [:edit, :update, :destroy]
  respond_to :html

  def new
    @input_parameter = @algorithm.input_parameters.new
  end

  def edit
  end

  def create

  end

  def update
    if @input_parameter.update(input_parameter_params)
      redirect_to algorithm_path(@algorithm)
    else
      render :edit
    end
  end

  def destroy
    @input_parameter.destroy
    redirect_to algorithm_path(@algorithm)
  end

  private

  def set_algorithm
    @algorithm = current_user.algorithms.find(params[:algorithm_id])
  end

  def set_input_parameter
    @input_parameter = current_user.algorithms.find(params[:algorithm_id]).input_parameters.find(params[:id])
  end

  def input_parameter_params
    params.require(:input_parameter).permit!
  end

end