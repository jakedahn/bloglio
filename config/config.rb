def connect_to_db(mode)
  dbconfig = YAML.load(File.read('config/database.yml'))
  ActiveRecord::Base.establish_connection dbconfig[mode]
  
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
