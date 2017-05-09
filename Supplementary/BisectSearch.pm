unit module BisectSearch;

multi sub bisect (Str $word, @word_list) is export {
    sub bisect2 ($low_idx, $high_idx) {
        my $mid_idx = (($low_idx + $high_idx) /2).Int;
        my $found = @word_list[$mid_idx];
        return $mid_idx if $word eq $found;
        return -1 if $low_idx >= $high_idx;
        if $word lt $found {
            # search the first half
            return bisect2 $low_idx, $mid_idx - 1;
        } else {
            # search the second half
            return bisect2 $mid_idx+1, $high_idx;
        }
    }
    my $max_index = @word_list.end;
    return bisect2 0, $max_index;
}

multi sub bisect (Int $num, @list) is export {
    sub bisect2 ($low_idx, $high_idx) {
        my $mid_idx = (($low_idx + $high_idx) /2).Int;
        my $found = @list[$mid_idx];
        return $mid_idx if $num == $found;
        return $low_idx if $low_idx >= $high_idx;
        if $num < $found {
            # search the first half
            return bisect2 $low_idx, $mid_idx - 1;
        } else {
            # search the second half
            return bisect2 $mid_idx+1, $high_idx;
        }
    }
    my $max_index = @list.end;
    return bisect2 0, $max_index;
}