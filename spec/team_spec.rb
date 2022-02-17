require './lib/player'
require './lib/team'

RSpec.describe Team do
  before(:each) do
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  it 'exists' do
    expect(@team).to be_a(Team)
  end

  it 'has attributes' do
    expect(@team.country).to eq("France")
  end

  it 'can return if team #eliminated' do
    expect(@team.eliminated?).to eq(false)
  end

  it 'can return when team eliminated status changes' do
    # require "pry"; binding.pry
    @team.eliminated = true
    expect(@team.eliminated?).to be(true)
  end

  it 'can return an array of added players' do
    expect(@team.players).to eq([])
  end

  it 'can return an array of #add_player' do
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    expect(@team.players).to eq([@mbappe, @pogba])
  end

  it 'can return an array of players sorted by position' do
    # require "pry"; binding.pry
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    expect(@team.players_by_position('midfielder')).to eq([@pogba])
    expect(@team.players_by_position('forward')).to eq([@mbappe])
  end
end
