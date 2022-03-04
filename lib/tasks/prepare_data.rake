task :prepare_data => :environment do
  puts "prepare data."

  1_000_000.times do
    name = SecureRandom.hex
    starts_at = Time.now + rand(-10000..10000).days

    StoredSchedule.create! name: name, starts_at: starts_at
    VirtualSchedule.create! name: name, starts_at: starts_at
  end
end
