# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Like.delete_all
Comment.delete_all
ProgressUpdate.delete_all
UserGoal.delete_all
User.delete_all


User.create(username: "Admin" , full_name: "Admin2" , password: "password")
5.times do
    User.create(username: Faker::Name.name , full_name: Faker::Name.name , city: "Chicago" , programming_language: "Ruby" , password: "password")
end

Goal.create(name: "Eating")
Goal.create(name: "Sleeping")
Goal.create(name: "Coding")
Goal.create(name: "Eating a single carrot")
Goal.create(name: "Yodeling")
Goal.create(name: "Exercising")
Goal.create(name: "Drinking Water")


# 5.times do
#     UserGoal.create(user_id: User.all.shuffle[0].id , goal_id: Goal.all.shuffle[0].id)
# end

# 5.times do
#     ProgressUpdate.create(content: Faker::Lorem.paragraph(2 , false) , user_goal_id: UserGoal.all.shuffle[0].id)
# end



