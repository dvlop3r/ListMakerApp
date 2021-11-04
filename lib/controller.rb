require_relative 'action.rb'

module ListMaker
    class Controller
        attr_accessor :action, :file
        @@actions=['view','add','edit','delete']

        def initialize
            @file=File.open('list.txt','w')
            @action=ListMaker::Action.new(@file)
        end

        def launch
            puts "*"*28+"\n|  Listmaker application  |\n"+"*"*28

            print 'What\'s your name? '
            name=gets.chomp
            puts "Welcome to listmaker application, #{name}"+"\n"+"*"*45

            while true
                @action.file=File.new('list.txt','a')
                puts "List of available actions: "+@@actions.join(', ')
                puts "Select your action "+"(type stop to exit)"
                action=gets.chomp
                puts '*'*45
                break if action=='stop'

                case action
                when 'view'
                    @action.view
                when 'add'
                    @action.add
                when 'edit'
                @action.edit
                when 'delete'
                    @action.delete
                end
            end

        end

    end
end