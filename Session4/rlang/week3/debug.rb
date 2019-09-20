print "\n\n"

degs = 90

case degs:
    when 77..200:
        print "It\'s Hot today"
    when 68..76:
        print "The weather is nice"
    when 50 .. 67:
        print "It\'s Chiller"
    else:
        print "The weather is weird today!"
end

STDIN.gets