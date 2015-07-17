class CreateUsers < ActiveRecord::Migration
  #there is one method, 'change' that will be called when the migration is run
  def change
    create_table :users do |t|
      #we specify the type of the column and its name
      t.string :email
      t.string :password_digest
      t.string :name
      #since we will use the email to authenticate against, it must be unique
      #this sets up a constraint that the database will enforce. If you attempt to insert
      #a user into the db with the same email as another, the insert will fail
      t.index(:email, unique: true)

      #if you specify timestamps this will create two additional columns, created_at and
      #updated_at, good for record keeping
      t.timestamps
    end
  end
end