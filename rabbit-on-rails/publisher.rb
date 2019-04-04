#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new(:host => "192.168.99.100", :port => 5672, :user => "guest", :password => "guest")
connection.start

channel = connection.create_channel
queue = channel.queue('hello')

STDERR.puts "sdfs_df"

begin
  channel.default_exchange.publish('Hello World!', routing_key: queue.name)
  STDERR.puts " [x] Sent 'Hello World!'"
rescue
  STDERR.puts "for fuck's sake 2"

  connection.close

  exit(0)
end