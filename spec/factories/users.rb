FactoryGirl.define do

	## General
  factory :valid_user, class: User do

  	email "test@test.com"
  	password "password"
  end

  ## email

  factory :long_email, class: User do

  	email "thisisthelongestemailaddressonplanetearthatthismomentandgettinglonger@test.com"
  	password "password"

  end

  factory :null_email, class: User do 

  	email nil
  	password "password"

  end

  factory :user_no_password, class: User do

  	email "test1@test.com"
  	password ""

  end

  factory :confirm_password, class: User do

  	email "test1@test.com"
  	password "password"
  	password_confirmation "passwordd"

  end


  factory :invalid_email, class: User do

  	email "a@a"
  	password "password"

  end

  factory :no_match, class: User do

  	email "abc@gmail.com"
  	password "password"

  end

  factory :long_password, class: User do

  	email "test2@test.com"
  	password "passwordoverthirtycharacterslongtotest"

  end

end
