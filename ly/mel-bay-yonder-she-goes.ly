\include "style.ily"
\version "2.18.2"

\header {
  title = "Yonder She Goes"
  composer = "Mel Bay p. 4"
}

\score {

  \transpose c c
  << \chords {
    % chords
    s8 g4. d:7 g c g2. d:7 g4. d4.:7 \break
    g4. c g d:7 g2. g c \break
    a:7 d g4. g4.:7 c2. g4. d:7 g \break
  } << \relative g {
    % melody
    \clef "treble_8"
    \key g \major
    \time 6/8
    \partial 8
    \repeat volta 2 {
      d8 | <g g,>( b) b <a d, a>( c) c| <b d, g,>( d) d <c e, g,>4 e8 | <d d, g,> c b b a g |
      <fs a,>( a) a a4 d,8 | <g g,>( b) b <a d, a>( c) c | \break
      <b d, g,>( d) d <c e, g,>4 e8 | <d d, g,> b g <d a> fs a <b d, g,>( <b g>) <b g> <b g> r
    }
    \repeat volta 2 {
      d, | <g g,> b d g4--( d8-.) | <e c e,>( <e c>) <e c> <e c>4 b8 | \break
      <a d, a> cs e a4--( g8-.) | <fs a, d,>( <fs d>) <fs d> <fs d>4 d,8 |
      <g g,> b d <g b, d,>4--( d8-.) | <e c e,>( <e c>) <e c> <e d>4 c8 |
      <b d, g,> a g <d a> fs a | <b d, g,>( <b g>) <b g> <b g> r
    }
  } >> >>
}
     

