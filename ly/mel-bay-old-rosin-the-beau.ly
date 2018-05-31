\include "style.ily"
\version "2.18.2"

\score {

  \header {
    piece = "Old Rosin the Beau"
    tag = "Mel Bay p. 15"
  }

  \transpose c c
  << \chords {
    % chords
    s8 | g2. | s2 s8 c | g2. | \parenthesize e4.:m d | g2. | \break
    s2 s8 c | g4. d4.:7 | g2. | g | c | \break
    g2. | \parenthesize e4.:m d | g2. | s2 s8  c | g4. d:7 | g
  } << \relative g {
    % melody
    \clef "treble_8"
    \key g \major
    \time 6/8
    \partial 8
    \repeat volta 2 {
      d8 |
      \ch"g" <g g,>8 fs g b a g |
      <b g,>\( d4( d)\) \ch"c" <e c g,>8 |
      \ch"g" <d d, g,> b g g a b |
      \ch"(g:m)" <e, g,>4( fs16 e \ch"d" <d a>4) d8 |
      \ch"g" <g g,> fs g b a g | \break
      <b g,>\( d4( d)\) \ch"c" <e c g,>8 |
      \ch"g" <d d, g,> b g \ch"d:7" <a d, a> b a |
      \ch"g" <g b,>4.~ g8 r 
    }
    \repeat volta 2 {
      b16( c) |
      \ch"g" <d d, g,>4( b8) d4( b8) |
      \ch"c" <g' c, g,>4( e8) g4( e8) | \break
      \ch"g" <d d, g,> b g g a b |
      \ch"(g:m)" <e, g,>4( fs16 e \ch"d" <d a>4) d8 |
      \ch"g" <g g,> fs g b a g |
      <b g,>\( d4( d)\) \ch"c" <e c g,>8 |
      \ch"g" <d d, g,> b g \ch"d:7" <a d, a> b a |
      \ch"g" <g b,>4.~ g8 r \break
    }
  } >> >>
}
     

