# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = 209896
Pusher.key = "eae6d0b8b19ae4a8e988"
Pusher.secret =  "72fa013f769cb9b75b91"
Pusher.logger = Rails.logger
Pusher.encrypted = true



#Pusher.app_id = '209896'
#Pusher.key = 'eae6d0b8b19ae4a8e988'
#Pusher.secret = '72fa013f769cb9b75b91'
