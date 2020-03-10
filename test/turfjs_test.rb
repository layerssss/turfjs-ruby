# frozen_string_literal: true

require 'test_helper'

class TurfJSTest < Minitest::Test
  def test_point_return_geojson
    assert_equal(
      {
        'type' => 'Feature',
        'properties' => {},
        'geometry' => {
          'type' => 'Point',
          'coordinates' => [1, 2]
        }
      },
      TurfJS.point([1, 2])
    )
  end

  def test_foo_raise_error
    assert_raises(
      NoMethodError
    ) do
      TurfJS.foo
    end
  end

  def test_point_raises_error
    assert_raises(
      TurfJS::Error
    ) do
      TurfJS.point('foo')
    end
  end
end
