require '/opt/z.backups/config/environment.rb'
Account.each do |account|
    account.makebackup
end

