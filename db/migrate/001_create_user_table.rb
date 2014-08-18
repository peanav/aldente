Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String      :password_hash,  :size => 80, :null => false
      String      :email,          :size => 80, :null => false
      String      :first_name,     :size => 40, :null => true
      String      :last_name,      :size => 40, :null => true
    end

    User.new(
      first_name: 'Paul',
      last_name: 'Navasard',
      email: 'pnavasard@gmail.com',
      password: 'test'
    ).save
  end

  down do
    drop_table(:users)
  end
end
