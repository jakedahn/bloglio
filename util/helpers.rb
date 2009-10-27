require 'rubygems'
require 'haml'

def for_me(text)
  if (@is_admin) then 
    engine = Haml::Engine.new(text)
    return engine.render 
  end
end

def format(text)
  haml text
end

def format_time(time)
  time.strftime("On %m/%d/%Y at %I:%M%p")
end

  
