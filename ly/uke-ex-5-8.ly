\paper {
  ragged-right = ##f
  ragged-last = ##f
  markup-system-spacing #'basic-distance = 8\mm
}

\include "definitions.ily"

\header {
    title = #(string-append "Ukelele (" tuning ") Exercises 5-8")
}

\layout { indent = 0 }


\markup {
    \vspace #2
    Thumb plays free strokes.
}

\markup {
    \vspace #1
    Exercise 5
}

\transpose c c' {
    \U^"p" \U \U \U | \V \V \V \V | \W \W \W \W | \V \V \V \V  | \break
    \U \V \U \V | \W \V \W  \V | \U \U \U \U | \V \V \V \V  \bar "|."
}

\markup {
    \vspace #3
    Exercise 6
}

\transpose c c' {
    \time 3/4
    \V^"p" \U \V | \V2 \V4 | \W \V \W | \W2 \W4 | \break
    \V \U \V | \W2 \V4 | \U \U \U | \V2.  \bar "|."
}

\markup {
    \vspace #3
    Exercise 7 
}

\transpose c c' {
    \U4^"p" \U \U2 | \V4 \V \V2 | \W4 \W \W2 | \X2 \X4 \X | \break
    \Y \Y \Y \Y | \Z \Z2 \Z4 | \Y \Y \Y \Y | \X1 | \break
    \W4 \W \W2 | \V \V4 \V | \U2 \U | \V \V \bar "|."
}


\markup {
    \vspace #3
    Exercise 8
}

\transpose c c' {
    \time 3/4           
    \X4^"p" \U \X | \X2 \Y4 | \Y4 \Z \Y | \Z2 \Y4 | \break
    \Y4 \X \Y | \X2 \X4 | \U4 \U \U | \X2. \bar "|."
}

\version "2.18.2"


