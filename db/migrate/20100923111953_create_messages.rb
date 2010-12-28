class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
		t.column :message,  :string
		t.column :user_id,  :integer, :limit => 40
		t.column :is_display, :boolean
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
