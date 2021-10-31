\version "2.18.2"
\include "style.ily"

% From First Pieces for Classical Guitar, Joseph Alexander

\header {
  title = "Andante Op. 35 No. 1"
  composer = "Fernando Sor"
}


{
  \clef "treble_8" \time 4/4 \key c \major 
  <<
    \relative c {
      c'4\M g\I c\M e\A | g4\M e\A c\M g\I | a4\M f'\A d\M c\I | b4\M d\A g,2\I |
      c4\M g c e\A | g4\M e\A c\M g\I | a4\M d2\A b4\M | c1\A |
      d2 e | d4 g, g g | d'2 e | d4 g, g g |
      b2 c | d2 e | b4 b c a |  g4 g g g |
      g'2 e | f d | e c | b4 g g g |
      g'2 e | f d | e c | b r |
      c4 g c e | g e c g | a f' d c | b g a b |
      c4 g c e | e a, d f | e c d b | c2.
    }
    \\
    \relative c {
      c1~ | c2. e4 | f1 | g2 r4 f |
      e1~ | e2. e4 | f2\P g\P | c,4\P g'\M e\I c\P |
      b4 g' c, g' | b,1 | b4 g' c, g' | b,1 |
      g4 g' a, g' | b,4 g' c, g' | d2 d | g,1 |
      e'4 g c, g' | d g b, g' | c, g' e g | d1 |
      e4 g c, g' | d g b, g' | c, g' a, g' | g, g' f d |
      c1 | e | f | g2 f |
      e1 | f | g2 g, | c4 <e g> c 
    }
  >>
  r4 |
}

