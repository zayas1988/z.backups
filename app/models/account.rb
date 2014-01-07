class Account < ActiveRecord::Base
 attr_accessible :path
 has_many :backups
end
