

grammar JSON-Grammar {
    token TOP      { \s* [ <object> | <array> ] \s* }
    rule object    { '{' \s* <pairlist> '}' \s* }
    rule pairlist  {  <pair> * % \, }
    rule pair      {  <string>':' <value> }
    rule array     { '[' <valueList> ']'}
    rule valueList {  <value> * % \, }
    token string   {  \" ( <[ \w \s \- ' ]>+ ) \"  }
    token number   { 
      [\+|\-]?  
      [ \d+ [ \. \d+ ]? ] | [ \. \d+ ]  
      [ <[eE]> [\+|\-]? \d+ ]?
    }
token value {   <val=object> | <val=array> | <val=string> | <val=number> 
               | true    | false     | null 
   }
}

my $JSON-string = q/{
  "firstName": "John",
  "lastName": "Smith",
  "isAlive": true,
  "age": 25,
  "address": {
    "streetAddress": "21 2nd Street",
    "city": "New York",
    "state": "NY",
    "postalCode": "10021-3100"
  },
  "phoneNumbers": [
    {
      "type": "home",
      "number": "212 555-1234"
    },
    {
      "type": "office",
      "number": "646 555-4567"
    },
    {
      "type": "mobile",
      "number": "123 456-7890"
    }
  ],
  "children": [],
  "spouse": null,
  "Bank-account": {
  	"credit": 2342.25
  }
}/;

class JSON-actions {
    method TOP($/) {
        make $/.values.[0].made;
    };
    method object($/) {
        make $<pairlist>.made.hash.item;
    }
    method pairlist($/) {
        make $<pair>».made.flat;
    }
    method pair($/) {
    	# say ~$/;
        make $<string>.made => $<value>.made;
    }
    method array($/) {
        make $<valueList>.made.item;
    }
    method valueList($/) {
        make [$<value>.map(*.made)];
    }
    method string($/) { make ~$0 }
    method number($/) { make +$/.Str; }
    method value($/) { 
    	given ~$/ {
    	    when "true"  {make Bool::True;}
    	    when "false" {make Bool::False;}
    	    when "null"  {make Any;}
    	    default { make $<val>.made;}
    	}  
   }
}

my $j-actions = JSON-actions.new();
my $match = JSON-Grammar.parse($JSON-string, :actions($j-actions));
say $match.made;
# say $match.made if $match;
#my $hash = $match.made.hash;
#say $hash;
#say $hash.keys;
#say $hash<isAlive>;
say "Keys are: \n", $match.made.keys;
say "\nSome values:";
say $match.made{$_} for <firstName lastName isAlive>;
say $match.made<address><city>;
say "\nPhone numbers:";
say $match.made<phoneNumbers>[$_]<type number> for 0..$match.made<phoneNumbers>.end;



