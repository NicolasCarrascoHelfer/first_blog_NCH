puts "Seeding database"
load(Rails.root.join("db", "seeds", "#{Rails.env.downcase}.rb"))
