use v6;

### Exercise 7.2 - any_lowervase - only two subroutines are correct ###

sub is-lower (Str $char) { 
    return so $char ~~ /^<[a..z]>$/
}

sub any_lowercase1(Str $string){
    for $string.split('') -> $char {
        next if $char eq '';
        if is-lower $char {
            return True;
        } else {
            return False;
        }
    }
}

sub any_lowercase2(Str $string){
    for $string.split('') -> $char {
        next if $char eq '';
        if is-lower "char" {
            return True;
        } else {
            return False;
        }
    }
}

sub any_lowercase3(Str $string){
    my $flag;
    for $string.split('') -> $char {
        next if $char eq '';
        $flag =  is-lower $char;
    }
    return $flag;
}

sub any_lowercase4(Str $string){
    my $flag = False;
    for $string.split('') -> $char {
        next if $char eq '';
        $flag = $flag || is-lower $char;
    }
    return $flag;
}

sub any_lowercase5(Str $string){
    my $flag = False;
    for $string.split('') -> $char {
        next if $char eq '';
        if is-lower $char {
            $flag = True;
        }
    }
    return $flag;
}


sub any_lowercase6(Str $string){
    for $string.split('') -> $char {
        next if $char eq '';
        if is-lower $char {
            return 'true';
        }
    }
    return 'false';
}

sub any_lowercase7(Str $string){
    for $string.split('') -> $char {
        next if $char eq '';
        return True if is-lower $char;
    }
    return False;
}

sub any_lowercase8(Str $string){
    for $string.split('') -> $char {
        next if $char eq '';
        return False unless is-lower $char;
    }
    return True;
}

sub any_lowercase9(Str $string){
    for $string.split('') -> $char {
        next if $char eq '';
        if not is-lower $char {
            return False;
        }
    return True;
    }
}


for <FOO bar Baz> -> $str {
    say "1. $str: ", any_lowercase1 $str;
    say "2. $str: ", any_lowercase2 $str;
    say "3. $str: ", any_lowercase3 $str;
    say "4. $str: ", any_lowercase4 $str;
    say "5. $str: ", any_lowercase5 $str;
    say "6. $str: ", any_lowercase6 $str;
    say "7. $str: ", any_lowercase7 $str;
    say "8. $str: ", any_lowercase8 $str;
    say "9. $str: ", any_lowercase9 $str;
}