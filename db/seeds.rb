# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  name: "aaa",
  email: "a@a",
  password: "000000"
)
User.create!(
  name: "abc",
  email: "a@a",
  password: "000000"
)
Genre.create!(
  name: "自己啓発書"
)
Genre.create!(
  name: "エッセイ"
)
Genre.create!(
  name: "小説"
)
Genre.create!(
  name: "雑誌"
)