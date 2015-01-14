# encoding: UTF-8
Shoes.app :title => "My Amazing Calculator", :width => 189, :height => 280 do
  @back  = background darkslateblue
  stack :margin => 10 do
    @back  = background darkslateblue
    @output = edit_line width:166, margin:4
    
    flow do
      %w(7 8 9 + 4 5 6 - 1 2 3 ÷ 0 = C * ** sqrt log2).each do |op|      
        button op do  
          case op
            when "="
              eval_expression
            when "C"
              @output.text = nil
              @input = nil
            when "**"
              append "**2"
            when "÷"
              append "/"
            when "sqrt"
              @input = Math.sqrt(@input.to_f).to_s
              @output.text =@input
            when "log2"
              @input = Math.log2(@input.to_i).to_s
              @output.text =@input
            else       
              append op
          end
        end
      end
      
      # button "=" do
      #   eval_expression
      # end

      # button "C" do
      #   @output.text = nil
      #   @input = nil
      # end

      # button "**" do 
      #   append "**2"
      #   eval_expression
      # end

      # # @input = Math.sqrt(@input.to_f).to_s
      # # @output.text =@input

      # # button "÷" do 
      # #   append "/"
      # # end
    
      # # button "√" do
      # #   Math.sqrt(@output)
      # #   eval_expression
      # # end

      # # button "log2" do
      # #   Math.log2(@output.text)
      # # end
    end
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
  def eval_expression
    @input = eval(@input).to_s
    @output.text = @input
  end
end
