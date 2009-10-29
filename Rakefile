require 'rubygems'
require 'sinatra'

namespace 'db' do
  desc "Create db schema"
  task :create do        
    require 'activerecord'
    require 'config/config.rb'

    ENV.include?("mode") ? connect_to_db(ENV["mode"]) : connect_to_db(:development)
  
    ActiveRecord::Migration.create_table :entries do |t|
      t.string :title
      t.text :body
      t.string :tags

      t.timestamps
    end
  
    ActiveRecord::Migration.create_table :comments do |t|      
      t.string :name
      t.string :email
      t.string :url
      t.text :body
      t.integer :entry_id

      t.timestamps
    end

  end
end