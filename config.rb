def connect_to_db(mode)
  ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :encoding =>  'utf8',
    :database => 'db/heroku.sqlite'
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
