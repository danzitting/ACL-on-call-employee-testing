ACL Testing for On-Call Employee Responsivness
==============================================

*BUSINESS RISK*
In organizations like hospitals and datacenter hopsting companies, it is critical that on-call staff are available to be reached in emergency patient situations, unexpected equipment downtime events, etc.

*CONTROL*
On-call employees have company-issued cellular phones and are available to answer during scheduled on-call hours.

*TESTING APPROACH*
This project includes an ACL analysis which leverages the new EXECUTE command in ACL Analytics v10 to conduct testing of the responsiveness of those on-call staff. The scripts included in the project will:

- Import a list of on-call employees including cell phone number (import_on_call_employees)
- Send phone calls to each cell phone via Ruby scripts that leverage the Twilio calling service (call_oncall_employees)
- Send SMS messages to each cell phone via Ruby scripts that leverage the Twilio calling service(sms_oncall_employees)
- Import call data on completed/failed calls from the Twilio calling service (import_call_results)
- Analyze the imported data by filtering for failed calls to identify unresponsize employees and export results set to ACL GRC Results Manager for internal sharing and inclusion as evidence in ACL GRC projects (problem_oncall_employees)

*THIRD-PARTY REQUIREMENTS*
The following scripts rely on the noted external dependencies.

NOTE: 3 of the ACL scripts below rely on Ruby scripts. Each of the Ruby scripts is included in the ruby-apps folder of the project. *However, in order to run Ruby applications, your computer must have Ruby installed.* The easiest way to install Ruby on a Windows computer is the RubyInstaller. Complete instructions are available at http://rubyinstaller.org/. 

import_on_call_employees - Requires a spreadsheet of employees and phone numbers in the format of "Example Cell Phone List.xlsx" in the source-data folder
call_oncall_employees - Requires the call-generator.rb Ruby script in the ruby-apps folder, the twilio-ruby Ruby gem installed on your machine, and a current Twilio account (http://www.twilio.com)
sms_oncall_employees - Requires the sms-generator.rb Ruby script in the ruby-apps folder, the twilio-ruby Ruby gem installed on your machine, and a current Twilio account (http://www.twilio.com)
import_call_results - Requires the get-call-results.rb Ruby script in the ruby-apps folder, the twilio-ruby Ruby gem installed on your machine, and a current Twilio account (http://www.twilio.com)
problem_oncall_employees - Requires a valid ACL GRC account where results set may be exported.

Modifications to the scripts may obviously be made to add your own Twilio user credentials, ACL GRC export location, etc. The scripts simply illustrate how to conduct the test.
