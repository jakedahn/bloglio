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

#from http://www.sinatrarb.com/book.html
def partial(template, *args)
  options = args.extract_options!
  options.merge!(:layout => false)
  if collection = options.delete(:collection) then
    collection.inject([]) do |buffer, member|
      buffer << haml(template, options.merge(
                                :layout => false, 
                                :locals => {template.to_sym => member}
                              )
                   )
    end.join("\n")
  else
    haml(template, options)
  end
end
