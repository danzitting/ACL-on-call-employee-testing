require 'rubygems'
require 'twilio-ruby'

@numbers = []
File.read("C:/ACL DATA/ACL-on-call-employee-testing/source-data/cleansed_cell_list.txt").each_line do |line|
  @numbers << line.chop
end

@account_sid = 'AC03d7956957b22447fcf55c95301eca13'
@auth_token = 'YOUR-TWILIO-AUTH-TOKEN'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(@account_sid, @auth_token)

for number in @numbers
  @account = @client.account
  @call = @account.calls.create({:from => '+16042004445', :to => number, :url => 'http://fathomless-falls-9796.herokuapp.com/hello'})
  puts @call
end