#vigenere cipher

#define vigenere encryption/decryption
def vigenere(choice)
  #remove dash from command
  system('clear')
  choice[0] = ""
  
  #activate encryption/decryption mode
  if choice == "encrypt"
    sign = 1
  else
    sign = -1
  end
  
  #prompts
  print "Enter phrase to #{choice}: "
  phrase = gets.chomp.downcase
  print "Enter key (phrase): "
  key = gets.chomp.downcase
  
  #begin encryption/decryption
  keyIndex = -1
  for i in 0...phrase.length
    if phrase[i] != " "
      #increment key index until not a space. modulus is used to wrap around key
      loop do
        keyIndex = (keyIndex + 1) % key.length
        break if key[keyIndex] != " "
      end
      #need to subtract 97 to adjust ascii number
      phrase[i] = ((phrase[i].ord - 97 + sign * (key[keyIndex].ord - 97)) % 26 + 97).chr
    end
  end
  puts phrase.upcase
end

#call encryption or decryption
system('clear')
puts "Welcome to kyuf's Vigenere Cipher. Would you like to encrypt or decrypt your message?"
print "Enter either -encrypt or -decrypt: "
choice = gets.chomp.downcase

#check if valid input
while choice != "-encrypt" && choice != "-decrypt"
  print "Invalid command. Please enter either -encrypt or -decrypt: "
  choice = gets.chomp.downcase
end

#call cipher
vigenere(choice)