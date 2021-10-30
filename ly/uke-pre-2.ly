\version "2.18.2"
\include "style.ily"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
    title = "Prelude No. 2"
}

treble =  {
  \time 3/4 \transpose c c'' {
    \key a \minor
    c2.\i | e\m | f\i | e\m | d\i | b,\m | c\i ~ | c | \break
    e\m | g\i | f\m | d\i | c\m | b,\i | c\m ~ | c | \break
    d\i | b,\m | c\i | e\m | d\i | b,\m | c\i ~ | c | \break
    e\m | g\i | f\m | d\i | c\m | b,\i | c\m ~ | c \bar "|."

  }
}

bass =  {
  \time 3/4 \key a \minor
  r4 a4\p a ~ | a a a ~ | a a a ~ | a a a | r e' e' ~ | e' e' e' | r a a ~ | a a a ~ |
  a a a ~ | a a a | r e' e' ~ | e' e' e' | r e' e' ~ | e' e' e'  | r a a ~ | a a a |
  r e' e' ~ | e' e' e' | r a a ~ | a a a | r e' e' ~ | e' e' e' | r a a ~ | a a a ~ |
  a a a ~ | a a a | r e' e' ~ | e' e' e' | r e' e' ~ | e' e' e' | r a a ~ | a2. \bar "|."
  
}

accomp = {
    \time 3/4 \key a \minor
    a2. | c' | a | c' | b | gs | a |  c'4 b a |
    c'2. | e' | d' | b | a | gs | a | c'4 b a |
    b2. | gs | a | c' | b | gs | a | c'4 b a |
    c'2. | e' | d' | b | a | gs | a  ~ | a \bar "|."
}

\score {
  \transpose a g {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \tempo 4 = 120
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
      \new Staff {
        \clef "bass"
        \set Staff.midiInstrument = #"bassoon"
        \new Voice {\accomp}
      }
    >>
  }
  \layout {}
  \midi {}
}


