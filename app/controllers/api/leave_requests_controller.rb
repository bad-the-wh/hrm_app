class Api::LeaveRequestsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_leave_request, only: [:show, :update, :destroy]
  
    def index
      @leave_requests = LeaveRequest.all
      render json: @leave_requests
    end
  
    def show
      render json: @leave_request
    end
  
    def create
      @leave_request = LeaveRequest.new(leave_request_params)
  
      if @leave_request.save
        render json: @leave_request, status: :created
      else
        render json: @leave_request.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @leave_request.update(leave_request_params)
        render json: @leave_request
      else
        render json: @leave_request.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @leave_request.destroy
      head :no_content
    end
  
    private
  
    def set_leave_request
      @leave_request = LeaveRequest.find(params[:id])
    end
  
    def leave_request_params
      params.require(:leave_request).permit(:employee_id, :start_date, :end_date, :reason)
    end
  end
  