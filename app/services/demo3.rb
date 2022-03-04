class Demo3
  # パフォーマンス比較

  def call
    # generated columnなし1
    benchmark do
      VirtualSchedule.where("MONTH(starts_at) = ?", rand(1..12))
                     .where("DAYOFMONTH(starts_at) = ?", rand(1..28))
                     .count
    end

    # generated columnなし2
    benchmark do
      starts_at_expression = format(
        "%%-%02<month>d-%02<day>d %%",
        month: rand(1..12),
        day: rand(1..28)
      )
      VirtualSchedule.where("starts_at like ?", starts_at_expression)
                     .count
    end

    # Virtual
    benchmark do
      VirtualSchedule.where(start_month: rand(1..12))
                     .where(start_day: rand(1..28))
                     .count
    end

    # Stored
    benchmark do
      StoredSchedule.where(start_month: rand(1..12))
                    .where(start_day: rand(1..28))
                    .count
    end
  end

  private

  def benchmark
    result = Benchmark.realtime do
      10.times do
        yield
      end
    end
    pp result
  end
end
