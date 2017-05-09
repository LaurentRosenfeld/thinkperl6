use v6;

### Heap implementation ###

sub build-heap (@array, $index is copy) {
    my $index-val = @array[$index];
    while ($index) {
        my $parent = Int( ($index - 1) / 2);
        my $parent-val = @array[$parent];
        last if $parent-val lt $index-val;
        @array[$index] = $parent-val;
        $index = $parent;
    }
    @array[$index] = $index-val;
}

sub heapify (@array) {
    for @array.keys -> $i {
        build-heap @array, $i;
        # say @array;
    }
}

sub print-heap (@array) {
    my $start = 0;
    my $end = 0;
    my $last = @array.end;
    my $step = 1;
    loop {
        say @array[$start..$end];
        last if $end == $last;
        $start += $step;
        $step *= 2;
        $end += $step;
        $end = $last if $end > $last;
    } 
}

sub print-heap2 (@array) {
    my $step = 0;
    for @array.keys -> $current {
        my $left_child = @array[2 * $current + 1];
        say "$current\tNode = @array[$current];\tNo child" and next unless defined $left_child;
        my $right_child = @array[2 * $current + 2] // "' '";
        
        say "$current\tNode = @array[$current];\tChildren:  $left_child and $right_child";
        $step++;
    }

}

my @input =  <m t f l s j p o b h v k n q g r i a d u e c>; # <g c b a d f e>; 
heapify @input;
say @input;
print-heap @input;
print-heap2 @input;

