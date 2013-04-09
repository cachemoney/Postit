class CreateVotes < ActiveRecord::Migration
  def up
  	create_table :votes do |t|
  		t.boolean :vote
  		t.references	:voteable, polymorphic: true

  		t.timestamps
  	end
  end

  def down
  	drop_table :votes
  end
end
