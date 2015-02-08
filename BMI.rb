require 'pry'
Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 240 do
  stack :margin => 20 do
    @output = edit_line

    @output.text = "Enter your height"

    # How can we recreate this  every time "m" or "inches" is pressed?

    stack :width => 80 do
      flow do
        button_array = %w(7 8 9 4 5 6 1 2 3 . C m inches)
        button_array.each do |op|      
          button op do
            case op
              when "m"
                @height = (@input.to_f**2)
                puts @height
                delete_buttons(button_array)
                ask_for_weight
              when "inches"
                inches_to_meters = 0.0254
                @height = ((inches_to_meters*(@input.to_f))**2)
                puts @height
                delete_buttons(button_array)
                ask_for_weight
              when "C"
                @input = ""
                @output.text = " "
              else
              append op
            end
          end
        end
      end
    end
  end

  def delete_buttons(button_array)
    button_array.delete("m").delete("inches")
  end


  def ask_for_weight
    @output.text = "Enter weight."
    @input = ""

    button "kg" do
      @input = (@input.to_f / @height).to_s
      @output.text = @input
    end

    button "lbs" do
      @input = ((@input.to_f*0.453592) / @height).to_s
      @output.text = @input
    end

  end


  def append(s)
    @input ||= ""
    @input += s
    @output.text = @input
  end


end