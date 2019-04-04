#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new(:host => "rabbitmq", :port => 5672, :user => "guest", :password => "guest")
connection.start

channel = connection.create_channel
queue = channel.queue('hello')

STDERR.puts "IT HAS BEGUN"

begin
  STDERR.puts ' [*] Waiting for messages. To exit press CTRL+C'
  # block: true is only used to keep the main thread
  # alive. Please avoid using it in real world applications.
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    STDERR.puts " [x] Received #{body}"
    channel.default_exchange.publish('Hello World!', routing_key: queue.name)
    STDERR.puts " [x] Sent 'Hello World!'"
  end
rescue Interrupt => _
  STDERR.puts "for fuck's sake #{_.message}"

  connection.close

  exit(0)
end