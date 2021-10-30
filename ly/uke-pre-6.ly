\version "2.18.2"
\include "style.ily"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
    title = "Prelude No. 6"
}

treble =  \relative {
  \time 3/4 \key a \minor \tempo 4 = 120
  r4 c\i d\m | e2.\i | c\m | e\i | c4\m  b\i c\m | d2.\i | \break
  b2.\m | d2.\i | b4\m c\i d\m | e2.\i | c\m | e\i | \break
  e4\m f\i g\m | f2.\i | d\m | f\i | f4\m g\i f\m | e2.\i | \break
  c2.\m | e\i | c4\m b\i c\m | d2.\i | b\m | c\i | a\m \bar"|."
}

bass =  \relative {
  \time 3/4 \key a \minor
  r2. | r4 a,,\p a ~ | a a a ~ | a a a ~ | a2. | r4 e' e ~ |
  e e e ~ | e e e ~ | e2. | r4 a, a ~ | a a a ~ | a a a ~ |
  a2. | r4 d d ~ | d d d ~ | d d d ~ | d2. | r4 a a~ |
  a a a ~ | a a a ~ | a2. | r4 e' e ~ | e e e | r a, a ~ | a2. |
}

atreble = {
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
      %\new Staff {
      %  \set Staff.midiInstrument = #"acoustic guitar (nylon)"
      %  <<
      %    \new Voice {\atreble}
      %  >>
      %}
    >>
  }
  \layout {}
  \midi {}
}

