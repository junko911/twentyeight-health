class PatientsController < ApplicationController
  
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    @patient.product_ids = params[:product_ids].select(&:present?)
    
    if @patient.save
      DoctorAssigner.call(@patient)

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
