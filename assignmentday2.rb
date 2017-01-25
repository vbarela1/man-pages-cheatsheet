#loop over main menu
#if user chooses commnad line 
# -follow cmd line
#if user chooses search
# - Call search method/done 
#if user chooses exit
#- close program 

@cmd_arr = ['cp', 'mv', 'cd', 'mkdir', 'touch']

def main_menu
    puts '1: Command Line'
    puts '2: Search'
    puts '3: Exit'
    puts '****Make a Selection****'
    choice = gets.chomp
    case choice.to_i
    when 1
        cmd_line
    when 2
        search
    when 3
        exit_program
    else
        puts 'Invalid input'
        main_menu
    end 
end

def cmd_line
   @cmd_arr.each_with_index { |cmd, i| puts "#{i + 1}) #{cmd}" }
   puts'****Make a Selection****'
   user_input = gets.chomp.to_i
   if user_input > @cmd_arr.length
       puts 'Invalid choice'
       cmd_line
   else
     puts `man #{@cmd_arr[user_input - 1]}`
   end
end 

def search 
    puts 'Enter a cmd'
    cmd = gets.chomp
    puts `man #{cmd}`
    @cmd_arr << cmd  
end 

def exit_program
    puts "Goodbye"
    exit (0)
end

while true
  main_menu
end