\version "2.18.2"
\include "style.ily"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
    title = "Prelude No. 12"
}

\markup{GDAE}

treble = {
  \time 4/4 \key c \major \tempo 4 = 120
  
}

\score {
  \transpose c c' {
    \clef "treble" 
    \treble
    \voiceOne
    e8\p c'\a c'\m c'\i e c' c' c' | f d' d' d' f d' d' d' | d b b b d b b b | e c' c' c' e c' c' c' | \break
    g e' e' e' g e' e' e' | a f' f' f' a f' f' f' | g e' e' e' f d' d' d' | e c' c' c' e c' c' c' | \break
    e g' g' g' e g' g' g' | d g' g' g' d f' f' f' | a f' f' f' a f' f' f' | g f' f' f' g e' e' e' | \break
    a e' e' e' g e' e' e' | f e' e' e' f d' d' d' | d c' c' c' d b b b | e c' c' c' <<e2 c'>> | \break
  }
  \layout {}
  \midi {}
}


