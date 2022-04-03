\version "2.18.2"
\include "style.ily"

\header {
  title = "Greensleeves"
  %composer = "Fernando Sor"
}

%brk={}

{
  %\override Score.SpacingSpanner.strict-note-spacing = ##t
  \clef "treble_8" \time 6/8 \key a \minor
  \voices 1,2,4
  <<
    \relative c' {
      \repeat volta 2 {
        \partial 8 a8 | c4 d8 <e c>8. f16 e8 | d4 b8 g8. a16 b8 | <c a>4 a8 a8. gs16 a8 | b4 gs8 e4 a8 | \break
        c4 d8 <e c>8. f16 e 8 | d4 b8 g8. a16 b8 | c8. b16 a8 gs8. fs16 gs8 |
      }
      \alternative { { a2. } { a2. } }
      \repeat volta 2 {
        g'4. g4 fs16( e) | d4 b8 g8. a16 b8 | c4 a8 a8. gs16 a8 | b4 gs8 e4. | \break
        g'4. g4 fs16( e) | d4 b8 g8. a16 b8 | c4 a8 gs8. fs16 gs8 | a2.^"                         "
        
      }
    }
    \\
    \relative c' {
      \partial 8 s8 | a4. s4. | g4. d4. | s4. s4. | s4. s4. | \break
      a'4. s4. | g4. d4. | a'4. s4. | e4. e4. | e4. e4. |
      <b' g>4. <b g>4. | g4. d4. | a'4. s4. | s4. s4. |
      <b g>4. <b g>4. | g4. d4. | a'4. s4. | e2. |
    }
    \\
    \relative c' {
      \override NoteColumn.force-hshift = 0
      \partial 8 s8 | a,4. c | g g | a a | e~ e8 e4 |
      a4. c4. | g4. g4. | a4. e4. | a2. | a 2. |
      g4. g4. | g4. g4. | a4. a4. | e4.~ e4 e8 |
      g4. g4. | g4. g4. | a4. e4. | g2. |
    }
  >>
}
