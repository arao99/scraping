require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection(
  :adapter  => 'mysql2',
  :database => 'scraping_sample',
  :host     => 'localhost',
  :username => 'root',
  :password => ''
)

ActiveRecord::Base.logger = Logger.new(STDERR)

Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local
