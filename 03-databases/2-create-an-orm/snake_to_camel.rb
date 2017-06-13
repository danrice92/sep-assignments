# 7. Write a Ruby method that converts snake_case to CamelCase using regular expressions (test on Rubular).
def toCamel(snake_cased_word)
  string = snake_cased_word.gsub(/\//, '::')
  string.gsub!(/_/, ' ')
  return string.split.map(&:capitalize).join('')
end

puts toCamel("make_it_camel_cased")
