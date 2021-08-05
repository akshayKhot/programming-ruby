module BM

  def benchmark(caption = "", label_width = nil, format = nil, *labels) # :yield: report
    sync = STDOUT.sync
    STDOUT.sync = true # Flush the output immediately, without buffering
    label_width ||= 0
    label_width += 1
    format ||= FORMAT
    print ' '*label_width + caption unless caption.empty?
    report = Report.new(label_width, format)
    results = yield(report)
    Array === results and results.grep(Tms).each do |t|
      print((labels.shift || t.label || "").ljust(label_width), t.format(format))
    end
  ensure
    STDOUT.sync = sync unless sync.nil?
  end

  def bm(label_width = 0, *labels, &blk) # :yield: report
    benchmark(CAPTION, label_width, FORMAT, *labels, &blk)
  end


  class Report

    attr_reader :list

    def initialize(width = 0, format = nil)
      @width, @format, @list = width, format, []
    end

    def item(label = "", *format, &blk) # :yield:
      print label.to_s.ljust(@width)
      result = BM.measure(label, &blk)
      @list << result
      print result.format(@format, *format)
      result
    end

    alias report item
  end

  class Tms

    CAPTION = "   user    system    total   real\n"

    FORMAT = "%10.6u %10.6y %10.6t %10.6r\n"

  end

  CAPTION = BM::Tms::CAPTION

  FORMAT = BM::Tms::FORMAT

end