\include "style.ily"
\version "2.18.2"

\header {
  title = "Double Shuffle"
  composer = "Mel Bay p. 16"
}

\score {

  << \chords {
    s8 | d4 g4 | d2 | a:7 | s | d4 g4 | \break
    d2 | a:7 | d4. s8 | a2:7 | s2 | \break
    s2 | s2 | d4 g4 | d2 | a2:7 | d4. \break
  } \relative {
    \clef "treble_8"
    \partial 8
    \key d \major
    \time 2/4
    \repeat volta 2 {
      fs16\p e\i | d\p fs\i a\m fs\i d\p g\i b\m g\i | d\p fs\i a\m d\i fs\m d\i a\m d\i |
      e\m fs\i g\m fs\i e\m d\i cs\m d\i | e\m d\i cs\m b\i a\m g\i fs\m e\i |
      d\p fs\i a\m fs\i d\p g\i b\m g\i \break
      d\p fs\i a\m d\i fs\m d\i a\m d\i | e\m fs\i e\m d\i cs\m a\i b\m cs\i | d8\m fs16\i e\m d8\i
    }
    \repeat volta 2 {
      cs16\m d\i | e\m a,\i a\m a\i fs'\m a,\i a\m a\i |
      g'\m a,\i fs'\m a,\i e'\m a,\i a\m a\i | \break
      e'\m a,\i fs'\m a,\i g'\m a,\i fs'\m a,\i | e'\m d\i cs\m b\i a\m g\i fs\m e\i |
      d\p fs\i a\m fs\i d\p g\i b\m g\i | d\p fs\i a\m d\i fs\m d\i a\m d\i |
      e\m fs\i e\m d\i cs\m a\i b\m cs\i | d8\m fs16\i e\m d8\i \break
    }
  } >>
}

