require 'test_helper'

class UserTest < ActiveSupport::TestCase

   test "a user should enter a first name" do
   	user = User.new
   	assert !user.save
   	assert !user.errors[:first_name].empty?
   end

   test "a user should enter a last name" do
   	user = User.new
   	assert !user.save
   	assert !user.errors[:last_name].empty?
   end

   test "a user should enter a profile name" do
   	user = User.new
   	assert !user.save
   	assert !user.errors[:profile_name].empty?
   end

   test "a user should have a unique profile name" do
   	user = User.new
   	user.profile_name = users(:iain).profile_name

   	assert !user.save
   	assert !user.errors[:profile_name].empty?
   end

   test "a user should have a profile name without spaces" do
	 	 user = User.new(first_name: 'Iain', last_name: 'Calder', email: 'iaincalder2@me.com')
	 	 user.password = user.password_confirmation = 'asdfdhgf'
	   
	   user.profile_name = "My Profile Name With Spaces"

	   assert !user.save
	   assert !user.errors[:profile_name].empty?
	   assert user.errors[:profile_name].include?("Must be formatted correctly")
	 end

	 test "user can have a correctly formatted profile name" do
	 		user = User.new(first_name: 'Iain', last_name: 'Calder', email: 'iaincalder2@me.com')
	 		user.password = user.password_confirmation = 'asdfdhgf'

	 		user.profile_name = 'iaincalder_2'
	 		assert user.valid?
	 end
end
