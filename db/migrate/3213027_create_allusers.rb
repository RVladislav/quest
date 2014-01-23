class CreateAllusers < ActiveRecord::Migration
  def self.up
    create_table :allusers do |t|
      t.integer :userid #id пользователя
      t.string :fio #ФИО пользователя
    end
  end
  def self.down
    drop_table :allusers
  end  
end