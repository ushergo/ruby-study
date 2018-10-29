class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title,null:false,comment:'标题',limit:255
      t.string :content,limit:20000,comment:'内容'
      t.integer :user_id,null:false,comment:'用户表外键'

      t.timestamps
    end
  end
end
