class Account < ActiveRecord::Base
# attr_accessible :login
 has_many :backups
 validates(:login, presence: true)
end
