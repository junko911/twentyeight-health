class PatientsController < ApplicationController
  
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)

    if @patient.save
      url = URI("https://challenge-28h.herokuapp.com/doctors/assign")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = "application/json"
      request.body = {
        name: @patient.name,
        email: @patient.email,
        date_of_birth: @patient.date_of_birth,
        state: @patient.state.abbreviation
      }.to_json

      response = https.request(request)
      details = JSON.parse(response.read_body)["details"]
      @patient.update(doctor: details["doctor"], token: details["token"])

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
