\version "2.18.2"
\include "style.ily"

\header {
  title = "Robin Reddecke"
}

{
  \clef "treble_8" \time 3/4 \key a \major
  \voices 1,2
  <<
    \relative c' {
      \repeat volta 2 {
        \partial 4 cs8\I( d\M) |
        e4.\A d8\M cs4\I | <d a>4.\I\M-1-4 e8\A fs4\M | e4.\A d8\M cs8\I( b\M) | a4\I^1 a\M^1 cs8\I( d\M) |
        e4.\A d8\M cs4\I | <d a>4.\I\M^1^4 e8\A fs4\M | e4.\A d8\M cs8\I( b\M) | a4\I^1 a\M^1 cs\A |
        b\M b\I cs\M | b\I b\M cs8\I( d\M) | e4.\A d8\M cs8\I( b\M) | a4\I^1 a\M^1 cs\A |
        b\M b\I cs\M | b\I b\M cs8\I( d\M) | e4.\A d8\M cs8\I( b\M) | <a e>4\I\M^1^2 a\M
      }
    }
    \\
    \relative c' {
      s4 | a,2. | d | a | a |
      a | d | e, | a2 a4 |
      e2 a4 | e2. | e | a2 a 4 |
      e2 a4 | e2. | e | a2
    }
  >>
}
