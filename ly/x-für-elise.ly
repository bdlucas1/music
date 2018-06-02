\version "2.18.2"
\include "style.ily"

\header {
    title = "Für Elise"
    composer = "Ludwig van Beethoven"
}


treble =  {
  \time 3/4 \key a \minor \tempo 4 = 120 \relative {
    \set Timing.beamExceptions = #'()
    \partial 4 e8 ds | \repeat volta 2 {e ds e b d c | a4. c,8 e a | b4. e,8 gs b | c4 r8 e,8 e' ds | \break
    e ds e b d c | a4. c,8 e a | b4. e,8 c' b |} \alternative {{a4 r e'8 ds | \break}
    {a4 r8 b c d |}} \repeat volta 2 {e4 r8 g, f' e | d4 r8 f,8 e'8 d | c4 r8 e,8 d' c | \break
    b4. e,8 e'8 e, | e' e e ds e ds | e ds e b d c | a4. c,8 e a | \break
    b4. e,8 gs b | c4 r8 e, e' ds | e ds e b d c | a 4. c,8 e a | \break
    b4. e,8 c' b |} \alternative {{a4 r8 b c d |} {a2.|}}
  }
}

bass =  {
  \relative {
    \partial 4 s4 | s2. | <<c,4. e>> s4. | <<b4. gs'>> s4. | <<c,4. e>> s4. |
  }
}

music = \transpose g g'' {
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
    <<
      \new Voice {\voiceOne \treble}
      \new Voice {\voiceTwo \bass}
    >>
  }


\score {
  \music
  \layout {}
}

\score {
  \unfoldRepeats \music
  \midi {}
}
