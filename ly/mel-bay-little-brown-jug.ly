\include "style.ily"
\version "2.18.2"

\header {
  title = "Little Brown Jug Schottische"
  %ubtitle = "Mel Bay p. 1"
  tpag = "Mel Bay p. 1"
  %composer = "Mel Bay"
}

\score {

  \transpose c c
  << \chords {
    % chords
    s4 g1 c d:7 g \break
    s c d:7 g \break
    g2 g:7 c1 d:7 g \break
    g2 g:7 c1 d:7 g \break
  } << \relative g {
    % melody
    \clef "treble_8"
    \key g \major
    \time 2/2
    \partial 4
    \override BreathingSign.text = \markup{\musicglyph #"scripts.caesura.straight"}
    \repeat volta 2 {
      b8.--( a16-.) |
      \ch"g" <g g,>8.--( b16-.) d8.--( e16-.)
        d8.--( b16-.) g8.--( b16-.) |
      \ch"c" <c e,>4 <e c e, g,>->
        <e c e, g,>-> fs8.--( e16-.) |
      \ch"d:7" <d fs,>8.( e16) fs8.( g16)
        fs8.( e16) fs8.( e16) |
      \ch"g" <d d,>4 <g b, d, g,>-> <g b, d, g,>->
        b,8.( a16) | \break
      <g g,>8.( b16) d8.( e16) d8.( b16) g8.( b16) |
      \ch"c" c4 e-> e-> fs8.( e16) |
      \ch"d:7" d8.( e16) fs8.( g16)
        fs8.( e16) fs8.( g16) |
      \ch"g" a4 <g b,>-> <g b,>-> \breathe
        g8.( a16) | \break
      \ch"g" b8.( a16) g8.( e16)
        \ch"g:7" d8.( b16) g8.( b16) |
      \ch"c" c4 e-> e-> fs8.( e16) |
      \ch"d:7" d8.( e16) fs8.( g16)
        fs8.( e16) fs8.( e16) |
      \ch"g" d4 <g b,>-> <g b,>-> g8.( a16) | \break
      \ch"g" b8.( a16) g8.( e16)
        d8.( b16) g8.( b16) |
      \ch"c" c4 e-> e-> fs8.( e16) |
      \ch"d:7" d8.( e16) fs8.( g16)
        fs8.( e16) fs8.( g16) |
      \ch"g" a4 <g b,>-> <g b,>-> \break
    }
  } >> >>
}
