\version "2.18.2"
\include "style.ily"

harmonies = \chordmode {
  \partial 2.
  s2. g1 s d s a s d s g s d s a s d
}

\score {
  \header {piece = "This Land Is Your Land"}
  \transpose d d'' {
    <<
      \context ChordNames \harmonies
      \context Staff {
        \time 2/2 \key d \major \relative {
          \partial 2. d4\i e\m fs\i |
          <g\m b,\i g,\p>2 g2\m ~ | g4 g\a d\m e\i |
          <fs\m a,\i d,\p>2 fs2\m ~ | fs4 a,\i d\m fs\a |
          <e\m a,\i e\p>2 e2\m ~ | e4 e8\i e\m d4\i e\m |
          <fs\m a,\i d,\p>2 fs2\m ~ | fs4 d8\i d\m e4\i fs\m |
          <g\m b,\i g,\p>2 g2\m ~ | g4 g8\i g\m d4\i e\m |
          <fs\m a,\i d,\p>2 fs2\m ~ | fs1 |
          <e\m a,\i e\p>4 e2\a e4\m | cs4.\i a8\m cs4\i e4\m |
          <d\m fs,\i \parenthesize a,\p>1 ~ | d4 \bar"|."
        }
      }
   >>
  }
  \layout {}
  %\midi {}
}

%{

\markup{G Major}

\score {
  \transpose d g' {
    <<
      \context ChordNames \harmonies
      \context Staff {
        \time 2/2 \key d \major \tempo 2 = 120 \relative {
          \partial 2. d4 e fs |
          <g b, d,>2 g2 ~ | g4 g d e |
          <fs a, d,>2 fs2 ~ | fs4 a, d fs |
          <e a, e>2 e2 ~ | e4 e8 e d4 e |
          <fs a, d,>2 fs2 ~ | fs4 d8 d e4 fs |
          <g b, d,>2 g2 ~ | g4 g8 g d4 e |
          <fs a, d,>2 fs2 ~ | fs1 |
          <e a, e>4 e2 e4 | cs4. a8 cs4 e4 |
          <d fs,>1 ~ | d4 \bar"|."
        }
      }
   >>
  }
  \layout {}
  %\midi {}
}

\markup{C Major}

\score {
  \transpose d c'' {
    <<
      \context ChordNames \harmonies
      \context Staff {
        \time 2/2 \key d \major \tempo 2 = 120 \relative {
          \partial 2. d4 e fs |
          <g b, d,>2 g2 ~ | g4 g d e |
          <fs fs, a,>2 fs2 ~ | fs4 a, d fs |
          <e a, e>2 e2 ~ | e4 e8 e d4 e |
          <fs a, d,>2 fs2 ~ | fs4 d8 d e4 fs |
          <g b, d,>2 g2 ~ | g4 g8 g d4 e |
          <fs a, d,>2 fs2 ~ | fs1 |
          <e a, e>4 e2 e4 | cs4. a8 cs4 e4 |
          <d fs, a,>1 ~ | d4 \bar"|."
        }
      }
   >>
  }
  \layout {}
  %\midi {}
}

%}
