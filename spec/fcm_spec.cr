require "./spec_helper"

URL = "https://fcm.googleapis.com/fcm"

describe Fcm do
  context "fcm" do
    it "works to send message to the fcm" do
      registration_ids = ["42"]
      message = { "to" => ["aa", "bb"] }
      WebMock.stub(:post, URL).
        with(body: { "to": "/topics/dev" }.to_json, headers: {"Content-Type" => "application/json"}).
        to_return(status: 200, body: "body", headers: {"Content-Type" => "application/json"})
      fcm = Fcm::Fcm.new("abcdedadfaseff")
      response = fcm.send_to_topic("dev")
      response.body        #=> ""
      response.status_code #=> 200
      response.status_code.should eq(200)
      response.body.should eq("body")
    end
  end
end
