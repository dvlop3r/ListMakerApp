module ListMaker
    class Action

        attr_accessor :file

        def initialize file
            @file=file
        end
        def view
            File.readlines(@file).each do |line|
                puts line
            end
            puts "*"*45
            @file.close
        end

        def add
            puts 'What would you like to add? '
            line=gets
            @file.write(line)
            @file.close
        end

        def edit
            print "Which line you wanna edit? \n"
            lineno=gets.chomp.to_i
            lines=File.readlines(@file)
            puts "With what?"
            line=gets
            lines[lineno-1]=line
            File.write(@file,lines.join)
            @file.close
        end

        def delete
            print "Which line you wanna delete? \n"
            lineno=gets.chomp.to_i
            lines=File.readlines(@file)
            lines.delete_at(lineno-1)
            File.write(@file,lines.join)
            @file.close
        end
    end
end