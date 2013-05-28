require 'rubygems'
require 'twilio-ruby' # Download twilio-ruby from twilio.com/docs/libraries
require 'csv'

# Get your Account Sid and Auth Token from twilio.com/user/account 
account_sid = 'AC03d7956957b22447fcf55c95301eca13'
auth_token = 'YOUR-TWILIO-AUTH-TOKEN'
@client = Twilio::REST::Client.new account_sid, auth_token

CSV.open("C:/ACL DATA/ACL-on-call-employee-testing/source-data/call-results.csv", "w", {:force_quotes=>true}) do |csv|
  csv << ["sid", "date_created", "to", "from", "status", "start_time", "end_time", "duration", "direction", "answered_by"]
  @client.account.calls.list.each do |call|
    csv << [call.sid, call.date_created, call.to, call.from, call.status, call.start_time, call.end_time, call.duration, call.direction, call.answered_by]
  end  
end

