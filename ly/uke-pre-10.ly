\version "2.18.2"
\include "style.ily"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\header {
    title = "Prelude No. 10"
}

\markup{Guitar}

treble = {
  \time 3/4 \key e \minor \tempo 4 = 120
  e,8 g b e' b g | e, g b e' b g | e, g c' e' c' g | e, g c' e' c' g | \break
  e, a c' e' c' a | e, a c' e' c a | e, a c' fs' c' a | e, a c' fs' c' a | \break
  e, a b fs' b a | e, a b fs' b a | e, a b g' b a | e, a b g' b a | \break
  e, a b fs' b a | e, a b fs' b a | e, g b e' b g | e, g b e' ~ e' 4 \bar"|."
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
  \time 3/4 \key e \minor \tempo 4 = 120
  e,8\p b,\i g\m e'\a g\m b,\i | e, b, g e' g b, | e, c g e' g c | e, c g e' g c | \break
  e, c a e' a c | e, c a e' a c | e, c a fs' a c | e, c a fs' a c | \break
  e, b, a fs' a b, | e, b, a fs' a b, | e, b, a g' a b, | e, b, a g' a b, | \break
  e, b, a fs' a b, | e, b, a fs' a b, | e, b, g e' g b, | e, b, g e' ~ e'4 \bar"|."
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

