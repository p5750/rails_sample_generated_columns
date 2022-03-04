class Demo2
  # 計算に使われるカラムを更新してみる

  def call
    virtual_schedule = VirtualSchedule.find_by(start_month: 2, start_day: 26)

    pp virtual_schedule

    pp virtual_schedule.starts_at = Time.now

    pp virtual_schedule # Rails上では generated column は更新されていない

    virtual_schedule.save!

    pp virtual_schedule # Rails上では generated column は更新されていない

    virtual_schedule.reload

    pp virtual_schedule # generated column が更新されている
  end
end
