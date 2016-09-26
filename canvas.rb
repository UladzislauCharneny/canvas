class Canvas
    attr_accessor :canvas, :canvas_length, :canvas_height

    def initialize(canvas_length, canvas_height)
        @canvas_length = canvas_length
        @canvas_height = canvas_height
        @canvas = Array.new(canvas_length) { Array.new(canvas_height, 0) }
    end

    def add_layer(num, position_top, position_left, layer_width, layer_height)
        layer_height = check_height(position_top, layer_height)

        layer_width = check_width(position_left, layer_width)

        fill_in_canvas(num, position_top, position_left, layer_height, layer_width)
    end

    private

    def check_height(position_top, layer_height)
      layer_bottom_position = position_top + layer_height

      if layer_bottom_position > canvas_length - 1
        layer_height = canvas_length - position_top
      end

      layer_height
    end

    def check_width(position_left, layer_width)
      layer_right_border_position = position_left + layer_width

      if layer_right_border_position > canvas_height - 1
        layer_width = canvas_height - position_left
      end

      layer_width
    end

    def fill_in_canvas(num, position_top, position_left, layer_height, layer_width)
      position_top.upto(position_top+layer_height-1) do |main_index|
        position_left.upto(position_left+layer_width-1) do |index|
          canvas[main_index][index] = num
        end
      end
    end
end

