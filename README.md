# rabbitmq-ruby-simple

to start listening to a rabbitmq queue run 
````
docker-compose up
````

to send a message 
1) install ruby
2) go to the rabbit-on-rails folder
3) with docker toolbox run 
````
ruby listener.rb
````
4) with docker desktop change host :host => "192.168.99.100" in publisher.rb to :host => "localhost" and run
````
ruby listener.rb
````
