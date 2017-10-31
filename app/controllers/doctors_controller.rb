class DoctorsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :destroy, :edit, :update]

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path
    else
      render :new
    end
  end

  def show
    prepare_doctor
  end


  def edit
    prepare_doctor
  end

  def update
    prepare_doctor
    if @doctor.update(doctor_params)
      redirect_to doctors_path
    else
      render :edit
    end
  end

  def destroy
    Doctor.destroy(params[:id])
    redirect_to doctors_path
  end

  private

    def prepare_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:username, :address, :gender)
    end

end
