\include "style.ily"
\version "2.18.2"

\score {

  \header {
    piece = "Big Chief"
    tag = "Mel Bay p. 13"
  }

  << \chords {
    d2.:min s a:7 s d:min \break
    s a:7 d:min c:7 f \break
    c:7 f c:7 f c:7 f \break
  } \relative {
    \clef "treble_8"
    \key d \minor
    \time 6/8
    \repeat volta 2 {
      a8\i d\m e\a f\i e\m d\i | a'\a d,\i e\m f\i e\m d\i | e\m cs\i a\m e'\i cs\m a\i |
      a'\m-3 bf\a-4 a\m-3 g\m f\i e\m | a,\i d\m e\a f\i e\m d\i | \break
      a'\a d,\i e\m f\i e\m d\i | a'\m-4 bf\a-4 a\m-4 a4\a g8\m | f\i d\i d\m d\i r4 
    }
    \repeat volta 2 {
      <c\m g\i>4. <bf\m g\i> | a8\i c\m f\i a\m f\i c\m | \break
      bf\i c\m e\i g\m e\i c\m | a\i c\m f\i a\m f\i d\m | <c\m g\i>4. <bf\m g\i> |
      a8\i c\m f\i a\m f\i c\m | bf\i c\m e\i g\m e\i c\m |
      f\i c\m a'\i <f\m a,\i>4 r8 |
    }
  } >>
}

