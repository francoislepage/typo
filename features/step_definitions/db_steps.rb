require 'ruby-debug'

Given /the following users exists/ do |users_table|
	users_table.hashes.each do |user|
		User.create!(user)
	end
end

Given /the following articles exists/ do |articles_table|
 	articles_table.hashes.each do |article|
 		Article.create!(article)
 	end
 end