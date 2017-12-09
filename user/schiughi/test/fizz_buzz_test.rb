require 'minitest/autorun'
require '../lib/fizz_buzz'

class FizzBuzzTest < Minitest::Test
  # 入力された整数が3の倍数だった場合、"Fizz"を出力する
  def test_fizz_case
    assert_equal "Fizz", fizz_buzz(3)
    assert_equal "Fizz", fizz_buzz(6)
  end

  # 入力された整数が5の倍数だった場合、"Buzz"を出力する
  def test_buzz_case
    assert_equal "Buzz", fizz_buzz(5)
    assert_equal "Buzz", fizz_buzz(10)
  end

  # 入力された整数が15の倍数だった場合、"FizzBuzz"を出力する
  def test_fizz_buzz_case
    assert_equal "Fizz Buzz", fizz_buzz(15)
    assert_equal "Fizz Buzz", fizz_buzz(30)
  end

  # 入力された整数がそれ以外だった場合、入力された整数を文字列に変換して出力する
  def test_other_case
    assert_equal "0",  fizz_buzz(0)
    assert_equal "14", fizz_buzz(14)
  end

  # 入力された値が小数の場合、小数点以下を切り捨て処理する
  def test_decimal_case
    assert_equal "Fizz",      fizz_buzz(3.14)
    assert_equal "Fizz Buzz", fizz_buzz(105.99)
  end

  # 入力された値が文字列の場合、nilを返却する
  def test_text_case
    assert_nil fizz_buzz("312")
    assert_nil fizz_buzz("10000aaa")
  end

  # 入力された値がnilの場合、nilを返却する
  def test_nil_case
    assert_nil fizz_buzz(nil)
  end

  # fizzの値を変更した場合、変更した値の倍数のときに"Fizz"を出力する
  def test_custom_fizz_case
    assert_equal "Fizz", fizz_buzz(7, fizz: 7)
    assert_equal "3",    fizz_buzz(3, fizz: 7)
  end

  # buzzの値を変更した場合、変更した値の倍数のときに"Buzz"を出力する
  def test_custom_buzz_case
    assert_equal "Buzz", fizz_buzz(4, buzz: 4)
    assert_equal "5",    fizz_buzz(5, buzz: 4)
  end

  # fizz,buzzの値を変更した場合、変更した値の公倍数のときに"Fizz Buzz"を出力する
  def test_custom_fizz_buzz_case
    assert_equal "Fizz Buzz", fizz_buzz(28, fizz: 7, buzz: 4)
    assert_equal "30",        fizz_buzz(30, fizz: 7, buzz: 4)
  end

  # fizz,buzzの値を0に変更した場合、nilを返却する
  def test_custom_fizz_buzz_to_zero_case
    assert_nil fizz_buzz(28, fizz: 0)
    assert_nil fizz_buzz(30, buzz: 0)
  end

  # fizz,buzzの値をnilに変更した場合、nilを返却する
  def test_custom_fizz_buzz_to_nil_case
    assert_nil fizz_buzz(28, fizz: nil)
    assert_nil fizz_buzz(30, buzz: nil)
  end

  # 入力された値が文字列の場合、例外を投げる
  def test_strict_text_case
    assert_raises ArgumentError do
      fizz_buzz!("312")
    end
    assert_raises ArgumentError do
      fizz_buzz!("10000aaa")
    end
  end

  # 入力された値がnilの場合、例外を投げる
  def test_strict_nil_case
    assert_raises ArgumentError do
      fizz_buzz!(nil)
    end
  end

  # fizz,buzzの値を0に変更した場合、例外を投げる
  def test_strict_custom_fizz_to_zero_case
    assert_raises ArgumentError do
      fizz_buzz!(28, fizz: 0)
    end
    assert_raises ArgumentError do
      fizz_buzz!(30, buzz: 0)
    end
  end

  # fizz,buzzの値をnilに変更した場合、例外を投げる
  def test_strict_custom_buzz_to_nil_case
    assert_raises ArgumentError do
      fizz_buzz!(28, fizz: nil)
    end
    assert_raises ArgumentError do
      fizz_buzz!(30, buzz: nil)
    end
  end
end
