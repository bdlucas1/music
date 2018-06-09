\include "style.ily"
\version "2.18.2"

\header {
  title = "Buckwheat Batter"
  composer = "Mel Bay p. 3"
}

\score {

  \transpose c c
  <<
    \chords {
      d2. g d a:7 d \break
      g d4. a4.:7 d2. d s \break
      a:7 d s s a:7 d \break
    }
    \relative g {
      \clef "treble_8"
      \key d \major
      \time 6/8
      \repeat volta 2 {
        \ch"d" <d a>8 fs a a fs d 								| % 1
        \ch"g" <d g,> g b b g d 								| % 2
        \ch"d" <d a> fs a a fs d 								| % 3
        \ch"a:7" a cs e <e a,>4. 								| % 4
        \ch"d" <d a>8 fs a a fs d 							\break	| % 5
        \ch"g" <d g,> g b b g d 								| % 6
        \ch"d" <a' d,> fs g \ch"a:7" <a g,> b cs 						| % 7
        \ch"d" <d fs,>4. <d fs, a,>4 r8			  					  % 8
      }
      \repeat volta 2 {
        \ch"d" \once\stemDown\once\slurUp\slashedGrace es8( <fs a, d,>4.) <d d,> 		| % 9
        <a d,>8 fs b a fs d								\break	| % 10
        \ch"a:7" a cs e g fs e 									| % 11
        \ch"d" <d a> fs b a4.									| % 12
        \once\stemDown\once\slurUp\slashedGrace es'8( <fs a, d,>4.) <d d,> 			| % 13
        <a d,>8 fs b a fs d									| % 14
        \ch"a:7" a cs e g fs e									| % 15
        \ch"d" <fs a,> d d d4 r8							\break	| % 16
      }
    }
  >>
}
