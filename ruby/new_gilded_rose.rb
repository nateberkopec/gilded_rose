class GildedRose
  BACKSTAGE = "Backstage passes to a TAFKAL80ETC concert"
  BRIE = "Aged Brie"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  def initialize(items)
    @decorated_items = items.map { |i| DecoratedItem.new(i) }
  end

  def update_quality()
    @decorated_items.each { |i| i.update }
  end
end

class DecoratedItem
  attr_accessor :item, :traits

  def initialize(item)
    @item = item
    @traits = trait_list_from_item_name(item.name)
  end

  def update
    @traits.each { |t| t.update(item) }
  end

  private

  def trait_list_from_item_name(name)
    if name.match?(GildedRose::BRIE)
      [Trait::Brie]
    elsif name.match?(GildedRose::SULFURAS)
      [Trait::Sulfuras]
    elsif name.match?(GildedRose::BACKSTAGE)
      [Trait::Backstage]
    else
      [Trait::Default]
    end
  end
end

module Trait
  class Default
    def self.update(item)
      item.sell_in -= 1
      item.quality -= 1
    end
  end

  class Brie
    def self.update(item)
      item.sell_in -= 1
      item.quality += 1
    end
  end

  class Sulfuras
    def self.update(item)
      # no-op
    end
  end

  class Backstage
    def self.update(item)
      item.sell_in -= 1
      # TODO
      if item.sell_in < 11
        item.quality = item.quality + 1
      end
      if item.sell_in < 6
        item.quality = item.quality + 1
      end
      if item.sell_in < 0
        item.quality = -1
      end
      item.quality += 1
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
