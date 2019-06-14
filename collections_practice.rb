def begins_with_r(array)
  a_size = array.size
  !(array.any? {|word| !(word.start_with?("r"))})
end

 def contain_a(array)
  array.select {|element| element.include?("a")}
end

 def first_wa(array)
  array.find {|element| (element.class == String) && (element.start_with?("wa")) }
end

 def remove_non_strings(array)
  array.delete_if {|element| element.class != String}
end

 def count_elements_old(array)
  array_w_count = []
  count = 0
  while(!array.empty?)
    for index in 0..(array.size-1)
      if(array[0] == array[index])
        count += 1
      end
    end
    array_w_count << array[0]
    array.delete_if {|element| array_w_count.last == element}
    array_w_count[-1] = array_w_count.last.merge({:count => count})
    count = 0;
  end

   array_w_count
end

 def count_elements(array)
  array.sort_by{|hash| hash[:name]}
  array_w_count = []
  count = 1;
  prev = array[0]
  for i in 1..(array.size-1)
    if(array[i] == prev)
      count += 1
    else
      array_w_count << prev.merge({:count => count})
      prev = array[i]
      count = 1
    end
  end
  array_w_count << prev.merge(:count => count)
  array_w_count
end

def merge_data(keys, data)
 keys.each do |name_hash|
   data.each do |hash|
     name_hash.merge!(hash[name_hash[:first_name]])
   end
 end
end


 def find_cool(hashes)
  hashes.select do |hash|
    hash[:temperature] == "cool"
  end
end

 def organize_schools(schools)
  schools_by_location = {}
  schools.each do |key, value|
    if(schools_by_location[value[:location]] == nil)
      schools_by_location[value[:location]] = [key]
    else
      schools_by_location[value[:location]] << key
    end
  end
  schools_by_location
end
