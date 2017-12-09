class FizzBuzz
  class << self
    def calculate(*args)
      new(*args).tap do |fizz_buzz|
        return unless fizz_buzz.valid?
      end.calculate
    end

    def calculate!(*args)
      new(*args).tap do |fizz_buzz|
        raise ArgumentError.new("引数の値が不正です") unless fizz_buzz.valid?
      end.calculate
    end
  end

  def initialize(number , fizz: 3 , buzz: 5)
    @number = number
    @fizz = fizz
    @buzz = buzz
  end

  def valid?
    return false if @number.nil?
    return false unless @number.kind_of?(Numeric)
    return false if @fizz.zero?
    return false if @buzz.zero?
    true
  end

  def calculate
    return 'Fizz Buzz' if fizz_buzz?
    return 'Fizz' if fizz?
    return 'Buzz' if buzz?
    @number.to_s
  end

  private

  def fizz?
    @number.to_i.nonzero? && (@number.to_i % @fizz == 0)
  end

  def buzz?
    @number.to_i.nonzero? && (@number.to_i % @buzz == 0)
  end

  def fizz_buzz?
    fizz? && buzz?
  end
end

def fizz_buzz(*args)
  FizzBuzz.calculate(*args)
end

def fizz_buzz!(*args)
  FizzBuzz.calculate!(*args)
end
