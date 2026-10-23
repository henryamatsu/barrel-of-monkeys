module GameObjects
  # this is the basic most class for game objects such as structures and mobs
  class BaseGameObject
    attr_reader :id, :type_id, :x, :y, :sprite, :stats, :brains

    def initialize(type_id:, x:, y:, sprite:, stats:, brains:)
      @id = BaseGameObject.generate_id
      @type_id = type_id
      @x = x
      @y = y
      @sprite = sprite
      @stats = stats
      @brains = brains
    end

    def self.spawn_from_type_id(type_id:, x:, y:)
      type_data = get_type_data(type_id)
      new(
        type_id: type_id,
        x: x,
        y: y,
        sprite: type_data['sprite'],
        stats: type_data['stats'],
        brains: type_data['brains']
      )
    end

    def self.spawn_from_save_id(save_id:)
      save_data = get_save_data(save_id)
      type_data = get_type_data(save_data.type_id)

      new(
        type_id: save_data['type_id'],
        x: save_data['x'],
        y: save_data['y'],
        sprite: type_data['sprite'],
        stats: save_data['stats'],
        brains: type_data['brains']
      )
    end

    def self.generate_id
      # we will have some sort of id generation logic in the future
      1
    end

    def self.get_type_data(type_id)
      DR.parse_json_file('/data/game_objects.json')[type_id.to_s]
    end

    def save_data
      { id: @id, type_id: @type_id, x: @x, y: @y, stats: @stats }
    end
  end
end
