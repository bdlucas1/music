\version "2.18.2"
\include "style.ily"

\header {
  title = "Andantino Op. 35 No. 3"
  composer = "Fernando Sor"
}

brka={}
brkb={}

{
  \clef "treble_8" \time 3/4 \key c \major 
  \voices 1,2,4
  <<
    \relative c' {
      \repeat volta 2 {
        \partial 4 e8. e16 |
        %{1%} e4 d c | c b f'8. f16 | f4 e d | \brka d c e8. e16 | \brkb
        %{5%} e4 f fs | g f! e | e8. d16 c4 b \brka | c2
      }
      \repeat volta 2 {
        e8.^"III" e16 |  \brkb
        %{9%} e4 e e | g d d8.^"I" d16 | d4 d d | \brka f2 f8. f16 | \brkb
        %{13%} f4 f f | e b e8. d16 | \acciaccatura d8 c8. b16 c4 d | e2 e8. e16 | \brka \brkb
        %{17%} e4 d c | c b f'8. f16 | \appoggiatura {e32 f g} f4 e d | d c e8. e16 | \brka \brkb
        %{21%} f4 fs8. fs16 g4 | gs a g8. f16 | e8. d16 c4 b | a2
      }
    }
    \\
    \relative c' {
      %\override Stem.note-collision-threshold=#1
      %\override Stem.length=2
      %\override Stem.details.beamed-lengths=#'(1) %??? doesn't work??
      %\override Stem.details.stem-shorten=#'(1) %??? doesn't work??
      \partial 4 c4 |
      %{1%} c b a | a gs d' | d c b | b a r |
      %{5%} c2 c4 | b2 c4 | a g d | e2 r4 |
      %{9%} c' c c8. c16 | b4 r r | bf bf bf8. bf16 | a2 a4 |
      %{13%} a4 b a | gs2 gs4 | a2 a4 | gs2 r4 |
      %{17%} c4 b a | a gs d' | d c b | b a c~ |
      %{21%} c4 c8. c16 b4 | d c e8. d16 | c8. b16 a4 gs4 a2 
    }
    \\
    \relative c {
      \override NoteColumn.force-hshift = 0
      \partial 4 r4 |
      %{1%} a2. | e2 s4 | e2. | a2 s4 |
      %{5%} a'2 af4 | g2 a!4 | f e g, | c2 s4
      %{9%} c2 c4 | g4 s4 s4 | bf2 bf4 | f2 f'4 |
      %{13%} d2 d4 | e2 e,4 | a2 f4 | e4 e' s4 |
      %{17%} a,2. | e2 s4 | e2. | a2 a'4~ |
      %\override NoteColumn.force-hshift = -1
      %{21%} a4 d, g | e8. e16 f4 d | e4 s4 e,4 | a2
    }
  >>
}
