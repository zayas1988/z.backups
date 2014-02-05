class Account < ActiveRecord::Base
# attr_accessible :login
 has_many :backups, dependent: :destroy
 validates(:login, presence: true)
  def sync_accounts
    zusers = Array.new
    @pusers = %x(/opt/zimbra/bin/zmprov -l gaa "polad.ru" | sed s/@polad.ru//g)
    @pusers.each_line do |user|
      zusers.push("#{user.chomp}")
    end
    rusers = %x(/opt/zimbra/bin/zmprov -l gaa "nporusprom.ru" | sed s/@nporusprom.ru//g)
    rusers.each_line do |user|
      zusers.push("#{user.chomp}")
    end
    musers = %x(/opt/zimbra/bin/zmprov -l gaa "mx1.local.polad.ru" | sed s/@mx1.local.polad.ru//g)
    musers.each_line do |user|
     zusers.push("#{user.chomp}")
    end
    zusers=zusers.uniq
    puts zusers
    zusers.each do |user|
      if Account.find_by_login("#{user}").nil?
        #p ip
        #free.push(searchip)
        @account = Account.new(:login => "#{user}")
        @account.save
      end
    end
  end
end
