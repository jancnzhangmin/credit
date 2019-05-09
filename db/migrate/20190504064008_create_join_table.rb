class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :auths, :usergroups do |t|
      # t.index [:auth_id, :usergroup_id]
      # t.index [:usergroup_id, :auth_id]
    end
  end
end
