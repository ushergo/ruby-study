class Event < ApplicationRecord
  belongs_to :category, optional: true #也就是允许 event 没有 category 的情况。
  has_many :attendees # 复数
  has_one :location # 单数

  has_many :event_groupships
  has_many :groups, through: :event_groupships


  # Scope 区块

  #1 设置默认排序
  default_scope -> {order('id DESC')} # unscoped方法可以暂时取消默认的default_scope： Event.unscoped do ... end

  #2 设置可用的查询条件
  scope :open_public, -> {where(:is_public => true)}
  scope :recent_three_days, -> {where(["created_at > ? ", Time.now - 3.days])}

  #3 Scope也可以接受参数
  scope :recent, ->(date) { where("created_at > ?", date) } # Event.recent( Time.now - 7.days )

  #4 Scope也可以接受参数 设置默认值
  def self.recent_default(t=Time.now)
    where(["created_at > ? ", t ])
  end


end
