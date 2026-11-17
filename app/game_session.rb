require 'app/modules/state/game_objects/base_game_object'

class GameSession
  attr_dr
  def initialize
    @game_objects = []
    add_game_object
  end

  def tick
    render_sprites
  end

  def add_game_object
    x = 100
    y = 100
    game_object = GameObjects::BaseGameObject.spawn_from_type_id(type_id: :base_game_object, x: x, y: y)
    @game_objects << game_object
  end

  def render_sprites
    @game_objects.each do |game_object|
      outputs.sprites << {
        x: game_object.x,
        y: game_object.y,
        **game_object.sprite.transform_keys(&:to_sym)
      }
    end
  end
end
