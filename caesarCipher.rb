#caesar cipher
#this version will shift to the right. use a negative key to shift left

#define caesar cipher encrypt/decrypt function
def caesar(choice)
  #remove dash
  system('clear')
  choice[0] = ""
  
  #prompt string input
  print "Enter phrase you want to #{choice}: "
  phrase = gets.chomp.downcase
  #prompt shift value
  print "Enter key (shift value): "
  key = gets.chomp.to_i
  
  #activate encryption/decryption mode
  if choice == "decrypt"
    key = -key
  end
  
  #begin encryption/decryption
  for i in 0...phrase.length
    if phrase[i] != " "
      phrase[i] = ((phrase[i].ord + key - 97) % 26 + 97).chr
    end
  end
  puts phrase.upcase
end

#prompt encrpyt or decrypt
system('clear')
puts "This is kyuf's Casear Cipher. Would you like to encrypt or decrypt your message?"
puts "Enter either -encrypt or -decrypt"
choice = gets.chomp.downcase

#check if valid input was provided
while choice != "-encrypt" && choice != "-decrypt"
  puts "Invalid command. Please enter either -encrypt or -decrypt"
  choice = gets.chomp.downcase
end

#call caesar cipher
caesar(choice)