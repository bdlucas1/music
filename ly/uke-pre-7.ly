\version "2.18.2"
\include "style.ily"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
    title = "Prelude No. 7"
}

treble =  {
  \time 4/4 \key g \major \tempo 4 = 120
  b4\i c'\m d'\i b\m | d'\i b\m c'\i a\m | b\i c'\m d'\i b\m | \break
  d'\i c'\m b\i g\m | g'\i b\m e'\i d'\m | c'\i d'\m b\i a\m | \break
  g'\i b\m e'\i d'\m | c'\i d'\m  b\i g\m | b\i c'\m d'\i b\m | \break
  d'\i b\m c'\i a\m | b\i c'\m d'\i b\m | d'\i c'\m b\i g\m \bar"|."
}

bass =  {
  \time 4/4 \key g \major \tempo 4 = 120
  b8 d\p c' d d' d b d | d' d b d c' d a d | b d c' d d' d b d | \break
  d' d c' d b d g d | g' d b d e' d d' d | c' d d' d b d a d | \break
  g' d b d e' d d' d | c' d d' d b d g d | b d c' d d' d b d | \break
  d' d b d c' d a d | b d c' d d' d b d | d' d c' d b d g,4 \bar"|."
}

\score {
  \transpose g g' {
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


treble =  {
  \time 4/4 \key g \major \tempo 4 = 120
  b4\i c'\m d'\i b\m | d'\i b\m c'\i a\m | b\i c'\m d'\i b\m | \break
  d'\i c'\m b\i g\m | g'\i b\m e'\i d'\m | c'\i d'\m b\i a\m | \break
  g'\i b\m e'\i d'\m | c'\i d'\m  b\i g\m | b\i c'\m d'\i b\m | \break
  d'\i b\m c'\i a\m | b\i c'\m d'\i b\m | d'\i c'\m b\i <g b,>\i\m \bar"|."
}

bass =  {
  \time 4/4 \key g \major \tempo 4 = 120
  b8 d,\p c' d, d' d, b d, | d' d, b d, c' d, a d, | b d, c' d, d' d, b d, | \break
  d' d, c' d, b d, g d, | g' d, b d, e' d, d' d, | c' d, d' d, b d, a d, | \break

  g' d, b d, e' d, d' d, | c' d, d' d, b d, g d, | b d, c' d, d' d, b d, | \break
  d' d, b d, c' d, a d, | b d, c' d, d' d, b d, | d' d, c' d, b d, d,4 \bar"|."
}

\score {
  \transpose g c'' {
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

