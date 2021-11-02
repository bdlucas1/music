\version "2.18.2"
\include "style.ily"

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
      c4\M g c e\A | g\M e\A c g | a\M f'\A d c | b\M g a b\A |
      c4\M g c e\A | e\M a, d f\A | e\M c\I d\M b\I | c2.\A
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
      e1 | f | g2 g,-2 | c4\P <e g>\M\I c\P
    }
  >>
  r4 |
}

\markuplist { \override-lines #'(baseline-skip . 3) {
  \vspace #1
  \wordwrap {
    Fingerings from Easy Classical Guitar Vol. 1, Bradford Werner, with some modifications.
  }
  \vspace #0.7
  \wordwrap {
    Music from ECGMV1 and First Pieces for Classical Guitar, Joseph Alexander.
  }
  \vspace #0.3
  \wordwrap {
    Is the voicing (stem direction) in measure 4 correct?
    \score {
      \layout { ragged-right = ##t }
      <<
        \relative c'' {b4\M d\A g, f\P}
        \\
        \relative c'' {g2\P g\I}
      >>
    }
  }
  \vspace #0.3
  \wordwrap {
    Is the e in measure 30 correct?
  }
}}
