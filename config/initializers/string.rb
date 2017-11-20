class String 
  def to_range(delimiter = '-', factor=1)
    mn, mx = self.split(delimiter).map(&:to_f).map{|e| (e*factor).round(1) }.sort!
    Range.new(mn, mx)
  end
end