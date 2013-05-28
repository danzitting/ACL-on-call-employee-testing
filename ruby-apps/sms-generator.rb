require 'rubygems'
require 'twilio-ruby'

@numbers = []
File.read("C:/ACL DATA/ACL-on-call-employee-testing/source-data/cleansed_cell_list.txt").each_line do |line|
  @numbers << line.chop
end

@account_sid = 'AC03d7956957b22447fcf55c95301eca13'
@auth_token = '03541e4a38856a8f8720d03130bd76f8'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(@account_sid, @auth_token)

for number in @numbers
  unless number.nil?
    @client.account.sms.messages.create(
      :from => '+16042004445',
      :to => number,
      :body => "This SMS was generated by a script in ACL Analytics version 10!"
    )
  end
end