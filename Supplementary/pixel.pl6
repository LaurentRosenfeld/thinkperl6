use v6;

### Class Pixel subclassing class Point2D ###

class Point2D {
    has Numeric $.abscissa;
    has Numeric $.ordinate;
    
    method coordinates {        # accessor to both x and y
        return (self.abscissa, self.ordinate)
    }
    
    method distanceToCenter {
        (self.abscissa ** 2 + self.ordinate ** 2) ** 0.5
    }
    method polarCoordinates {
        my $radius = self.distanceToCenter;
        my $theta = atan2 self.ordinate, self.abscissa; # (azimut)
        return $radius, $theta;
    }
}

class Pixel is Point2D {
    has %.color is rw;

    multi method change_color(%hue) {
        self.color = %hue
    }
    multi method change_color(Int $red, Int $green, Int $blue) {
        # signature using positional parameters
        self.color = (red => $red, green => $green, blue => $blue)
    }
}

my $pix = Pixel.new(
    :abscissa(3.3),
    :ordinate(4.2),
    color => {red => 34, green => 233, blue => 145}, 
    );

say "The original pixel has the following colors: ", $pix.color;

$pix.change_color({:red(195), :green(110), :blue(70),});
say "The modified pixelhas the following colors: ", $pix.color;
printf "New pixel caracteristics: \n\tAbscissa: %.2f\n\tOrdinate: %.2f\n\tColors: R: %d, G: %d, B: %d\n",
       $pix.abscissa, $pix.ordinate, $pix.color<red>, $pix.color{"green"}, $pix.color{"blue"};

$pix.change_color(90, 180, 30);  # positional args
say "New colors:  
\tR: {$pix.color<red>}, V: {$pix.color<green>}, B: {$pix.color<blue>} ";
