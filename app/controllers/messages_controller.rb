class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_user!, :only => "reply", :raise => false

  def homepage
    reply
  end

  def reply
    #grabs the params that come from a twilio request,
    #...so we instantiate body and from.
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    sms = @client.messages.create(
      from: ENV['twilio_number'],
      to: "5713319546",
      body: "Hello there, thanks for texting me. Your number is #{from_number}."
      )
      #twilio expects a HTTP response to this request
      @client.messages.list.each do |message|
        puts message.inspect
      end
  end

  private
#created a private method that instantiates the twilio
#..client to prepare a sms text back to user.
  def boot_twilio
    @client = Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_token']
  end
end
