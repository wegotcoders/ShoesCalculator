Shoes.app :title => "My Amazing Calculator", :width => 189, :height => 240 do
  @back  = background blue
  stack :margin => 10 do
    
    @back  = background blue
    @output = edit_line width:166, margin:4
    
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

      # button "÷" do 
      #   append "/"
      # end
    
    end
  end

      # button "√" do
      # end

      # button "log2" do
      #   Math.log2(@output.text)
      # end
  
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
  def eval_expression
    @input = eval(@input).to_s
    @output.text = @input
  end
end
