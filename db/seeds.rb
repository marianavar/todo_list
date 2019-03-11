20.times do
  task = Task.new(
    description:  Faker::ChuckNorris.fact,
    completed:    [true, false].sample,
    due_date:     Faker::Date.between(3.months.ago, 3.months.from_now)
  )
  task.due_date = nil if [true, false].sample
  task.save
end

puts "#{Task.count} tasks in the system..."
