USING: combinators.lib kernel math math.ranges random sequences
tools.test continuations arrays vectors ;
IN: temporary

[ 5 ] [ [ 10 random ] [ 5 = ] generate ] unit-test
[ t ] [ [ 10 random ] [ even? ] generate even? ] unit-test
[ 50 ] [ 100 [1,b] [ even? ] count ] unit-test
[ 50 ] [ 100 [1,b] [ odd? ] count ] unit-test
[ 328350 ] [ 100 [ sq ] sigma ] unit-test

[ { 910 911 912 } ] [ 10 900 3 [ + + ] map-with2 ] unit-test
{ 6 2 } [ 1 2 [ 5 + ] dip ] unit-test
{ 6 2 1 } [ 1 2 1 [ 5 + ] dipd ] unit-test

[ [ 99 ] 1 2 3 4 5 5 nslip ] must-infer
{ 99 1 2 3 4 5 } [ [ 99 ] 1 2 3 4 5 5 nslip ] unit-test
[ 1 2 3 4 5 [ drop drop drop drop drop 2 ] 5 nkeep ] must-infer
{ 2 1 2 3 4 5 } [ 1 2 3 4 5 [ drop drop drop drop drop 2 ] 5 nkeep ] unit-test
[ [ 1 2 3 + ] ] [ 1 2 3 [ + ] 3 ncurry ] unit-test
[ 1 2 { 3 4 } [ + + ] 2 map-withn ] must-infer
{ { 6 7 } } [ 1 2 { 3 4 } [ + + ] 2 map-withn ] unit-test
{ { 16 17 18 19 20 } } [ 1 2 3 4 { 6 7 8 9 10 } [ + + + + ] 4 map-withn ] unit-test
[ 1 2 { 3 4 } [ + + drop ] 2 each-withn  ] must-infer
{ 13 } [ 1 2 { 3 4 } [ + + ] 2 each-withn + ] unit-test
[ 1 1 2 2 3 3 ] [ 1 2 3 [ dup ] 3apply ] unit-test
[ 1 4 9 ] [ 1 2 3 [ sq ] 3apply ] unit-test
[ [ sq ] 3apply ] must-infer
[ { 1 2 } { 2 4 } { 3 8 } { 4 16 } { 5 32 } ] [ 1 2 3 4 5 [ dup 2^ 2array ] 5 napply ] unit-test
[ [ dup 2^ 2array ] 5 napply ] must-infer

! &&

[ t ] [
    3 {
        [ dup number? ] [ dup odd? ] [ dup 0 > ]
    } && nip
] unit-test

[ f ] [
    3 {
        [ dup number? ] [ dup even? ] [ dup 0 > ]
    } && nip
] unit-test

! ||

[ t ] [
    4 {
        [ dup array? ] [ dup number? ] [ 3 throw ]
    } || nip
] unit-test

[ f ] [
    4 {
        [ dup array? ] [ dup vector? ] [ dup float? ]
    } || nip
] unit-test

[ 1 2 3 4 ] [ { 1 2 3 4 } 4 nfirst ] unit-test
