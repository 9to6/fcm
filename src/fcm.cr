require "./fcm/*"
require "json"
require "http/client"

module Fcm
  class Fcm
    getter base_uri : String = "https://fcm.googleapis.com/fcm"
    getter timeout : Int32 = 30

    def initialize(@api_key : String, @options = {} of String => String)
    end

    def send(registration_ids : Array(String), options = {} of Symbol => String)
      post_body = build_post_body(registration_ids, options)
      
      response = HTTP::Client.post(
        @base_uri + "/send",
        headers: HTTP::Headers {"Authorzation" => "key=#{@api_key}", "Content-Type" => "application/json" },
        body: post_body.to_json
      )
    end

    def build_post_body(registration_ids : Array(String), options = {} of Symbol => String)
      { registration_ids: registered_ids }.to_h.merge(options)
    end

    def send_with_notification_key(notification_key : String, options = {} of Symbol => String)
      body = { to: notification_key }.to_h.merge(options)

      response = HTTP::Client.post(
        @base_uri,
        headers: HTTP::Headers {"Authorzation" => "key=#{@api_key}", "Content-Type" => "application/json" },
        body: body.to_json
      )
    end

    def send_to_topic(topic, options = {} of Symbol => String)
      send_with_notification_key("/topics/" + topic, options)
    end

  end
end
