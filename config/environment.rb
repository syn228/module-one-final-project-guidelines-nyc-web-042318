require 'bundler'
require 'rest-client'
require 'json'
require 'pry'
require 'rainbow'
require 'highline/import'
require 'tco'
require 'catpix'
require 'rmagick'


Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = false

require_all 'app'
require_all 'lib'
