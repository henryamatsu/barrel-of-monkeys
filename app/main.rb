require 'app/game_session'

module Main
  def tick(args)
    init(args) unless args.state.initialized

    state.game_session.args = args
    state.game_session.tick
  end

  def init(args)
    # initialize state variables
    args.state.initialized = true
    create_game_session(args.state)
  end

  def create_game_session(state)
    state.game_session ||= GameSession.new
  end
end
