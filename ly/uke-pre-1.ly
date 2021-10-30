\version "2.18.2"
\include "style.ily"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
    title = "Prelude No. 1"
}

treble =  {
  \time 4/4 
  \transpose c c'' {
    \key c \major
    e2\i e2\m | f2\i f2 | g2\i g2 | e2\i e2 | \break
    g2\i g2 | f2\i f2 | e2\i e2 | d1\i | \break
    e2\m e2\i | f2\m f2 | g2\m g2 | e2\m e2 | \break
    g2\m g2 | f2\m f2 | e2\m e2 | c2\m c2 \bar "|."
  }
}

bass =  {
  \time 4/4 \key c \major
  r4 g2\p g4 ~ | g4 g2 g4 ~ | g4 g2 g4 ~ | g4 g2 g4 ~ |
  g4 g2 g4 ~ | g4 g2 g4 ~ | g4 g2 g4 | r4 g4 g4 g4 ~ |
  g4 g2 g4 ~ |  g4 g2 g4 ~ | g4 g2 g4 ~ | g4 g2 g4 ~ |
  g4 g2  g4 ~ |  g4 g2 g4 ~ |g4 g2 g4 | r4 g4 r2 \bar "|."
  
}

accomp = {
  \time 4/4 \key c \major
  c2 c | d d | e e | c c |
  e e | d b, | c c | c4 b, b, 2 |
  c2 c | d d | e e | c c |
  e e | d b, | g g | e c \bar "|."
}

\score {
  \transpose c c {
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

