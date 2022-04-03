\version "2.18.2"
\include "style.ily"

\header {
  title = "Midnight Diner theme"
  composer = ""
}

"X" = -\finger\markup\text\italic\fontsize #3 " a "
"MA" = {c8\I e4\A b8\M d\A b\M a4\I g8\M g\I a\M b\A}
"MB" = {c8\M e4\A b8\M d\A b\M a4\I c8\M e\A a,\I b\M}
"MC" = {c8\I g'4\A g\M b,8\I a\M f\I g\M g\I c\M b\I}
"MD" = {a8\M a\I g\M e\I g\M b\A a\M a\I c\M e\A \noBeam a,\I b\M}




{
  \transpose c c {

    %\clef "treble_8" \time 12/8 \key c \major 
    
    \clef "treble_8" \time 3/4 \key c \major 
    \set Timing.beamExceptions = #'() % for 3/4 time
    \set Timing.baseMoment = #(ly:make-moment 1/4)
    \set Timing.beatStructure = 1,1,1
    <<
      \relative c' {
        \partial 4 a8\I b\M |

        \repeat volta 2 {
          %{1%} \MA | \MB | \MC | \MD | \break
          %{5%} \MA | \MB | \MC | \MD | \break
          %{9%} c8\I g'4\A g\M b,8\I a\M f\I g\M g\I a\M b\A |
                c\I g'4\A g\A e8\I a,8\M f\I g\M g\I a\M b\A | \MC | \MD | \break
        }

        %{13%} \MA | \MB | \MC | a\M a\I g\M c\A g\I b\M a2.\I |
      }
      \\
      \relative c {
        \partial 4 s4 |

        %{1%}  r4 c2~ c8 a2~ a8 | r4 c2~ c8 a2~ a8 | r4 c b a2. | s1. |
        %{5%}  r4 c2~ c8 a2~ a8 | r4 c2~ c8 a2~ a8 | r4 c b a2. | s1. |
        %{9%}  r4 c b a2.       | r4 c b a2.       | r4 c b a2. | s1. |

        %{13%} r4 c2~ c8 a2~ a8 | r4 c2~ c8 a2~ a8 | r4 c b a2. | s1. |
      }
    >>
  }
}

