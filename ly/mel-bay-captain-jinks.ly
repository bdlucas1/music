\include "style.ily"
\version "2.18.2"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
  title = "Captain Jinks"
  composer =  "Mel Bay p. 2"
}

\score {

  << \chords {
    s8 | d2. | s | a:7 | d | s | \break
    s | a:7 | d4. s4 s8 | g2. | d | \break
    a:7 | d | g | d | a:7 | d \break
  } \relative c' {
    \clef "treble_8"
    \key d \major
    \time 6/8
    \partial 8
    %\set fingeringOrientations = #'(right)
    \repeat volta 2 {
      e8\m | <a,_\i d,_\p fs'--\m>4\(   a8-.\i\)   a\m fs\i a\m |
      <b\i d,_\p>4--\(  a8-.\m\)  <d d,>4--\(  fs8-.\) |
      <e\m a,_\i e_\p_1>8 fs\i-2 g\m-3 <b, d,>4--\( cs8-.\) |
      <d\i d,_\p>4--\( e8-.\m\) fs4--\( e8-.\) | fs4--\( a,8-.\) a fs a | \break
      <b d,>4--\( a8-.\) d4--\( fs8-.\) |
      <e\m a,_\i e_\p_1>8 fs\i-2 g\m-3 b,4--\( cs8-.\) | <d fs,>4. <d fs, a,>4
    }
    \repeat volta 2 {
      fs8 |
      <g b, d, g,>4--\arpeggio\( g8-.\m\)  g8\i fs\m e\i |
      <fs a, d,>4--\arpeggio\( fs8-.\) fs8 e d | \break
      <e a, e>4--\arpeggio\( e8-.\m\) e8\i fs\m-2 e\i | <d\m d,\p> e\i fs\m a4--\a\( fs8-.\i\) |
      <g b, d, g,>4--\arpeggio\( g8-.\) g8 fs e |
      <fs a, d,>4--\arpeggio\( fs8-.\) fs8 e d | <e\m a,_\i e_\p_1>8 fs-2 e a, b cs |
      <d fs,>4. <d fs, a,>4\arpeggio \break
    }
  } >>
}

