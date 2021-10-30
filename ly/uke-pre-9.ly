\version "2.18.2"
\include "style.ily"

\header {
    title = "Prelude No. 9"
}

\markup{Guitar}

treble = {
  \time 2/4 \key e \minor \tempo 4 = 120
  e,8 g b e' | e, g b e' | e, g c' e' | e, g c' e' | e, a c' e' | e, a c' e' | e, a c' fs' | e, a c' fs' |
  e, a b fs' | e, a b fs' | e, a b g' | e, a b g' | e, a b fs' | e, a b fs' | e, g b e' | e, g b e' | e,2 \bar"|."
}

\score {
  \transpose e e {
    \clef "treble_8" 
    \treble
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
  }
  \layout {}
  \midi {}
}


treble = {
  \time 2/4 \key e \minor \tempo 4 = 120
  e,8 b, g e' | e, b, g e' | e, c g e' | e, c g e' | e, c a e' | e, c a e' | e, c a fs' | e, c a fs' |
  e, b, a fs' | e, b, a fs' | e, b, a g' | e, b, a g' | e, b, a fs' | e, b, a fs' | e, b, g e' | e, b, g e' | e,2 \bar"|."
}


\markup{GDAE}

\score {
  \transpose e g' {
    <<
      \treble
%      \new TabStaff {
%        \set TabStaff.stringTunings = #violin-tuning
%        \treble
%      }
    >>
  }
  \layout {}
  \midi {}
}

