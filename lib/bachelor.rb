
require 'pry'

def get_first_name_of_season_winner(data, season)
  # code here
  hold_name = nil
  winners_name = nil
  data.each do |season_query, value_set|
    # puts season_query
    if season_query == season
        value_set.each do |value|
          value.each do |stat, contestant_info|
            if stat == "name"
              hold_name = contestant_info
            elsif stat == "status"
                if contestant_info == "Winner"
                  winners_name = hold_name.split.first
                end
            end
          end
        end
    end
  end
  winners_name
end

def get_contestant_name(data, occupation)
  # code here
  hold_name = nil
  occupation_holder = nil
  data.each do |season_query, value_set|
        value_set.each do |value|
          value.each do |stat, contestant_info|
            if stat == "name"
              hold_name = contestant_info
            elsif stat == "occupation"
                if contestant_info == occupation
                  occupation_holder = hold_name
                end
            end
          end
        end
  end
  occupation_holder

end

def count_contestants_by_hometown(data, hometown)
  # code here
  hometown_locals = 0
  data.each do |season_query, value_set|
    value_set.each do |value|
      value.each do |stat, contestant_info|
        if stat == "hometown"
            if contestant_info == hometown
               hometown_locals += 1
            end
        end
      end
    end
  end
  hometown_locals

end

def get_occupation(data, hometown)
  # code here
  homeplace = nil
  occupation_holder = nil
  # binding.pry
  data.each do |season_query, value_set|
        value_set.each do |value|
          value.each do |stat, contestant_info|
            if stat == "hometown"
              if contestant_info == hometown
                homeplace = contestant_info
              end
            end
            if stat == "occupation" && hometown == homeplace
              return contestant_info
            end
          end
        end
  end

end

def get_average_age_for_season(data, season)
  # code here
  count = 0
  age_accumulator = 0
  data.each do |season_query, value_set|
    if season_query == season
        value_set.each do |value|
          value.each do |stat, contestant_info|
            if stat == "age"
              count += 1
              age_accumulator += contestant_info.to_f
            end
          end
        end
    end
  end
  answer = age_accumulator.to_f / count.to_f
  answer.round.to_i

end
