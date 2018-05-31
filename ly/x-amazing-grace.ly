\version "2.18.2"
\include "style.ily"

harmonies = \chordmode {
  \time 3/4 \key d \major {
    \partial 2. s4 | d2. | s | g | d | s | s | a |
                 s | d   | s | g | d | s | s | d \bar"|."
  }
}

\score {
  \header {piece = "Amazing Grace"}
  \transpose g g' {
    <<
      \context ChordNames \harmonies
      \context Staff {
        \time 3/4 \key d \major {
          \partial4 a4\i |
          <d'\m fs\i>2 \triplet fs'8\i e'\m d'\i |
          <fs'\m a\i d\p>2 e'4\m | <d'\m d\i g,\p>2 b4\i |
          <a\m d\i a,\p>2 a8\i d'\m | <d'\m fs\i>2 \triplet fs'8\i e'\m d'\i |
          <fs'\m a\i d\p>2 e'8\i fs'\m | <a'\m a\i e\p>2. | \break
          r2 fs'8\i a'\m |  <a'\m a\i d\p>2 a'8\m fs'\i |
          <d'\m fs\i>2 fs'8\i e'\m |  <d'\m d\i g,\p>2 b4\i |
          <a\m d\i a,\p>2 a8\i d'\m | <d'\m fs\i>2 \triplet fs'8\i e'\m d'\i |
          <fs'\m a\i a,\p-2>2 e'4\m | <d'\m fs\i \parenthesize a,\p>2 \bar "|." \break
        }
      }
    >>
  }
  \layout {}
  %\midi {}
}

