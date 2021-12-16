\version "2.18.2"
\include "style.ily"

\header {
  title = "Andantino Op. 35 No. 2"
  composer = "Fernando Sor"
}

{
  \clef "treble_8" \time 3/8 \key c \major 
  <<
    \relative c {
      \repeat volta 2 {
        \partial 8 e'8\M |
        %{1%} f\A d\M b\I | c\A g\M e\I | d\M g\A f\M | e\I g\M e'\A |
        %{5%} g16\M[( f\A)] d8\M b\I | c\M e\A g,\I | a\M d\A b\M | c\I r
      }
      \repeat volta 2 {
        e\A |
        \break
        %{9%} d\M g,\I c\A | b\M g\I e'\A | d\M g,\I c\A | b\M g\I c\A |
        %{13%} d\M g,\I ds'\I | e\M g,\I <e'\A c^\M> | g16\A[( fs\M)] e8\I fs\M | g\I r e\M |
        \break
        %{17%} f\A d\M b\I | c\A g\M e\I | d\M g\A f-4\M | e\I g\M e'\A |
        %{21%} g16\M[( f\A)] d8\M b\I | g'\A e\M c\I | d\M a\I b\M | c\I r
      }
    }
    \\
    \relative c {
      \partial 8 c8 |
      %{1%} d4 f8 | e4 c8 | b4. | c4 c8 |
      %{5%} d4 f8 | e4 e8 | f4 g8 | c,8 r c |
      %{9%} b4 a8 | g4 c8 | b4 a8 | g4 a 8 |
      %{13%} b4 b8 | c4. | <d_\P c'_\I>4 <d_\P c'_\I>8 | <g b> r8  c, | 
      %{17%} d4 f8 | e4 c8 | b4. | c4 c8 |
      %{21%} d4 f8 | e4 e8 | f4 g8 | c,8 r 
    }
  >>
}

%\markuplist { \override-lines #'(baseline-skip . 3) {
%  \vspace #1
%  \wordwrap {
%    From "SOR Complete Studies for Guitar" (Cherici). Notation slightly simplified in places.
%  }
%}
