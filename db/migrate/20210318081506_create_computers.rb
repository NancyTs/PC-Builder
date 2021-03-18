class CreateComputers < ActiveRecord::Migration[6.1]
  def change
    create_table :computers do |t|
      t.string :motherboard
      t.string :cpu
      t.string :gpu

      t.timestamps
    end
  end
end
