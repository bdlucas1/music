\include "style.ily"
\version "2.18.2"

\score {

  \header {
    piece = "Peek-a-Boo Waltz"
    tag = "Mel Bay p. 12"
  }

  << \chords {
    s4 | g2. | c | g2 c4 | g2. | s2. | a:7 |
    d2. | s | g | c | g2 c4 | g2. | d:7 |
    s | g | s2 s4 | g2. | s | c |
    s | d:7 | s | g2 c4 | g2. | s | s | c | s | d:7 | s | g | s2
  } \relative c' {
    \clef "treble_8"
    \key g \major
    \time 3/4
    \set Timing.beamExceptions = #'() % beams (1 1 1)
    \partial 4 
    \repeat volta 2 {
      b8\i c\m | d4\i-3 b'\m-4 a\i-3 | g\m \triplet fs8\i g\m fs\i e4\m |
      d4\i b\m e\i d\m b8\i a\m b\i c\m |
      d4\i-3 b'\m-4 a\i-3 | g\m \triplet fs8\i g\m fs\i e4\m | \break
      a4.\i-3 b8\m-4 a\i gs\m | a4.\i-3 d,8\m-4 b\i c\m | d4\i-3 b'\m-4 a\i-3 |
      g\m \triplet fs8\i g\m fs\i e4\m |
      d\i b\m e\a | d\i cs\m d\i | e\m c'\i-4 b\m-2 | \break
      \triplet a8\i-1 b\m a\i e4\m fs\i-1 |
      <g\m b,\i>4. <a\m b,\i>8 <g\m b,\i> <fs\m b,\i> | <g\m b,\i>4 r
    }
    \repeat volta 2 {
      b,8 c | d2 b'4 | d,2 ds4 | e2 c'4 | \break
      e,2 a8 g | fs4. g8 fs e | fs4. g8 fs e | d4 b e | d b8 a b c | d2 b'4 | \break
      d,2 ds4 | e2 c'4 | e,2 a8 g | fs4. g8 fs e | d4 <e c> <fs c> |
      <g b,>4. <a b,>8 <g b,> <fs b,> | <g b,>4 r \break
    }
  } >>
}

