def connect_to_db(mode)
  ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :encoding =>  'utf8',
    :database => ENV['DATABASE_URL']
  )
end

def common_config(mode)
  connect_to_db(mode)

  enable :sessions
end

configure :development do  
  common_config(:development)
  set :port, 31337
end

configure :test do
  common_config(:test)
end
ActiveRecord::Base.establish_connection( :username => 'jakedahn', :password => 'batsoup221', :host => 'localhost', :adapter => 'postgresql', :encoding => 'unicode', :database => "blog_development" )