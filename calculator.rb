Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 240 do
  stack :margin => 20 do
    @output = edit_line

    stack :width => 80 do
      flow do
        %w(7 8 9 4 5 6 1 2 3 . + / * - = C ^2 sqrt log(2) Miles\ to\ KM KM\ to\ Miles).each do |op|      
          button op do
            case op
              when "="
                eval_expression
              when "C"
                @input = ""
                @output.text = " "
              when "^2"
                append "**2"
              when "sqrt"
                @input = Math.sqrt(@input.to_f).to_s
                @output.text = @input
              when "log(2)"
                @input = Math.log2(@input.to_f).to_s
                @output.text = @input
              when "Miles to KM"
                @input = (1.609344*(@input.to_f)).to_s
                @output.text = @input
              when "KM to Miles"
                @input = (0.621371192*(@input.to_f)).to_s
                @output.text = @input 
            else         
            append op
          end
          end
        end
      end
    end
  end

  # Stick a string on the end of our input
  #
  def append(s)
    @input ||= ""
    @input += s
    @output.text = @input
  end

  
  # Evaluate the input we've got so far
  #
  def eval_expression
    @input = eval(@input).to_s
    @output.text = @input
  end
  
end
