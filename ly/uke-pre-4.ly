\version "2.18.2"
\include "style.ily"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
    title = "Prelude No. 4"
}

treble =  {
  \time 4/4 \key a \minor \tempo 4 = 120
  e4\i e\m d\i c\m | d2\i b,\m | d4\i d\m c\i b,\m | c2\i e\m | e4\i e\m d\i c\m | d2\i b,\m|\break
  d4\i d\m c\i b,\m | c1\i | g4\m g\i f\m e\i | f2\m d\i | f4\m f\i e\m d\i | e2\m c\i | \break
  g4\m g\i f\m e\i | f2\m d\i | f4\m f\i e\m d\i | e1\m | c4\i c\m d\i e\m | d2\i f\m | \break
  b,4\i b,\m c\i d\m | d2\i e\m | c4\i c\m d\i e\m | d2\i e\m | f4\i e\m b,\i d\m | c1\i \bar"|."
}

bass =  {
  \time 4/4 \key a \minor
  r1 | r4 e,2 e,4 ~ | e,1 | r4 a,,2 a,,4 ~ | a,,1 | r4 e,2 e,4 ~ |
  e,1 | r4 a,,4 a,, a,, ~ | a,,1 | r4 d,2 d,4 ~ | d,1 | r4 a,,2 a,,4 ~ |
  a,,1 | r4 d,2 d,4 ~ | d,1 | r4 e, e, e, | r1 | r4 e,2 e,4 ~ |
  e,1 | r4 a,,2 a,,4 ~ | a,,1 | r4 e,2 e,4 ~ | e,1 | r4 a,, a,,2 |
}

atreble = {
    \time 4/4 \key a \minor
    r4 c b, a, | b,2 gs, | r4 b, a, gs, | a,2 c | r4 c b, a, | b,2 gs, |
    r4 b, a, gs, | a,2 c4 d4 | r4 e d cs | d2 b,2 | r4 d c b, | c2 a, |
    r4 e d cs | d2 b,2 | r4 d c b, | gs,2 b, | r4 a, b, c | b,2 d |
    r4 gs, a, b, | a, 2 c | r4 a, b, c | b,2 gs, | r4 gs, gs,2 | a,1 |
}

abass = {
    \time 4/4 \key a \minor
    a,,1 | s | e, | s | a,, | s |
    e, | s a,, | s d, | s |
    a,, | s | d, | s | a,, | s |
    e, | s | a,, | s e, | s |
}

\score {
  \transpose a g'' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \atreble}
          \new Voice {\voiceTwo \abass}
        >>
      }
    >>
  }
  \layout {}
  \midi {}
}

