class CreateUseranswers < ActiveRecord::Migration
  def change
    create_table :useranswers do |t|

      t.belongs_to :users

      t.belongs_to :answers


    end

  end
end
