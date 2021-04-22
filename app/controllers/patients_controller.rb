class PatientsController < ApplicationController
  
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)
    redirect_to @patient
  end

  def show
    @patients = Patient.all
  end

  private

  def patient_params
    params.require(:patient).permit!
  end
end
