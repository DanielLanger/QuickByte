class RenameBusinessSchoolsToBusinessesSchools < ActiveRecord::Migration
  def up
    rename_table :business_schools, :businesses_schools
  end

  def down
  end
end
