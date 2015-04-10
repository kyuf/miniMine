#fibonacci cipher

#key shift is continuously incremented by key indices
#shift from ABC key would be 0, 0 + 1 = 1, 1 + 2 = 3

#define encryption/decryption
def fibCipher(choice)
  #remove dash
  system('clear')
  choice[0] = ""
  
  #activate encryption/decryption mode
  if choice == "encrypt"
    sign = 1
  else
    sign = -1
  end
  
  #prompt input
  print "Enter phrase you would like to #{choice}: "
  phrase = gets.chomp.downcase
  print "Enter key (phrase): "
  key = gets.chomp.downcase
  
  #begin encryption/decryption
  keyIndex = -1
  keyShift = 0
  for i in 0...phrase.length
    if phrase[i] != " "
      #make sure key value is not space
      loop do
        keyIndex = (keyIndex + 1) % key.length
        break if key[keyIndex] != " "
      end
      #encrypt/decrypt
      keyShift = (keyShift + (key[keyIndex].ord - 97)) % 26
      phrase[i] = ((phrase[i].ord - 97 + sign * keyShift) % 26 + 97).chr
    end
  end
  puts phrase.upcase
end

#choose between encryption/decryption
system('clear')
puts "Welcome to kyuf's Fibonacci Cipher. Would you like to encrypt or decrypt your message?"
print "Enter either -encrypt or -decrypt: "
choice = gets.chomp.downcase

#check if valid input
while choice != "-encrypt" && choice != "-decrypt"
  print "Invalid command. Please enter either -encrypt or -decrypt: "
  choice = gets.chomp.downcase
end

#call fibonacci cipher
fibCipher(choice)