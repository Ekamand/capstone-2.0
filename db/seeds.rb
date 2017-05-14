# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	10.times do
	# @post = Post.create(user_id:"1", title:"post Title", ingredients:"Lorem Ipsum", directions:"lorem Ipsum", post_text:"Lorem Ipsum")
	@image = Image.create(img_url:"http://www.rd.com/wp-content/uploads/sites/2/2016/04/02-home-remedies-green-tea.jpg", post_id:"2")
end
