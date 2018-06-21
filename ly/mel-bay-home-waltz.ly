\include "style.ily"
\version "2.18.2"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
  title = "Home Waltz"
  composer = "Mel Bay p. 24"
}


\score {

  << \chords {
    %chords
  } << \relative {
    % melody
    \clef "treble_8"
    \key g \major
    \time 3/4 
    \partial 2
    \repeat volta 2 {
      g4\i a\m |
      b2\i~ b8 d\a |
      c2\m~ c8 e\a |
      d4\m~ d8 e\a d\m c\a |
      b2\m~ b8 d\a |
      c2\m~ c8 d\a |
      c4\m b\m a\m |
      b2.~ \m |
      b4 g\m a\i |  \break
      b2\m~ b8 d\a |
      c2\m~ c8 e\a |
      d4\m~ d8 e\a d\m c\a |
      b2\m~ b8 d\a |
      c2\m~ c8 d\a |
      c4\m b\m a\m |
      g2.\m~ g4  \break
    }
    \repeat volta 2 {
      b4\m d\i |
      g2\m~ g8 fs\a |
      e2\m~ e8 d\a |
      d4\m~ d8 e\a d\m c\a |
      b2\m~ b8 d\a |
      c2\m~ c8 d\a |
      c4\m b\m a\m |
      b2.\m~  |
      b4 b\m d\i | \break
      g2\m\~ g8 fs\a |
      a4\m g\m-2 e\m-0 |
      d\m~ d8 e\a d\m c\a |
      b2\m~ b8 d\a |
      c2\m~ c8 d\a |
      c4\m b\m a\m |
      g2.\m~  | g4
    }
  } \\ \relative {
    % accompaniment
    \repeat volta 2 {
      s4 s4 |
      r4 g8\p r d\p r |
      r4 g8 r e r |
      r4 g8-3 r g-3 r |
      r4 g8 r d r |
      r4 fs8 r d r |
      r4 d8 r fs r |
      r4 g8\p r e\p-2 r |
      d8\p r s4 s4 | \break
      r4 g8\p r d\p r |
      r4 g8 r e r |
      r4 g8-3 r g-3 r |
      r4 g8 r d r |
      r4 fs8 r d r |
      r4 d8 r fs r |
      r4 b,8\p r a\p r |
      g8\p r \break
    }
    \repeat volta 2 {
      s4 s4 |
      r4 b'8\p r b\p r |
      r4 c8 r c r |
      r4 g8-3 r g-3 r |
      r4 g8 r d r |
      r4 fs8 r d r |
      r4 d8 r fs r |
      r4 g8\p r e-2\p r |
      d8\p r s4 s4 |
      \break
      r4 e'8\p r e\p r |
      r4 c8\p-1 r c\p-1 r |
      r4 g8-3 r g-3 r |
      r4 g8 r d r |
      r4 fs8 r d r |
      r4 d8 r fs r |
      r4 b,8\p r a\p r |
      g\p r \break
    }
  } >> >>
}


