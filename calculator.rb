Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 240 do
  stack :margin => 20 do
    @output = edit_line(:width => 190)
    
    flow do  
      flow(:width => 150) do
        (0..9).each do |i|
          button i.to_s do
            append(i.to_s)
          end
        end
      end
    
      flow(:width => 50) do
        %w(+ / * -).each do |op|
          button op do    
            append op
          end
        end
        
        button "=" do
          @input = eval(@input).to_s    
          @output.text = @input
        end
      end
    end
  end
  
  def append(s)
    @input = "" if @input.nil?
    @input += s
    @output.text = @input
  end
  
end
