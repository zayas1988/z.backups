class Backup < ActiveRecord::Base
#  attr_accessible :path
  belongs_to :account
  validates(:path, presence: true)
end
