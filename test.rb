array = []

hasher = {:name => 'custom_name', :type => 'Marathi'}
array.push(hasher)
hasher = {:name => 'custom_date', :type => 'MOtloch'}
array.push(hasher)
hasher = {:name => 'custom_url', :type => 'Kota'}
array.push(hasher)

@local_a2 = ["custom_name", "custom_date", "custom_url"]
@local_a1 = ["custom_name", "custom_url", "custom_date"]


def xxx array
  output = true
  if @local_a2.size != array.size
    output = false
  else
    array.each_with_index{  |doe, index|
      output = output & true
      if @local_a2[index] != doe[:name]
        puts " === Unmatched elements found ! ==="
        puts "local custom field: " + @local_a2[index]
        puts "saved custom field: " + doe[:name]
        output = output &  false
      end
    }
  end
  output
end


puts xxx array
