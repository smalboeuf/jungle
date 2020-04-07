require 'rails_helper'

RSpec.describe User, type: :model do
    
    describe "Validations" do
        before do
            @user = User.new({
                name: "Isabelle Methers",
                email: "test@email.com",
                password: "password",
                password_confirmation: "password"
            })
        end

        it "should have a email, first name and last name" do
            first_and_last_name = @user.name.split(" ")
            expect(first_and_last_name.length).to eq(2)
            expect(@user).to be_valid
        end

        it "should be created with a password and password_confirmation field" do
            #How? User model doesn't have a confirmed password
            @user.password = nil
            expect(@user).to_not be_valid
            @user.password = "password"
            expect(@user).to be_valid

            @user.password_confirmation = ""
            expect(@user).to_not be_valid
            @user.password_confirmation = "password"
            expect(@user).to be_valid

            expect(@user.password).to match(@user.password_confirmation)
        end

        it "should have a password of at least 3 characters" do
            @user.password = nil
            expect(@user).to_not be_valid
            @user.password = "password"
            expect(@user).to be_valid

            expect(@user.password.length).to eq(8)
        end

        it "should have a unique email"  do
           
            @user.email = "TEST@EMAIL.COM"
            userEmail = @user.email.downcase!
            otherUser = User.find_by(email: userEmail )

            expect(otherUser).to be_nil

        end

    
    end

    describe '.authenticate_with_credentials' do
        before do 
            User.create({
                name: "Test Person",
                email: "test@email.com",
                password: "test",
                password_confirmation: "test"
            })
        end

        it "should authenticate a user with correct email and password" do

           @user = User.authenticate_with_credentials("random@emailsdf.com", "something") 
           expect(@user).to be_nil
           @user = User.authenticate_with_credentials("test@email.com", "test")
           expect(@user).to be_valid
           
        end

        it "should authenticate a user if there are extra spaces before and after their email" do
            @user = User.authenticate_with_credentials("   test@email.com   ", "test")
            expect(@user).to be_valid
        end

        it "should authenticate a user if they type their email in all caps" do
            @user = User.authenticate_with_credentials("TEST@EMAIL.COM", "test")
            expect(@user).to be_valid
        end
    end

end