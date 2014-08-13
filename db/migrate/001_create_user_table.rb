Sequel.migration do
  up do
    create_table(:users) do
      String      :id,             :size => 36, :primary_key => true
      String      :password_hash,  :size => 80, :null => false
      String      :email,          :size => 80, :null => false
      String      :first_name,     :size => 40, :null => true
      String      :last_name,      :size => 40, :null => true
      String      :gravatar_email, :size => 80, :null => true
    end
  end

  down do
    drop_table(:users)
  end
end
