#!/usr/bin/env ruby

require 'curses'
include Curses

init_screen
curs_set(frame = 0)
altitude = 5

Thread.new { system "say -v Alex the rofl copter says #{'siff ' * 1000}" }

while (frame += 1)
  [
    %|                               |,
    %|      4321043210LOL4321043210  |,
    %|                 ^             |,
    %|012     /-------------         |,
    %|3O3=======        [ ] \\        |,
    %|210       \\            \\       |,
    %|           \\____________]      |,
    %|              I     I          |,
    %|          --------------/      |,
    %|                               |,
  ].each_with_index do |line, index|
    { 1 => [':LFOR', 5], (3..5) => ['L    ', 4] }.each do |key, (ch, n)|
      n.times { |i| line.tr!(i.to_s, ch.chars.to_a[(i + frame) % n]) } if key === index
    end

    copter = (line + (' ' * (cols - 31))).chars.to_a
    frame.times { copter.unshift(copter.pop) }
    
    setpos(altitude + index, 0)
    addstr copter.join
  end

  case rand 1..10
  when 1
    altitude -= 1
  when 10
    altitude += 1
  end
  
  refresh
  sleep 0.08
end

at_exit { close_screen }
