\version "2.18.2"
\include "style.ily"

\header {
  title = "Midnight Diner theme"
  composer = ""
}

{
  \transpose c c {
    \clef "treble_8" \time 12/8 \key c \major 
    <<
      \relative c' {
        \partial 4 a8 b | c e4 b8 d b a4 g8 g a b | c e4 b8 d b a4 c8 e a, b |
        c8 g'4 g b,8 a f g g c b | c e4 b8 d b a4 g8 g a b | \break
        c e4 b8 d b a4 c8 e a, b | c8 g'4 g b,8 a f g g c b |
        a a g e g b a a c e a, b |
      }
      \\
      \relative g {
      }
    >>
  }
}

