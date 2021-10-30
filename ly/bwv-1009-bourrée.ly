\include "style.ily"
\version "2.18.2"

break = {}

\header {
  title = "Bourrée"
  subject = "Suzuki Vol. 3 No. 7"
  composer = "Johann Sebastian Bach"
}

\score {

  \transpose c c
  <<
    \chords {
    }
    \relative g {
      \clef "treble_8"
      \key g \major
      \time 2/2
      \partial 4
      \repeat volta 2 {
        b8\mf c					| % 1
        d4 g,8 fs g4-.( g'-.)			| % 2
        <fs a, d,>4 e8\> fs d4\! a8 b		| % 3
        c4 fs,8 e fs4-.( d'-.)			| % 4
        <c d, g,>8( b) a\> b g4\! g'8 fs-.	| % 5
        \break
        e fs-. g-. d cs-. fs-. g-. b,-.		| % 6
        a-.\< fs'-. g-. g,-. fs-- a-. cs-. e-.	| % 7
        a4--\mf fs8 d a4-.(\> cs-.)		| % 8
        d a-.( d,-.)\p
        \break
      }
      \repeat volta 2 {
        fs'8\f g				| % 9
        a4 fs8 d c!4-.( fs-.)			| % 10
        b,8( d) g a b4 g8 ds			| % 11
        e4 c8 e a,( g') fs e 			| % 12
        b(\> e) ds cs b4 fs'8\p\< b,		| % 13
        \break
        g' e( ds e) fs b, g' b,			| % 14
        a' fs( e fs) g b, a'\! a, 		| % 15
        g b'( fs) g b,4 e8 ds			| % 16
        e4-.\> b-.(\! e,-.) e'8\f fs		| % 17
        \break
        g4 cs,8 b cs4-.( a-.)			| % 18
        d,8( a') g' e fs4 d!8 c!		| % 19
        b( d) g b, a( c') b g			| % 20
        a( g)\> fs e d4 fs8\f g			| % 21
        \break
        a( fs) d e fs(\> d) a b			| % 22
        c( a) fs g a( fs) d d'\!		| % 23
        b( g) d-.( d'-.) b( g) d-.( g'-.)	| % 24
        d(\p b) c( a) b( g) d-.( b'-.)		| % 25
        \break
        a-. b-. c-. g-. fs-. b-. c-. e,-.	| % 26
        d-.\< b'-. c-. c,-. b-. d-. fs-. a-.\!	| % 27
        d4-- b8 g d4-.(\> fs-.)			| % 28
        <g g,>2.\p
        \break
        %\mark \markup \magnify #0.8 \musicglyph #"scripts.ufermata"
        \mark\markup{\italic\smaller\smaller{Fine}}
      }
      \key g \minor
      \repeat volta 2 {
        g'8_\markup{\italic dolce} a		| % 29
        bf?4( a8 g) fs4--( g--)			| % 30
        a8( g fs) ef? d c bf? a			| % 31
        bf( d c bf) a( c bf a)			| % 32
        g( fs\< g) a bf c d ef?\!		| % 33
        \break
        f4( ef?8 d) c4--( bf--)			| % 34
        a8( bf c)\< d ef? f g a\!		| % 34
        bf4(\> a8 g) f( ef? d) c\!		| % 35
        c4( bf2)				  % 36
        \mark\markup{\italic\smaller\smaller{D.C. al fine}}
        \break
      }
    }
  >>
}
