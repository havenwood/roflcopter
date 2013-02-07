#!/usr/bin/env ruby

require 'curses'
include Curses

init_screen
curs_set(frame = 0)

Thread.new { system "say -v Alex the rofl copter says #{(['siff'] * 1000).join(' ')}" }

while (frame += 1)
  [
    %|       4321043210LOL4321043210 |,
    %|                 ^             |,
    %|012     /-------------         |,
    %|3O3=======        [ ] \\       |,
    %|210      \\            \\      |,
    %|         \\____________]       |,
    %|            I     I            |,
    %|        --------------/        |
  ].each_with_index do |line, index|
    case index
    when 0      then 5.times { |i| line.tr!(i.to_s, ':LFOR'[(i + frame) % 5]) }
    when (2..4) then 4.times { |i| line.tr!(i.to_s, 'L    '[(i + frame) % 4]) }
    end

    copter = line << ' ' * (cols - line.length)
    copter = copter.chars.to_a.rotate(-(index + frame))

    setpos(5 + index, 0)
    addstr copter.join
  end

  refresh
  sleep 0.08
end

at_exit { close_screen }

