# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 	10.times do
# 	# @post = Post.create(user_id:"1", title:"post Title", ingredients:"Lorem Ipsum", directions:"lorem Ipsum", post_text:"Lorem Ipsum")
# 	@image = Image.create(img_url:"http://www.rd.com/wp-content/uploads/sites/2/2016/04/02-home-remedies-green-tea.jpg", post_id:"2")
# end

# @user = User.create(
# 	:first_name => "Test",
# 	:last_name => "User",
# 	:email => "test_user@gmail.com",
# 	:photo => "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/User_with_smile.svg/2000px-User_with_smile.svg.png",
# 	:password => "12345",
# 	:password_confirmation => "12345"
# 	)

20.times do
	puts "*" *20
# @post = Post.create!(

# 	:title => Faker::Book.title,
#   :post_text   => Faker::Lorem.paragraph,
#   :ingredients    => Faker::Food.ingredient,
#   :directions        => Faker::Lorem.paragraph,
#   :origin => Faker::Address.country,
#   :user_id => @user.id

# )
@image = Image.create(
	:img_url => Faker::Placeholdit.image,
	:post_id => rand(3..20)
	)
end
