class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_file

      t.timestamps
    end
  end
end
