# customdata.rake

namespace :users do
  
  desc "This task helps to create admins"
  task :admin, [:email, :password]
end


def add_Admin(email, password)
  User.create(email: email, password: password, password_confirmation: password, admin: true)
end

