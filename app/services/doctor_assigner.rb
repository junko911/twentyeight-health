class DoctorAssigner
  def self.call(patient)
    begin
      url = URI("https://challenge-28h.herokuapp.com/doctors/assign")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = "application/json"
      request.body = {
        name: patient.name,
        email: patient.email,
        date_of_birth: patient.date_of_birth,
        state: patient.state.abbreviation
      }.to_json

      response = https.request(request)
      details = JSON.parse(response.read_body)["details"]
      patient.update(doctor: details["doctor"], token: details["token"])
      
    rescue StandardError => e
      puts e

      false
    end
  end
end
