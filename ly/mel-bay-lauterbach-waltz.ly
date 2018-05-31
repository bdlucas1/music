\include "style.ily"
\version "2.18.2"

\score {

  \header {
    piece = "Lauterbach Waltz"
    tag = "Mel Bay p. 4"
  }

  \transpose c c
  << \chords {
    % chords
    s4 g2. s d:7 s s s g s \break
    s s d:7 s s s g s2 \break
    s4 s2. s c s d:7 s s s \break
    g s c s d:7 s g s2 \break
  } << \relative g {
    % melody
    \clef "treble_8"
    \key g \major
    \time 3/4
    \partial 4
    \repeat volta 2 {
      b8( c) | <d d, g,>4. c8( b a) | \triplet g8( a g) fs4( g) |
      <a d, a>4. g8( fs e) |  <d a>2 d'4 | <e b g,>4. fs8( e d) | <c e, g,>4 \triplet b8( c b a4) |
      <d d, g,>4. e8( d b) | d4. c8( b c) | \break
      <d d, g,>4. c8( b a) | \triplet g( a g) fs4( g) | <a d, a>4. g8( fs e) | <d a>2 d'4 |
      <e b g,>4. fs8( e d) | <c e, g,>4 \triplet b8( c b a4) | <g g,>4 b4.( a8) | g4 r \break
    }
    \repeat volta 2 {
      e'8( fs) | <g b, g,>4( b,) b | <g' b, g,>( b,) b |
      \triplet <c e, g,>8( d c) b4( c) | <a' c, e,>2 g4 |
      <fs a, a,>4( a,) a | <fs' a, a,>4( a,) a | \triplet a8( b a) b4( c) | <d d,> b'( a) | \break
      <g b, g,>( b,) b | <g' b, g,>( b,) b | \triplet <c e, g,>8( d c) b4( c) |
      <a' c, e,>2 g4 | <fs a, a,>4. g8( fs e) | d4 <e c>( <fs c>) |
      <g b, g,>4. <a b,>8( <g b,> <fs b,>) | <g b, d, g,>4 r \break
    }
  } >> >>
}
     

