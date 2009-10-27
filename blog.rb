require 'rubygems'
require 'sinatra'
require 'active_record'
require 'bluecloth'
require 'sass'
load 'config.rb'
load 'models.rb'

load 'util/flash.rb'
load 'util/helpers.rb'
load 'util/sessions.rb'
load 'util/util.rb'

module JakeBlog
  class App < Sinatra::Default
    set :sessions, true
    set :run, false
    
    before do
      
      @flash = get_flash.nil? ? "" : "<span class='flash'>#{get_flash}</span>"
      
      @is_admin = session["logged_in"]
    end
    
    get '/style.css' do
      content_type 'text/css'
      sass :style
    end
    
    get '/' do
      @entries = Entry.all(:limit => 3, :order => 'created_at DESC')
      @title = "Jake Dahn's corner of the web."
      haml :index
    end
    
    get '/add' do secure
      @title = "Add entry."
      haml :post_add
    end
    
    post '/add' do secure
      entry = Entry.new

      entry.title = params[:title]
      entry.body  = params[:body]  

      entry.save

      set_flash 'New post created'
      redirect '/'
    end
    
    get '/edit/:id' do secure
      @entry = Entry.find(params[:id])
      @title = "Edit entry."
      
      haml :post_edit
    end
    
    post '/edit/:id' do secure
      entry = Entry.find(params[:id])
      entry.title = params[:title]
      entry.body = params[:body]
      entry.save
      set_flash 'Entry updated'
      redirect '/blog'
    end
    
    get '/delete/:id' do secure
      Entry.delete(params[:id])
      set_flash 'Entry was deleted'
      redirect '/'
    end

    get '/entries/:id' do
      @entry = Entry.find(params[:id])  
      @title = Entry.find(params[:id]).title
      
      haml :post_view
    end
    
    post '/entries/:id/add_comment' do
      entry = Entry.find(params[:id])
      entry.comments.create(params[:comment])
      set_flash 'Comment added'
      redirect '/entries/' + params[:id]
    end
    
    get '/login' do
      @title = "Login."
      haml :login
    end

    post '/login' do
      if authenticate(params["password"])
        redirect '/entries/add'
      else
        'Are you really trying to login?'
      end
    end

    get '/logout' do
      logout
      redirect '/'
    end
    
    get '/manage' do
      @entries = Entry.all(:order => 'created_at DESC')
      @title = "Manage entries."
      haml :manage
    end    
    




  end
end

