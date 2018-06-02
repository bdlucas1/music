\version "2.18.2"
\include "style.ily"

\header {
    title = "If I Had a Hammer"
    composer = "Pete Seeger"
}

harmonies = \chordmode {
  \time 4/4 \key c \major {
    s1 c f c s s s g g:7 c s a:min s f2 c f c s f g1:7 c
  }
}

dx-d = \makechord \absolute < d' fs a, >
fsx-d = \makechord \absolute < fs' a d \parenthesize a, >
ax-d = \makechord \absolute < a' d' fs \parenthesize a, >
a-d = \makechord \absolute < a d a, >

dx-g = \makechord \absolute < d' g b, >
b-g = \makechord \absolute < b d g, >

fsx-a = \makechord \absolute < a' cs' e \parenthesize a, >

%%%

gx-c = \makechord \absolute < g' c' e g, >
ax-f = \makechord \absolute < a' c' f a, >
ex-c = \makechord \absolute < e' c' e g, >
cx-c = \makechord \absolute < c' e g, >
gx-c = \makechord \absolute < g' c' e g, >
gx-g = \makechord \absolute < g' b d g, >
cxx-c = \makechord \absolute < c'' e' \parenthesize g \parenthesize e g, >
ax-c = \makechord \absolute < a' c' e g, >
gx-f = \makechord \absolute < g' c' f a, >

melody =  {
  \time 4/4 \key c \major \tempo 4 = 120 \relative {
    r4 c'4 e8 g e4 | \gx-c 2 g2 | r4 \ax-f 4 a8 g e c | \ex-c 2 \cx-c 2 | \break
    r4 \cx-c 4 e8 g g e | \gx-c 2 g2 | r4 a a8 g a4 | \gx-g 1 | r4 \gx-g 4 a8 g a4 | \break
    \cxx-c 4. a8 c2 | r4 \ax-c 4 a8 g e c | \ex-c 2 e2 | r4 \ax-c 4 a8 a g4 | \break
    \ax-f 4. a8 \gx-c 4. g8 | \ax-f 8 a8 a a \gx-c 4 g4 | r4 a \gx-f 2 | \gx-g 2 g8 g g4 | \ex-c 1 \bar"|."
  }
}

\markup {GDAE}

\score {
  \transpose c c' {
    <<
      \context ChordNames \harmonies
      \context Staff \melody
      \set Staff.midiInstrument = #"acoustic guitar (nylon)"
    >>
  }
  \layout {}
  %\midi {}
}

