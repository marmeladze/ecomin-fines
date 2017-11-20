require 'test_helper'

class CoreExtTest < ActiveSupport::TestCase
  def test_to_range_converts_dash_delimited_float_string_to_float_range
    assert_equal (21.2..23.5), "23.5 - 21.2".to_range
  end
end