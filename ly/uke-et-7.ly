\version "2.18.2"
\include "style.ily"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
    title = "Etude No. 7"
}

\score {
  \transpose c c' {
    \time 4/4 \key c \major \tempo 4 = 120 \voiceOne
    c4\p e'\m e'\i c\p | e c' c' e | d b b d | b, d' d' b, | d f' f' d | \break
    f d' d' f | e c' c' e | c e' e' c | e g' g' e | a, c' c' a, | \break
    d f' f' d | b, d' d' b, | c e' e' e | f d' d' b, | c\p c'\m g\i e\p | c1 |
  }
  \layout {}
  \midi {}
}





