\version "2.18.2"
\include "style.ily"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
    title = "Prelude No. 5"
}

treble =  {
  \time 4/4 \key a \minor \tempo 4 = 120
  c2\i c\m | e\i c\m | d\i c\m | b,2.\i c4\m | \break
  d2\i d\m | f\i d\m | e\i d\m | c1\i | \break
  e2\m e\i | g\m e\i | f\m e\i | d2.\m c4\i |  \break
  b,2\m b,\i | d\m b,\i | c\m a,\i a,1\m \bar"|."
}

bass =  {
  \time 4/4 \key a \minor
  r4 a,,2\p a,,4 ~ | a,, a,,2 a,,4 | r4 e,2 e,4 ~ | e, e, e,2 ~ |
  e,4 e,2 e,4 ~ | e,4 e,2 e,4 | r4 a,,2 a,,4 ~ | a,,4 a,, a,, a,, ~ |
  a,, a,,2 a,,4 ~ | a,, a,,2 a,,4 | r4 d,2 d,4 ~ | d, d, d,2 |
  r4 e,2 e,4 ~ | e, e,2 e,4 | r4 a,,2 a,,4 ~ | a,, a,, a,,2 |
}

atreble = {
    \time 4/4 \key a \minor
    \parenthesize a,2 \parenthesize a, | \parenthesize c \parenthesize a, |
    \parenthesize b, \parenthesize a, | \parenthesize gs,2. \parenthesize a,4 |
    \parenthesize b,2 \parenthesize b, | \parenthesize d \parenthesize b, |
    \parenthesize c \parenthesize b, | \parenthesize a,1 |
    \parenthesize c2 \parenthesize c | \parenthesize e \parenthesize cs |
    \parenthesize d \parenthesize c | \parenthesize b,2. \parenthesize a,4 |
    \parenthesize gs,2 \parenthesize gs, | \parenthesize b, \parenthesize gs, |
    \parenthesize a, \parenthesize a, | \parenthesize a,1 |
}

\score {
  \transpose a g'' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {
            \voiceOne
            <<
              \treble
              \transpose c c' \atreble
            >>
          }
          \new Voice {\voiceTwo \bass}
        >>
      }
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\atreble}
        >>
      }
    >>
  }
  \layout {}
  \midi {}
}

