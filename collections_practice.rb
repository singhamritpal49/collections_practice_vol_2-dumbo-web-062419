def begins_with_r(array)
  array.all?{|item| item.start_with?("r")}
end

 def contain_a(array)
  array.select{|item| item.include?("a")}
end

 def first_wa(array)
  array.find{|item| item.to_s.start_with?("wa")}
end

 def remove_non_strings(array)
  array.delete_if{|item| item != item.to_s}
end

 def count_elements(array)
  array.uniq.collect do |item|
    item[:count] = array.count(item)
    item
  end
end

 def merge_data(keys, data)
  merged = Array.new
  keys.each do |keys_person|
    keys_person.each do |keys_key, keys_value|
      data.each do |data_person|
        data_person.each do |data_name, data_details|
          if keys_value == data_name
            data_person[data_name][keys_key] = keys_value
            merged << data_details
          end
        end
      end
    end
  end
  merged
end

 def find_cool(cool)
answer = []
  cool.each do |item|
    item.each do |key, value|
      answer << item if value == "cool"
    end
  end
  answer
end

 def organize_schools(schools)
  answer = Hash.new
  schools.each do |school, data|
    data.each do |key, value|
      if key == :location
        !answer.keys.include?(value) ? answer[value] = [school] : answer[value] << school
      end
    end
  end
  answer
end