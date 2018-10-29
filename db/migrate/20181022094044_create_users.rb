class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name,null:false,comment:'用户名',limit:255
      t.string :pwd,null:false ,comment:'密码',limit:100
      t.integer :gender,default:0,comment:'0:男，1：女',limit:1
      t.timestamp :birthday,comment:'生日'

      t.timestamps
    end
  end
end
