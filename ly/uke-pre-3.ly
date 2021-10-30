\version "2.18.2"
\include "style.ily"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
    title = "Prelude No. 3"
}

treble =  {
  \time 4/4 \transpose c c'' {
    \key a \minor
    c1\i | e2\m c \i | d1\m | b,2\i d\m | \break
    c1\i | e2\m g\i | f1\m | d2\i f\m | \break
    e1\i | e2\m c\i | d1\m | b,2\i d\m | \break
    c1\i | b,2\m d\i | c1\m | r1 \bar"|."
  }
}

bass =  {
  \time 4/4 \key a \minor
  r4 a\p a a~ | a a2 a4 | r e' e' e' ~ | e' e'2 e'4 |
  r a a a ~ | a a2 a4 | r d' d' d' ~ | d' d'2 d'4 |
  r a a a ~ | a a2 a4 | r e' e' e' ~ | e' e'2 e'4 |
  r4 a a a | r e'2 e'4 | r a a a | a1 \bar"."
}

accomp = {
    \time 4/4 \key a \minor
    a4 b c' b | c'2 a | b4 a gs a | gs2 b |
    a4 b c' b | c'2 e' | d'4 c' b c' | b2 d' |
    c'4 b a b | c'2 a | b4 a gs a | gs2 b |
    a2 b4 a | a gs2 b4 | a2 c' | a1 \bar"|."
}

\score {
  \transpose a g {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        \tempo 4 = 120
        <<
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
      \new Staff {
        \clef "bass"
        \set Staff.midiInstrument = #"bassoon"
        \transpose c c, {
          \new Voice {\accomp}
        }
      }
    >>
  }
  \layout {}
  \midi {}
}


