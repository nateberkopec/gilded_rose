require File.join(File.dirname(__FILE__), 'new_gilded_rose')
require 'test/unit'

class TestGildedRose < Test::Unit::TestCase

  def test_basic_item
    assert_values_after_update(
      name: "+5 Dexiterity Vest",
      sell_in: {from: 10, to: 9 },
      quality: {from: 20, to: 19 }
    )
  end

  def test_brie # Quality goes up!
    assert_values_after_update(
      name: GildedRose::BRIE,
      sell_in: {from: 2, to: 1 },
      quality: {from: 0, to: 1 }
    )
  end

  def test_sulfuras
    assert_values_after_update(
      name: GildedRose::SULFURAS,
      sell_in: {from: -1, to: -1 },
      quality: {from: 80, to: 80 }
    )
  end

  def test_backstage_passes_increase_before_zero
    assert_values_after_update(
      name: GildedRose::BACKSTAGE,
      sell_in: { from: 15, to: 14 },
      quality: { from: 20, to: 21 }
    )
  end

  def test_backstage_pass_double_quality_when_close
    assert_values_after_update(
      name: GildedRose::BACKSTAGE,
      sell_in: { from: 10, to: 9 },
      quality: { from: 10, to: 12 }
    )
  end

  def test_backstage_pass_triple_quality_when_very_close
    assert_values_after_update(
      name: GildedRose::BACKSTAGE,
      sell_in: { from: 5, to: 4 },
      quality: { from: 10, to: 13 }
    )
  end

  def test_backstage_pass_zero_after_concert
    assert_values_after_update(
      name: GildedRose::BACKSTAGE,
      sell_in: { from: 0, to: -1 },
      quality: { from: 10, to: 0 }
    )
  end

  def test_quality_degradation_doubles_after_sellby
    assert_values_after_update(
      name: "Item",
      sell_in: { from: 0, to: -1 },
      quality: { from: 20, to: 18 }
    )
  end

  def test_quality_degradation_doubles_after_sellby_brie
    assert_values_after_update(
      name: GildedRose::BRIE,
      sell_in: { from: 0, to: -1 },
      quality: { from: 20, to: 18 }
    )
  end

  # def test_quality_minimum_is_zero
  #   assert_values_after_update(
  #     name: "Item",
  #     sell_in: { from: 2, to: 1 },
  #     quality: { from: 0, to: 0 }
  #   )
  # end

  # def test_quality_never_more_than_fifty
  #   assert_values_after_update(
  #     name: GildedRose::BRIE,
  #     sell_in: { from: 2, to: 1 },
  #     quality: { from: 50, to: 50 }
  #   )
  # end

  # def test_conjured_degrades_by_two
  #   assert_values_after_update(
  #     name: "Conjured Ruby",
  #     sell_in: { from: 10, to: 9 },
  #     quality: { from: 10, to: 8 }
  #   )
  # end

  # def test_conjured_degrades_to_zero
  #   assert_values_after_update(
  #     name: "Conjured Ruby",
  #     sell_in: { from: 1, to: 0 },
  #     quality: { from: 1, to: 0 }
  #   )
  # end

  # def test_conjured_degrades_by_four_when_expired
  #   assert_values_after_update(
  #     name: "Conjured Ruby",
  #     sell_in: { from: 0, to: -1 },
  #     quality: { from: 10, to: 6 }
  #   )
  # end

  # def test_conjured_degrades_to_zero_expired
  #   assert_values_after_update(
  #     name: "Conjured Ruby",
  #     sell_in: { from: 0, to: -1 },
  #     quality: { from: 1, to: 0 }
  #   )
  # end

  private

  def assert_values_after_update(name: "Item", sell_in: {}, quality: {})
    items = [Item.new(name, sell_in[:from], quality[:from])]

    GildedRose.new(items).update_quality()

    item = items[0]
    assert_equal sell_in[:to], item.sell_in
    assert_equal quality[:to], item.quality
  end

end