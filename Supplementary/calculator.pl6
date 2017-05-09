use v6;

### Caculator grammar ###

# use Grammar::Tracer;
my grammar Calculator {
    rule TOP {
        <expr> 
    }

    rule expr {
        <term> + % <plus-minus-op>  
    }

    token plus-minus-op {
        [< + - >]
    }

    rule term {
        <atom> + % <mult-div-op> 
    }

    token mult-div-op {
        [< * / >]
    }

    rule atom {
        | <num> { make +$<num> }
        | <paren-expr> { make $<paren-expr>.made}
    }
  
    rule num {
        <sign> ? [\d+ | \d+\.\d+ | \.\d+ ]
    }

    rule paren-expr {
        '(' <expr> ')'
    }

    token sign { [< + - >] }
}

class CalcActions {
    
    method TOP ($/) {
        make $<expr>.made
    }
    method expr ($/) {
        $.calculate($/, $<term>, $<plus-minus-op>)
    }
    method term ($/) {
        $.calculate($/, $<atom>, $<mult-div-op>)
    }
    method paren-expr ($/) {
         make $<expr>.made;
    }

    method calculate ($/, $operands, $operators) {
        # say "$operands ! $operators";
        my $result = (shift $operands).made;
        while my $op = shift $operators {
            my $num = (shift $operands).made;
            given $op {
                when '+' { $result += $num; }
                when '-' { $result -= $num; }
                when '*' { $result *= $num; }
                when '/' { $result /= $num; }
                default  { die "unknown operator "}
            }
        }
        make $result;
    }
}


for |< 3*4 5/6 3+5 74-32 5+7/3 5*3*2 (4*5) (3*2)+5 4+3-1/5 4+(3-1)/4 >,
    "12 + 6 * 5", " 7 + 12 + 23", " 2 + (10 * 4) ", "3 * (7 + 7)" { 
    my $result = Calculator.parse($_, :actions(CalcActions));
    printf "%-15s %.3f\n", $/,  $result.made if $result;
}
    
for "(((2+3)*(5-2))-1)*3", "2 * ((4-1)*((3*7) - (5+2)))" { 
    my $result = Calculator.parse($_, :actions(CalcActions));
    printf "%-30s %.3f\n", $/,  $result.made if $result;
}
