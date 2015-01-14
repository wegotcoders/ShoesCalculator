Shoes.app :title => "My Amazing Calculator", :width => 200, :height => 280 do
  stack :margin => 10 do
    @output = edit_line width:124
    
    flow do
      %w(7 8 9 + 4 5 6 - 1 2 3 / 0 *).each do |op|      
        button op do         
          append op
        end
      end
      
      button "=" do
        eval_expression
      end

      button "C" do
        @output.text = nil
        @input = nil
      end

      button "**" do 
        append "**2"
        eval_expression
      end

    end

      # button "√" do
      #   Math.sqrt(@output.text.to_i)
      # end

      # button "log2" do
      #   Math.log2(@output.text)
      # end
  end
  
  # Stick a string on the end of our input
  #
  def append(s)
    if @input.nil?
      @input = ""
    end
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
