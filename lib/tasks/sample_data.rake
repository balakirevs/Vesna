namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Alexander",
                         surname: "Balakirev",
                         middle_name: "Vladimirovich",
                         date_of_birth: "23.01.1982",
                         city: "Kyiv",
                         phone: "222-22-22",
                         gender: "M", 
                         email: "example@example.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
  end
end