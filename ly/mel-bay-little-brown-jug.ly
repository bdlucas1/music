\include "style.ily"
\version "2.18.2"

\header {
  title = "Little Brown Jug Schottische"
  composer = "Mel Bay p. 1"
  pdfsubtitle = "foo"
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
      b8.--( a16-.) |										% 
      \ch"g" <g g,>8.--( b16-.) d8.--( e16-.) d8.--( b16-.) g8.--( b16-.) |			% 1
      \ch"c" <c e,>4 <e c e, g,>-> <e c e, g,>-> fs8.--( e16-.) |				% 2
      \ch"d:7" <d fs,>8.( e16) fs8.( g16) <fs a,>8.( e16) fs8.( e16) |				% 3
      \ch"g" <d d,>4 <g b, d, g,>-> <g b, d, g,>-> b,8.( a16) | \break				% 4
      <g g,>8.( b16) d8.( e16) d8.( b16) g8.( b16) |						% 5
      \ch"c" <c e,>4 <e c e, g,>-> <e c e, g,>-> fs8.( e16) |					% 6
      \ch"d:7" d8.( e16) fs8.( g16) fs8.( e16) fs8.( g16) |					% 7
      \ch"g" a4 <g b, d, g,>-> <g b, d, g,>-> \breathe g8.( a16) | \break			% 8
      \ch"g" <b d,, g,>8.( a16) <g b,>8.( e16) \ch"g:7" <d fs,>8.( b16) <g g,>8.( b16) |	% 9
      \ch"c" <c e,>4 <e c e, g,>-> <e c e, g,>-> fs8.( e16) |					% 10
      \ch"d:7" d8.( e16) fs8.( g16) fs8.( e16) fs8.( e16) |					% 11
      \ch"g" <d d,>4 <g b, d, g,>-> <g b, d, g,>-> g8.( a16) | \break				% 12
      \ch"g" b8.( a16) g8.( e16) d8.( b16) g8.( b16) |						% 13
      \ch"c" <c e,>4 <e c e, g,>-> <e c e, g,>-> fs8.( e16) |					% 14
      \ch"d:7" d8.( e16) fs8.( g16) fs8.( e16) fs8.( g16) |					% 15
      \ch"g" a4 <g b, d, g,>-> <g b, d, g,>-> \break						% 16
    }
  } >> >>
}
