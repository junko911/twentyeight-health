class PatientsController < ApplicationController
  
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)

    if @patient.save
      redirect_to @patient
    else
      render :new
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  private

  def patient_params
    params.require(:patient).permit!
  end
end
