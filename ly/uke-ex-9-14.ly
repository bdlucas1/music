\paper {
  ragged-right = ##f
  ragged-last = ##f
  markup-system-spacing #'basic-distance = 8\mm
}

\include "definitions.ily"

\header {
    title = #(string-append "Ukelele (" tuning ") Exercises 9-14")
}

\layout { indent = 0 }

\paper {
  page-count = #1
}    


\markup {
    \vspace #2
    Alternating thumb and finger.
}

\markup {
    \vspace #1
    Exercise 9
}

\transpose c c' {
    \Z^"a" \U_"p" \Z \U | \Z \U \Z \U | \Y^"m" \U \Y \U | \Y \U \Y \U |
    \X^"i" \U \X \U | \X \U \X \U | \X \U \Y \U | \Y \U \Y \U | \break
    \Y \U \Z \U | \Z \U \Z \U | \Y \U \Z \U | \Y \U \Y \U |
    \X \U \Y \U | \X \U \Y \U | \Y \U \Z \U | \Z \U \U \U \bar "|."
}

\markup {
    \vspace #3
    Exercise 10
}

\transpose c c' {
    \V_"p" \Z^"a" \V \Z | \V \Z \V \Z | \U \Z \U \Z | \U \Z \U \Z |
    \V \Z \V \Z | \V \Z \V \Z | \W \Z \W \Z | \W \Z \W \Z | \break
    \V \Z \V \Z | \U \Z \U \Z | \V \Z \V \Z | \W \Z \W \Z |
    \U \Z \V \Z | \U \Z \U \Z | \V \Z \U \Z | \V1 \bar "|."
}

\markup {
    \vspace #2
    Alternating fingers (complete the fingering).
}

\markup {
    \vspace #1
    Exercise 11
}

\transpose c c' {
    \Z4^"i" \Z^"m" \Z \Z | \Y^"i" \Y^"m" \Y \Y | \X^"i" \X^"m" \X \X | \X^"i" \Y^"m" \Y \Y |
    \Y^"i" \Z^"m" \Z \Z  | \Y^"i" \Z^"m" \Y \Y | \X^"i" \Y^"m" \X \Y | \Y^"i" \Z^"m" \Z \Z \bar"|."
}

\markup {
    \vspace #3
    Exercise 12
}

\transpose c c' {
    \Z2^"i" \Z^"m" | \Y \Y | \X \X | \X \Y \X \Y \Y \Z \Y \Z \Z1 \bar "|."
}

\markup {
    \vspace #3
    Exercise 13 
}

\transpose c c' {
    \Z4^"i" \Z^"m" \Z2 | \Z4 \Y4 \Y2 | \X4 \Y4 \X2  |
    \Y1  | \X4 \X4 \X2 |  \Y4 \Y4 \Y2 | \Y4 \Z4 \Y2 | \Z1  \bar "|."
}

\markup {
    \vspace #3
    Exercise 14
}

\transpose c c' {
    \time 3/4
    \Z4^"i" \Z^"m" \Z | \Z \Y \Z | \Y \Y \Y | \Y \X \Y |
    \X \X \X | \Y \X  \Y | \Y \Y \Y  | \Z \Z \Z  \bar "|."
}



\version "2.18.2"


