dbconfig = YAML.load(File.read('config/database.yml'))
# ActiveRecord::Base.establish_connection dbconfig["production"]
ActiveRecord::Base.establish_connection dbconfig["development"]
