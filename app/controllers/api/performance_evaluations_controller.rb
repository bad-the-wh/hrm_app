class Api::PerformanceEvaluationsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_evaluation, only: [:show, :update, :destroy]
  
    def index
      @evaluations = PerformanceEvaluation.all
      render json: @evaluations
    end
  
    def show
      render json: @evaluation
    end
  
    def create
      @evaluation = PerformanceEvaluation.new(evaluation_params)
  
      if @evaluation.save
        render json: @evaluation, status: :created
      else
        render json: @evaluation.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @evaluation.update(evaluation_params)
        render json: @evaluation
      else
        render json: @evaluation.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @evaluation.destroy
      head :no_content
    end
  
    private
  
    def set_evaluation
      @evaluation = PerformanceEvaluation.find(params[:id])
    end
  
    def evaluation_params
      params.require(:performance_evaluation).permit(:employee_id, :score, :feedback)
    end
  end
  