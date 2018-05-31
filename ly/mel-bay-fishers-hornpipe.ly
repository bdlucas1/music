\include "style.ily"
\version "2.18.2"

\score {

  \header {
    piece = "Fisher's Hornpipe"
    tag = "Mel Bay p. 14"
    key = "G Maj"
  }

  \transpose f g''
  << \chords {
    s8 | f4 bf | f bf | f c:7 | f c:7 | f bf | \break
    f bf | f c:7 | f4. s8 | c2:7 | f | \break
    c:7 | g4:7 c:7 | bf2 | f | c:7 | f4. \break
  } \relative {
    \key f \major
    \time 2/4
    \partial 8
    \repeat volta 2 {
      c16 e | f( c) a f bf( d) c bf | a( f) a f bf( d) c bf | a( f) a f bf( g) bf g |
      a( f) a f g8\noBeam c16 e | f( c) a f bf( d) c bf | \break
      a( f) a f bf( d) c bf | a( c) f a g( f) e g | <f a,>8 <a a,>16 <g a,> <f a,>8
    }
    \repeat volta 2 {
      e16 f | g( e) c e g( e) bf' g | a( f) c f a( f) bf a | \break
      g( e) c e g( e) bf' a | g( f) e d c8\noBeam bf16 c | d( bf) f bf d( bf) f' d |
      c( a) f a c( a) f' c | d( f) e d c( bf) a g | f8 a16 c <f a,>8 
    }
  } >>
}

