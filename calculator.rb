Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 240 do
  stack :margin => 20 do
    @output = edit_line
    
    flow do
      %w(0 1 2 3 4 5 6 7 8 9 + / * -).each do |op|      
        button op do         
          append op
        end
      end
      
      button "=" do
        eval_expression
      end

      button "C" do
        @input = ""
        @output.text = " "
      end

      button "^2" do
        append "**2"
      end

      button "sqrt" do
        @input = Math.sqrt(@input.to_i).to_s
        @output.text = @input
      end

      button "log(2)" do
        @input = Math.log2(@input.to_i).to_s
        @output.text = @input
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
