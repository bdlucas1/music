\version "2.18.2"
\include "style.ily"

\header {
  title = "Andante Op. 60 No. 14"
  composer = "Fernando Sor"
}

{
  \clef "treble_8" \time 3/4 \key g \major 
  <<
    \relative g {
      \repeat volta 2 {
        %{1%} <b g>4 e <b g> | \acciaccatura d8 <c a>4 <b g> r | b f' a, | a g r |
        %{5%} <b g> e <b g> | \acciaccatura d8 <c a>4 b e~ | e g, a |
      }
      \alternative { {<b ds,>2 r4} {<b ds,>2 r4} } |
      \break
      \repeat volta 2 {
        %{9%} b4 e e | <c e> <b d> <a c> | b fs' e8 b | d2 c4 |
        %{13%} <a c> <a c> <a c> | <b a>2 <b g~>4 | <e g,> <e g,> <e g,> | ds b a
        \break
        %{17%} <b g> e <b g> | \acciaccatura d8 <c a>4 <b g> r | b fs' a, | a g r
        %{21%} <b g> e <b gs_~> | <d gs,>8 gs, <c a>4 r |
               <g b>8. e'16 <g b,>4 <fs a,>4 | <e g,>2 r4 |
      }
    }
    \\
    \relative g {
      \repeat volta 2 {
        %{1%} g,2. | g2 e'4 | ds2. | e2 r4 |
        %{5%} g,2. | g2 r4 | c2. |
      }
      \alternative { { r8 b4 a8 g8 fs8 } { r4 b a } }
      %{9%} gs2. | a | d8 a'4 a8 <gs e>4 | a,8 e' gs e a4
      %{13%} a, c e | ds b e8 d | c4 b as | <fs' b,>2.
      %{17%} e,2.~ | e2 e'4 | ds2. | e2 r4 |
      %{21%} e,2. | a2 a4 | b2 d4 | e e, r |
    }
  >>
}

\markuplist { \override-lines #'(baseline-skip . 3) {
  \vspace #1
  \wordwrap {
    From "SOR Complete Studies for Guitar" (Cherici). Voicing notation simplified in places.
  }
}}

%  full version of 11-12
%      <<
%        {
%          \voiceFour
%          \once \override Rest #'extra-offset = #'(1.5 . 0) g'8\rest a4 a8 gs4 |
%          \once \override NoteColumn #'padding = #'2
%          e8\rest e gs e a4
%        }
%        \new Voice {
%          \voiceTwo
%          d,2 e 4 | a,2.
%        }
%      >>


