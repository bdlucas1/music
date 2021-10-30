\version "2.18.2"
\include "style.ily"

\header {
    title = "Prelude No. 11"
}

\markup{GDAE}

treble = {
  \time 6/8 \key c \major \tempo 4 = 120
  
}

\score {
  \transpose c c' {
    \clef "treble" 
    \treble
    \voiceOne
    e8 c' c' e c' c' | f d' d' f d' d' | d b b d b b | e c' c' e c' c' | \break
    g e' e' g e' e' | a f' f' a f' f' | g e' e' f d' d' | e c' c' e c' c' | \break
    e g' g' e g' g' | d g' g' d f' f' | a f' f' a f' f' | g f' f' g e' e' | \break
    a e' e' g e' e' | f e' e' f d' d' | d c' c' d b b | e c' c' c'4. | \break
  }
  \layout {}
  \midi {}
}


