require_relative "room"

class Hotel

    def initialize(name, rooms)
        newHash = Hash.new
        @name = name
        rooms.each { |room, cap| newHash[room] = Room.new(cap) }
        @rooms = newHash
    end

    def name
        @name.split(" ").map { |word| word.capitalize }.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        @rooms.keys.include?(room)
    end
 
    def check_in(person, room)
        if !room_exists?(room)
           puts "sorry, room does not exist"
        else
            puts @rooms[room].add_occupant(person) ? "check in successful" : "sorry, room is full"
        end 
    end

    def has_vacancy?
        !@rooms.each_value.all? { |room| room.full? }
    end

    def list_rooms
        @rooms.each { |room, inst| puts room + " " + inst.available_space.to_s }
    end
end
