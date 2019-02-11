require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  
  
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  
  holiday_hash[season] = {holiday_name => supply_array}

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  
  new_array = holiday_hash[:winter].values
  flattened_array = new_array.flatten 
  flattened_array
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, hash|
    puts "#{season.capitalize}:"
    hash.each do |holiday, stuff|
        holiday_string =  "  #{holiday.capitalize}: "
        stuff.each do |i|
          holiday_string << "#{i}, "
        end
        
        # This finds all underscores, and creates an array that the next block iterates with to fix underscores and capitalization so that the format matches the answer.
        
        fix_underscores = holiday_string.split("")
        counter = 0
        counter_array = []
        fix_underscores.each do |i|
          if i == "_"
            counter_array << counter  
          end
          counter +=1
        end
        
        counter_array.collect do |i|
          capit = i + 1
          fix_underscores[i] = " "
          fix_underscores[capit] = fix_underscores[capit].upcase
        end
        
        join_fix = fix_underscores.join

        puts join_fix.chomp(", ")
    end
  end
end



def all_holidays_with_bbq(holiday_hash)
  holiday_list = []
  check_int = 0
  
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, item_array|
      item_array.each do |items|
        if items == "BBQ"
          check_int = 1
        end
      end
      if check_int == 1
        holiday_list << holiday
        check_int = 0
      end
    end
  end
  holiday_list
end







