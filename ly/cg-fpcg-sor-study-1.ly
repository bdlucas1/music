\version "2.18.2"
\include "style.ily"

% From First Pieces for Classical Guitar, Joseph Alexander

\header {
  title = "Study No. 1"
  composer = "Sor/FPCG"
}


{
  \clef "treble_8" \time 4/4 \key c \major 
  <<
    \relative c {
      c'4 g c e | g4 e c g | a4 f' d c | b4 d g,2 | c4 g c e | \break
      g4 e c g | a4 d2 b4 | c1 | d2 e | d4 g, g g | \break
      d'2 e | d4 g, g g | b2 c | d2 e | b4 b c a | \break
      g4 g g g | g'2 e | f d | e c | b4 g g g | \break
      g'2 e | f d | e c | b r | \break
      c4 g c e | g e c g | a f' d c | b g a b | \break
      c4 g c e | e a, d f | e c d b | c2. \break
    }
    \\
    \relative c {
      c1~ | c2. e4 | f1 | g2 r4 f | e1~ |
      e2. e4 | f2 g | c,4 g' e c | b4 g' c, g' | b,1 |
      b4 g' c, g' | b,1 | g4 g' a, g' | b,4 g' c, g' | d2 d |
      g,1 | e'4 g c, g' | d g b, g' | c, g' e g | d1 |
      e4 g c, g' | d g b, g' | c, g' a, g' | g, g' f d |
      c1 | e | f | g2 f |
      e1 | f | g2 g, | c4 <e g> c 
    }
  >>
  r4 |
}

