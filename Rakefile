require 'rubygems'
require 'sinatra'

namespace 'db' do
  desc "Create db schema"
  task :create do        
    require 'activerecord'
    require 'config/config.rb'

  
    ActiveRecord::Migration.create_table :entries do |t|
      t.string :title
      t.text :body
      t.string :recording_url

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