# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find(1)

if user
  Project.create(title: 'Project 1', body: 'This is the first project', user: user)
  Project.create(title: 'Project 2', body: 'This is the second project', user: user)
  Project.create(title: 'Project 3', body: 'This is the third project', user: user)
  Project.create(title: 'Project 4', body: 'This is the fourth project', user: user)
  Project.create(title: 'Project 5', body: 'This is the fifth project', user: user)
  Project.create(title: 'Project 6', body: 'This is the sixth project', user: user)
  Project.create(title: 'Project 7', body: 'This is the seventh project', user: user)

  projects = user.projects

  projects.each do |project|
    3.times do |i|
      Task.create(title: "Task #{i + 1} for #{project.title}", body: "This is task #{i + 1} for #{project.title}", project: project)
    end
  end

  tasks = Task.joins(:project).where(projects: { user_id: user.id })

  tasks.each do |task|
    Timer.create(started_at: Time.now, stoped_at: Time.now + 1, total_time: rand(3600), task_id: task.id)
  end
else
  puts 'User not found'
end
