\include "style.ily"
\version "2.18.2"

\header {
  title = "Broken Chord Jig"
  composer = "Mel Bay p. 1"
}

\score {

  \transpose c c
  <<
    \chords {
      g2. s s d:7 s \br
      s s g g c4. g \br
      d2.:7 s g c4. g d2.:7 g \br
    }
    \relative g {
      \clef "treble_8"
      \key g \major
      \time 6/8
      \repeat volta 2 {
        \ch"g" <b d, g,>8 d g b a g 			| % 1
        <b, d, g,> d g b a g				| % 2
        <b, d, g,> d g b a g				| % 3
        \ch"d:7" <fs a, d,> e c a4.			| % 4
        <d, a>8 fs a c b a			\break	| % 5
        <d, a> fs a c b a				| % 6
        <d, a> fs a c b a 				| % 7
        \ch"g" <g g,> d b g4 r8				| % 8
      }
      \repeat volta 2 {
        \ch"g" <b' d, g,>4--( c8-.) b a g		| % 9
        \ch"c" <e c> fs g \ch"g" <d b> g b	\break	| % 10
        \ch"d:7" <d d,>4.-> <e d,>->			| % 11
        <b d,>-> c8 b a					| % 12
        \ch"g" <b d, g,>4--( c8-.) b a g		| % 13
        \ch"c" <e c> fs g \ch"g" <d b>4( g'8--)		| % 14
        \ch"d:7" <fs a, d,> e d c b a			| % 15
        \ch"g" <g g,> d b g4 r8				| % 16
      }
    }
  >>
}
