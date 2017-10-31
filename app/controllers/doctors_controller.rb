class DoctorsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :destroy, :edit, :update, :list_male, :list_female]

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      flash[:notice] = 'Profile added successfully!'
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
      flash[:notice] = 'Profile updated successfully!'
      redirect_to doctors_path
    else
      render :edit
    end
  end

  def destroy
    Doctor.destroy(params[:id])
    redirect_to doctors_path
  end

  def list_male
    @doctors = Doctor.where(gender: 'male')
  end

  def list_female
    @doctors = Doctor.where(gender: 'female')
  end

  private

    def prepare_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:username, :address, :gender)
    end

end
