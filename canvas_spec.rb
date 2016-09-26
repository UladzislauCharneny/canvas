require './canvas.rb'

RSpec.describe do
  it 'create new canvas' do
    canvas = Canvas.new(3, 3)
    expect(canvas.canvas).to eq([[0,0,0], [0,0,0], [0,0,0]])
  end

  it 'add layer' do
    canvas = Canvas.new(3, 3)
    canvas.add_layer(1, 1, 1, 2, 2)
    expect(canvas.canvas).to eq([[0,0,0], [0,1,1], [0,1,1]])
  end

  it 'add layer out of border' do
    canvas = Canvas.new(3, 3)
    canvas.add_layer(1, 1, 1, 4, 4)
    expect(canvas.canvas).to eq([[0,0,0], [0,1,1], [0,1,1]])
  end

  it 'add additional layer' do
    canvas = Canvas.new(3, 3)
    canvas.add_layer(2, 1, 1, 2, 2)
    canvas.add_layer(1, 0, 0, 2, 2)
    expect(canvas.canvas).to eq([[1,1,0], [1,1,2], [0,2,2]])
  end
end