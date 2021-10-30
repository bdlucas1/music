\include "style.ily"
\include "definitions.ily"
\version "2.18.2"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\paper {
  ragged-bottom = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      "Shearer Vol 1"
      \fromproperty #'page:page-number-string
    }
  }
  evenFooterMarkup = \oddFooterMarkup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\markup {
  \column {
    "Exercises 1-4 (Shearer Vol 1 p 24)"
    "Thumb on 4th string; fingers play rest stroke."
    \vspace #1
  }
}

\score {
  \header {piece = "Exercise 1"}
  \transpose c c' {
    \Z^"a" \Z \Z \Z  \Y^"m" \Y \Y \Y   \X^"i" \X \X \X  \X \Y \Y \Y     \break
    \Y \Z \Z \Z       \Y \Z \Y \Y      \X \Y \X \Y      \Y \Z \Z \Z  \bar "|."
  }
}

\score {
  \header {piece = "Exercise 2"}
  \transpose c c' {
    \Z2^"a" \Z  | \Y^"m" \Y | \X^"i" \X | \X \Y \X \Y \Y \Z \Y \Z \Z1 \bar "|."
  }
}

\score {
  \header {piece = "Exercise 3"}
  \transpose c c' {
    \Z4^"a" \Z \Z2 | \Z4 \Y4^"m" \Y2 | \X4^"i" \Y4 \X2  |
    \Y1  | \X4 \X4 \X2 |  \Y4 \Y4 \Y2 | \Y4 \Z4 \Y2 | \Z1  \bar "|."
  }
}

\score {
  \header {piece = "Exercise 4"}
  \transpose c c' {
    \time 3/4
    \Z4^"a" \Z \Z | \Z \Y^"m" \Z | \Y \Y \Y | \Y \X^"i" \Y | \break
    \X \X \X | \Y \X  \Y | \Y \Y \Y  | \Z \Z \Z  \bar "|."
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\markup {
  \column {
    "Exercises 5-8 (Shearer Vol 1 pp 30-31)"
    "Thumb plays free strokes."
    \vspace #1
  }
}

\score {
  \header {piece = "Exercise 5"}
  \transpose c c' {
    \U^"p" \U \U \U | \V \V \V \V | \W \W \W \W | \V \V \V \V  | \break
    \U \V \U \V | \W \V \W  \V | \U \U \U \U | \V \V \V \V  \bar "|."
  }
}

\score {
  \header {piece = "Exercise 6"}
  \transpose c c' {
    \time 3/4
    \V^"p" \U \V | \V2 \V4 | \W \V \W | \W2 \W4 | \break
    \V \U \V | \W2 \V4 | \U \U \U | \V2.  \bar "|."
  }
}

\score {
  \header {piece = "Exercise 7 "}
  \transpose c c' {
    \U4^"p" \U \U2 | \V4 \V \V2 | \W4 \W \W2 | \X2 \X4 \X | \break
    \Y \Y \Y \Y | \Z \Z2 \Z4 | \Y \Y \Y \Y | \X1 | \break
    \W4 \W \W2 | \V \V4 \V | \U2 \U | \V \V \bar "|."
  }
}

\score {
  \header {piece = "Exercise 8"}
  \transpose c c' {
    \time 3/4           
    \X4^"p" \U \X | \X2 \Y4 | \Y4 \Z \Y | \Z2 \Y4 | \break
    \Y4 \X \Y | \X2 \X4 | \U4 \U \U | \X2. \bar "|."
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\markup {
  \column {
    "Exercises 9-10 (Shearer Vol 1 p 32)"
    "Alternating thumb and finger."
    \vspace #1
  }
}

\score {
  \header {piece = "Exercise 9"}
  \transpose c c' {
    \Z^"a" \U_"p" \Z \U | \Z \U \Z \U | \Y^"m" \U \Y \U | \Y \U \Y \U |
    \X^"i" \U \X \U | \X \U \X \U | \X \U \Y \U | \Y \U \Y \U | \break
    \Y \U \Z \U | \Z \U \Z \U | \Y \U \Z \U | \Y \U \Y \U |
    \X \U \Y \U | \X \U \Y \U | \Y \U \Z \U | \Z \U \U \U \bar "|."
  }
}

\score {
  \header {piece = "Exercise 10"}
  \transpose c c' {
    \V_"p" \Z^"a" \V \Z | \V \Z \V \Z | \U \Z \U \Z | \U \Z \U \Z |
    \V \Z \V \Z | \V \Z \V \Z | \W \Z \W \Z | \W \Z \W \Z | \break
    \V \Z \V \Z | \U \Z \U \Z | \V \Z \V \Z | \W \Z \W \Z |
    \U \Z \V \Z | \U \Z \U \Z | \V \Z \U \Z | \V1 \bar "|."
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\markup {
  \column {
    "Exercises 11-14 (Shearer Vol 1 p 35)"
    "Alternating fingers (complete the fingering)."
    \vspace #1
  }
}

\score {
  \header {piece = "Exercise 11"}
  \transpose c c' {
    \Z4^"i" \Z^"m" \Z \Z | \Y^"i" \Y^"m" \Y \Y | \X^"i" \X^"m" \X \X | \X^"i" \Y^"m" \Y \Y |
    \Y^"i" \Z^"m" \Z \Z  | \Y^"i" \Z^"m" \Y \Y | \X^"i" \Y^"m" \X \Y | \Y^"i" \Z^"m" \Z \Z \bar"|."
  }
}

\score {
  \header {piece = "Exercise 12"}
  \transpose c c' {
    \Z2^"i" \Z^"m" | \Y \Y | \X \X | \X \Y \X \Y \Y \Z \Y \Z \Z1 \bar "|."
  }
}

\score {
  \header {piece = "Exercise 13"}
  \transpose c c' {
    \Z4^"i" \Z^"m" \Z2 | \Z4 \Y4 \Y2 | \X4 \Y4 \X2  |
    \Y1  | \X4 \X4 \X2 |  \Y4 \Y4 \Y2 | \Y4 \Z4 \Y2 | \Z1  \bar "|."
  }
}

\score {
  \header {piece = "Exercise 14"}
  \transpose c c' {
    \time 3/4
    \Z4^"i" \Z^"m" \Z | \Z \Y \Z | \Y \Y \Y | \Y \X \Y |
    \X \X \X | \Y \X  \Y | \Y \Y \Y  | \Z \Z \Z  \bar "|."
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\markup {
  \column {
    "Exercises 15-16 (Shearer Vol 1 p 37)"
    "Notes on the E string"
    \vspace #1
  }
}

"ex15ab" = \late #'#{
  \transpose c c'' {
    \key e \major
    e4 \x e\y e\x e | fs\x fs fs\x fs | gs\x gs gs\x gs | fs2\x fs |
    e4\x e fs\x fs | gs\x gs fs\x fs | e\x fs gs\x fs | e1\x |
    e4\y e fs\y fs | fs\y fs gs\y fs | e\y e gs\y gs | fs2\y fs |
    e4\y gs e\y gs | fs\y gs fs\y gs | e\y fs gs\y fs | e1\y
  }
#}

"x" = ^"i"
"y" = ^"m"
\score {
  \header {piece = "Exercise 15a (Shearer Vol 1 p 37)"}
  \"ex15ab"
}

"x" = ^"m"
"y" = ^"a"
\score {
  \header {piece = "Exercise 15b"}
  \"ex15ab"
}

"ex15cd" = \late #'#{
  \transpose c c'' {
    \key e \major
    e4\x e\y e\x e | fs\x fs fs\x fs | gs\x gs gs\x gs | a2\x a2 | \break
    e4\x e fs\x fs | gs\x gs a\x a | gs\x fs e\x fs | gs\x fs2. | \break
    e4\x e gs\x gs | fs\x fs a\x a | fs\x fs gs\x a | gs4\x fs e\x fs | gs2\x gs2 | \break
    e4\x gs e\x gs  | fs\x a fs\x a | e\x fs gs\x a | gs\x fs e\x fs | gs\x fs2 e4\x \bar"|."
  }
#}

"x" = ^"i"
"y" = ^"m"
\score {
  \header {piece = "Exercise 15c"}
  \"ex15cd"
}

\pageBreak

"x" = ^"m"
"y" = ^"a"
\score {
  \header {piece = "Exercise 15d"}
  \"ex15cd"
}

"ex16ab" = \late #'#{
  \transpose c c'' {
    \key f \major
    f2\x f\y | g\x g | e\x e | f1\x |
    e4\y g e\y g | e2\y e | e4\y g e\y g | f1\y |
    f2\x f | g\x g | e\x e | f1\x |
    g2\y g | e\y e4 e\y | f2\x g | f1\x | \bar"|."
  }
#}

"x" = ^"i"
"y" = ^"m"
\score {
  \header {piece = "Exercise 16a (Shearer p 38)"}
  \"ex16ab"
}

"x" = ^"m"
"y" = ^"a"
\score {
  \header {piece = "Exercise 16b"}
  \"ex16ab"
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\markup {
  \column {
    "Exercises 17-19 (Shearer Vol 1 p 39)"
    "Notes on the A string"
    \vspace #1
  }
}

"ex17ab" = \late #'#{
  \transpose b b'' {
    b,4\x b,\y b,\x b, | c\x c c\x c | d\x d d\x d | c2\x c | b,4\x b, d\x d |
    c\x c b,\x b, | c\x d d\x c | d1\x |
    b,4\y c\y d b, | d\y c c\y b, |
    d\y c b,\y c | d2\y d | b,4\y b, d\y d | c\y b, b,\y c | d\y c c\y b, | b,1\y \bar"|."
  }
#}

"x" = ^"i"
"y" = ^"m"
\score {
  \header {piece = "Exercise 17a"}
  \"ex17ab"
}

"x" = ^"m"
"y" = ^"a"
\score {
  \header {piece = "Exercise 17b"}
  \"ex17ab"
}

%
%
%

"ex18ab" = \late #'#{
  \transpose b b'' {
    \time 3/4
    c2\x c4\y | b,2.\x | d2\y d4 | c2\y c4 | d4\y c d\y | b,2\x b,4 | d4\x b, d\x | c2.\y |
    b,2\x b,4 | d2\x d4 | b,2\x d4 | c2\x c4 | d4\x c d\x | b,2\y b,4 | d\y b, d\y | c2.\x \bar"|."
  }
#}

"x" = ^"i"
"y" = ^"m"
\score {
  \header {piece = "Exercise 18a"}
  \"ex18ab"
}

"x" = ^"m"
"y" = ^"a"
\score {
  \header {piece = "Exercise 18b"}
  \"ex18ab"
}

%
%
%

\markup {
  \column {    
    "String crossing. Shift right hand from the elbow."
    \vspace #1
  }
}

"ex19ab" = \late #'#{
  \transpose b b'' {
    \time 3/4
    b,4\x b,\y b,\x | c\y c c | d\x d d | e\y e e | f2.\x | g4\y g g |
    f\x f f | e\y e e | d2.\x | c4\y c c | b,\x b, b, | c2.\y \bar"|."
  }
#}

"x" = ^"i"
"y" = ^"m"
\score {
  \header {piece = "Exercise 19a"}
  \"ex19ab"
}

"x" = ^"m"
"y" = ^"a"
\score {
  \header {piece = "Exercise 19b"}
  \"ex19ab"
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble =  {
  \time 4/4 
  \transpose c c'' {
    \key c \major
    e2\i e2\m | f2\i f2 | g2\i g2 | e2\i e2 | \break
    g2\i g2 | f2\i f2 | e2\i e2 | d1\i | \break
    e2\m e2\i | f2\m f2 | g2\m g2 | e2\m e2 | \break
    g2\m g2 | f2\m f2 | e2\m e2 | c2\m c2 \bar "|."
  }
}

bass =  {
  \time 4/4 \key c \major
  r4 g2\p g4 ~ | g4 g2 g4 ~ | g4 g2 g4 ~ | g4 g2 g4 ~ |
  g4 g2 g4 ~ | g4 g2 g4 ~ | g4 g2 g4 | r4 g4 g4 g4 ~ |
  g4 g2 g4 ~ |  g4 g2 g4 ~ | g4 g2 g4 ~ | g4 g2 g4 ~ |
  g4 g2  g4 ~ |  g4 g2 g4 ~ |g4 g2 g4 | r4 g4 r2 \bar "|."
  
}

accomp = {
  \time 4/4 \key c \major
  c2 c | d d | e e | c c |
  e e | d b, | c c | c4 b, b, 2 |
  c2 c | d d | e e | c c |
  e e | d b, | g g | e c \bar "|."
}

\score {
  \header {piece = "Prelude No. 1 (Shearer Vol 1 p 42)"}
  \transpose c c {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \tempo 4 = 120
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
      \new Staff {
        \clef "bass"
        \set Staff.midiInstrument = #"bassoon"
        \new Voice {\accomp}
      }
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble =  {
  \time 3/4 \transpose c c'' {
    \key a \minor
    c2.\i | e\m | f\i | e\m | d\i | b,\m | c\i ~ | c | \break
    e\m | g\i | f\m | d\i | c\m | b,\i | c\m ~ | c | \break
    d\i | b,\m | c\i | e\m | d\i | b,\m | c\i ~ | c | \break
    e\m | g\i | f\m | d\i | c\m | b,\i | c\m ~ | c \bar "|."

  }
}

bass =  {
  \time 3/4 \key a \minor
  r4 a4\p a ~ | a a a ~ | a a a ~ | a a a | r e' e' ~ | e' e' e' | r a a ~ | a a a ~ |
  a a a ~ | a a a | r e' e' ~ | e' e' e' | r e' e' ~ | e' e' e'  | r a a ~ | a a a |
  r e' e' ~ | e' e' e' | r a a ~ | a a a | r e' e' ~ | e' e' e' | r a a ~ | a a a ~ |
  a a a ~ | a a a | r e' e' ~ | e' e' e' | r e' e' ~ | e' e' e' | r a a ~ | a2. \bar "|."
  
}

accomp = {
    \time 3/4 \key a \minor
    a2. | c' | a | c' | b | gs | a |  c'4 b a |
    c'2. | e' | d' | b | a | gs | a | c'4 b a |
    b2. | gs | a | c' | b | gs | a | c'4 b a |
    c'2. | e' | d' | b | a | gs | a  ~ | a \bar "|."
}

\score {
  \header {piece = "Prelude No. 2 (Shearer Vol 1 p 43)"}
  \transpose a g {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \tempo 4 = 120
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
      \new Staff {
        \clef "bass"
        \set Staff.midiInstrument = #"bassoon"
        \new Voice {\accomp}
      }
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble =  {
  \time 4/4 \transpose c c'' {
    \key a \minor
    c1\i | e2\m c \i | d1\m | b,2\i d\m | \break
    c1\i | e2\m g\i | f1\m | d2\i f\m | \break
    e1\i | e2\m c\i | d1\m | b,2\i d\m | \break
    c1\i | b,2\m d\i | c1\m | r1 \bar"|."
  }
}

bass =  {
  \time 4/4 \key a \minor
  r4 a\p a a~ | a a2 a4 | r e' e' e' ~ | e' e'2 e'4 |
  r a a a ~ | a a2 a4 | r d' d' d' ~ | d' d'2 d'4 |
  r a a a ~ | a a2 a4 | r e' e' e' ~ | e' e'2 e'4 |
  r4 a a a | r e'2 e'4 | r a a a | a1 \bar"."
}

accomp = {
    \time 4/4 \key a \minor
    a4 b c' b | c'2 a | b4 a gs a | gs2 b |
    a4 b c' b | c'2 e' | d'4 c' b c' | b2 d' |
    c'4 b a b | c'2 a | b4 a gs a | gs2 b |
    a2 b4 a | a gs2 b4 | a2 c' | a1 \bar"|."
}

\score {
  \header {piece = "Prelude No. 3 (Shearer Vol 1 p 44)"}
  \transpose a g {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        \tempo 4 = 120
        <<
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
      \new Staff {
        \clef "bass"
        \set Staff.midiInstrument = #"bassoon"
        \transpose c c, {
          \new Voice {\accomp}
        }
      }
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble =  {
  \time 4/4 \key a \minor \tempo 4 = 120
  e4\i e\m d\i c\m | d2\i b,\m | d4\i d\m c\i b,\m | c2\i e\m | e4\i e\m d\i c\m | d2\i b,\m|\break
  d4\i d\m c\i b,\m | c1\i | g4\m g\i f\m e\i | f2\m d\i | f4\m f\i e\m d\i | e2\m c\i | \break
  g4\m g\i f\m e\i | f2\m d\i | f4\m f\i e\m d\i | e1\m | c4\i c\m d\i e\m | d2\i f\m | \break
  b,4\i b,\m c\i d\m | d2\i e\m | c4\i c\m d\i e\m | d2\i e\m | f4\i e\m b,\i d\m | c1\i \bar"|."
}

bass =  {
  \time 4/4 \key a \minor
  r1 | r4 e,2 e,4 ~ | e,1 | r4 a,,2 a,,4 ~ | a,,1 | r4 e,2 e,4 ~ |
  e,1 | r4 a,,4 a,, a,, ~ | a,,1 | r4 d,2 d,4 ~ | d,1 | r4 a,,2 a,,4 ~ |
  a,,1 | r4 d,2 d,4 ~ | d,1 | r4 e, e, e, | r1 | r4 e,2 e,4 ~ |
  e,1 | r4 a,,2 a,,4 ~ | a,,1 | r4 e,2 e,4 ~ | e,1 | r4 a,, a,,2 |
}

atreble = {
    \time 4/4 \key a \minor
    r4 c b, a, | b,2 gs, | r4 b, a, gs, | a,2 c | r4 c b, a, | b,2 gs, |
    r4 b, a, gs, | a,2 c4 d4 | r4 e d cs | d2 b,2 | r4 d c b, | c2 a, |
    r4 e d cs | d2 b,2 | r4 d c b, | gs,2 b, | r4 a, b, c | b,2 d |
    r4 gs, a, b, | a, 2 c | r4 a, b, c | b,2 gs, | r4 gs, gs,2 | a,1 |
}

abass = {
    \time 4/4 \key a \minor
    a,,1 | s | e, | s | a,, | s |
    e, | s a,, | s d, | s |
    a,, | s | d, | s | a,, | s |
    e, | s | a,, | s e, | s |
}

\score {
  \header {piece = "Prelude No. 4 (Shearer Vol 1 p 45)"}
  \transpose a g'' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \atreble}
          \new Voice {\voiceTwo \abass}
        >>
      }
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble =  {
  \time 4/4 \key a \minor \tempo 4 = 120
  c2\i c\m | e\i c\m | d\i c\m | b,2.\i c4\m | \break
  d2\i d\m | f\i d\m | e\i d\m | c1\i | \break
  e2\m e\i | g\m e\i | f\m e\i | d2.\m c4\i |  \break
  b,2\m b,\i | d\m b,\i | c\m a,\i a,1\m \bar"|."
}

bass =  {
  \time 4/4 \key a \minor
  r4 a,,2\p a,,4 ~ | a,, a,,2 a,,4 | r4 e,2 e,4 ~ | e, e, e,2 ~ |
  e,4 e,2 e,4 ~ | e,4 e,2 e,4 | r4 a,,2 a,,4 ~ | a,,4 a,, a,, a,, ~ |
  a,, a,,2 a,,4 ~ | a,, a,,2 a,,4 | r4 d,2 d,4 ~ | d, d, d,2 |
  r4 e,2 e,4 ~ | e, e,2 e,4 | r4 a,,2 a,,4 ~ | a,, a,, a,,2 |
}

atreble = {
    \time 4/4 \key a \minor
    \parenthesize a,2 \parenthesize a, | \parenthesize c \parenthesize a, |
    \parenthesize b, \parenthesize a, | \parenthesize gs,2. \parenthesize a,4 |
    \parenthesize b,2 \parenthesize b, | \parenthesize d \parenthesize b, |
    \parenthesize c \parenthesize b, | \parenthesize a,1 |
    \parenthesize c2 \parenthesize c | \parenthesize e \parenthesize cs |
    \parenthesize d \parenthesize c | \parenthesize b,2. \parenthesize a,4 |
    \parenthesize gs,2 \parenthesize gs, | \parenthesize b, \parenthesize gs, |
    \parenthesize a, \parenthesize a, | \parenthesize a,1 |
}

\score {
  \header {piece = "Prelude No. 5 (Shearer Vol 1 p 47)"}
  \transpose a g'' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {
            \voiceOne
            <<
              \treble
              \transpose c c' \atreble
            >>
          }
          \new Voice {\voiceTwo \bass}
        >>
      }
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\atreble}
        >>
      }
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble = {
  \time 4/4 \key a \minor \tempo 4 = 120 \relative {
    a4\i b\m c\i d\m | c1\i | c4\m d\i e\m f\i | e1\m d4\i e\m f\i g\m | f1\i | \break
    g4\m f\i e\m d\i | e1\m | f4\i e\m d\i c\m | d1\i | e4\m d\i c\m b\i | c2\m c4\i b\m | \break
    a\i b\m c\i d\m | c1\i | c4\m d\i e\m f\i | e1\m | d4\i e\m f\i g\m | f1\i | \break
    g4\m f\i e\m d\i | e1\m | f4\i e\m d\i c\m | d1\i | e4\m d\i c\m b\i | c2\m a\i \bar"|."
  }
}

bass =  {
  \time 4/4 \key a \minor \relative {
    r1 | r4 a,\p a a ~ | a1 ~ | a4 a a a | r1 | r4 d d d ~ |
    d1 | r4 a a a ~ | a1 | r4 e' e e ~ | e1 | r4 a,2. ~ |
    a1 ~ | a4 a a a ~ | a1 ~ | a4 a a a | r1 | r4 d d d~ |
    d1 | r4 a a a~ | a1 | r4 e' e e~ | e1 | r4 a,2. |
  }
}

atreble = {
    \time 4/4 \key a \minor \relative {
      r1 | a4 b c d | e2 c | a4 b c d | f2 d | a4 b c d |
      r d c b | c b a b | r c b a | b a gs a | r b a gs | a1 |
      r2 c4 b | a b c d | e2 c | a4 b c d | f2 d | a4 b c d |
      r d c b | c b a b | r c b a | b a gs a | r b a gs | a1 |
    }
}

abass =  {
  \time 4/4 \key a \minor \relative {
    \repeat unfold 6 { s1 | }
    | s | s | a, | s | e' | s |
    \repeat unfold 6 { s | }
    | s | s | a, | s | e' | s |

  }
}

\score {
  \header {piece = "Etude No. 1 (Shearer Vol 1 p 48)"}
  \transpose a g' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \atreble}
          \new Voice {\voiceTwo \abass}
        >>
      }
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble =  \relative {
  \time 3/4 \key a \minor \tempo 4 = 120
  r4 c\i d\m | e2.\i | c\m | e\i | c4\m  b\i c\m | d2.\i | \break
  b2.\m | d2.\i | b4\m c\i d\m | e2.\i | c\m | e\i | \break
  e4\m f\i g\m | f2.\i | d\m | f\i | f4\m g\i f\m | e2.\i | \break
  c2.\m | e\i | c4\m b\i c\m | d2.\i | b\m | c\i | a\m \bar"|."
}

bass =  \relative {
  \time 3/4 \key a \minor
  r2. | r4 a,,\p a ~ | a a a ~ | a a a ~ | a2. | r4 e' e ~ |
  e e e ~ | e e e ~ | e2. | r4 a, a ~ | a a a ~ | a a a ~ |
  a2. | r4 d d ~ | d d d ~ | d d d ~ | d2. | r4 a a~ |
  a a a ~ | a a a ~ | a2. | r4 e' e ~ | e e e | r a, a ~ | a2. |
}

atreble = {
}

\score {
  \header {piece = "Prelude No. 6 (Shearer Vol 1 p 49)"}
  \transpose a g'' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
      %\new Staff {
      %  \set Staff.midiInstrument = #"acoustic guitar (nylon)"
      %  <<
      %    \new Voice {\atreble}
      %  >>
      %}
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble =  {
  \time 4/4 \key g \major \tempo 4 = 120
  b4\i c'\m d'\i b\m | d'\i b\m c'\i a\m | b\i c'\m d'\i b\m | \break
  d'\i c'\m b\i g\m | g'\i b\m e'\i d'\m | c'\i d'\m b\i a\m | \break
  g'\i b\m e'\i d'\m | c'\i d'\m  b\i g\m | b\i c'\m d'\i b\m | \break
  d'\i b\m c'\i a\m | b\i c'\m d'\i b\m | d'\i c'\m b\i g\m \bar"|."
}

bass =  {
  \time 4/4 \key g \major \tempo 4 = 120
  b8 d\p c' d d' d b d | d' d b d c' d a d | b d c' d d' d b d | \break
  d' d c' d b d g d | g' d b d e' d d' d | c' d d' d b d a d | \break
  g' d b d e' d d' d | c' d d' d b d g d | b d c' d d' d b d | \break
  d' d b d c' d a d | b d c' d d' d b d | d' d c' d b d g,4 \bar"|."
}

\score {
  \header {piece = "Prelude No. 7a (Shearer Vol 1 p 53)"}
  \transpose g g' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
      %\new Staff {
      %  \set Staff.midiInstrument = #"acoustic guitar (nylon)"
      %  <<
      %    \new Voice {\atreble}
      %  >>
      %}
    >>
  }
}


treble =  {
  \time 4/4 \key g \major \tempo 4 = 120
  b4\i c'\m d'\i b\m | d'\i b\m c'\i a\m | b\i c'\m d'\i b\m | \break
  d'\i c'\m b\i g\m | g'\i b\m e'\i d'\m | c'\i d'\m b\i a\m | \break
  g'\i b\m e'\i d'\m | c'\i d'\m  b\i g\m | b\i c'\m d'\i b\m | \break
  d'\i b\m c'\i a\m | b\i c'\m d'\i b\m | d'\i c'\m b\i <g b,>\i\m \bar"|."
}

bass =  {
  \time 4/4 \key g \major \tempo 4 = 120
  b8 d,\p c' d, d' d, b d, | d' d, b d, c' d, a d, | b d, c' d, d' d, b d, | \break
  d' d, c' d, b d, g d, | g' d, b d, e' d, d' d, | c' d, d' d, b d, a d, | \break

  g' d, b d, e' d, d' d, | c' d, d' d, b d, g d, | b d, c' d, d' d, b d, | \break
  d' d, b d, c' d, a d, | b d, c' d, d' d, b d, | d' d, c' d, b d, d,4 \bar"|."
}

\score {
  \header {piece = "Prelude No. 7b (Shearer Vol 1 p 53)"}
  \transpose g c'' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
      %\new Staff {
      %  \set Staff.midiInstrument = #"acoustic guitar (nylon)"
      %  <<
      %    \new Voice {\atreble}
      %  >>
      %}
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble = {
  \time 4/4 \key a \minor \tempo 4 = 120 \relative {
    r4 c\i e\m c\i ~ | c c\m e\i c\m ~ | c c\i e\m c\i ~ | c c\m e\i c\m | \break
    r d\i f\m d\i ~ | d d\m f\i d\m ~ | d d\i f\m d\i ~ | d d\m f\i d\m | \break
    r c\i e\m c\i ~ | c c\m e\i c\m ~ | c c\i e\m c\i ~ | c c\m e\i c\m |  \break
    r d\i f\m d\i ~ | d d\m e\i d\m | r c\i e\m c\i | << c1\m e,\i >> \bar"|."
  }
}

bass =  {
  \time 4/4 \key a \minor \relative {
    a,,1\p | e' | a, | a |
    d | a | d | d | 
    a | e' | a, | a |
    e' | e | a, | a\p
  }
}


\score {
  \header {piece = "Etude No. 2 (Shearer Vol 1 p 59)"}
  \transpose a g'' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
    >>
  }
}

%\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble = {
  \time 3/4 \key a \minor \tempo 4 = 120 \relative {
    a8\i c'\m e\i c\m e\i c\m | e, c' e c e c | a, c' e c e c | a, c' e c e c | \break
    d, d' f d f d | a, d' f d f d | d, d' f d f d | d, d' f d f d | \break
    a, c' e c e c | e, c' e c e c | a, c' e c e c | a, c' e c e c | \break
    e, d' f d f d | e, d' e d e d | a, c' e c e c\m ~ | c2. \bar"|."
  }
}

bass =  {
  \time 3/4 \key a \minor \relative {
    a2.\p e' a, a d a d d a e' a, a e' e a, a\p
  }
}

\score {
  \header {piece = "Etude No. 3 (Shearer Vol 1 p 60)"}
  \transpose a g {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble_a = {
  \time 3/4 \key a \minor \tempo 4 = 120 \relative {
    a8 a' c a c a | a, a' d a d a | e gs d' gs, d' gs, | e gs b gs b gs | a, a' c a c a | \break
    a, c' e c e c | d, d' f d f d | d, b' f' b, f' b, | a, c' e c e c | a, a' c a c a | \break
    e a d a d a | e gs b gs b gs | a, a' c a c a | e a c a c a | a, a' c a c a | a,2. \bar"|."
  }
}

bass_a =  {
  \time 3/4 \key a \minor \relative {
    a2. a e' e a, a d d a a e' e a, e' a, a
  }
}

treble_b = {
  \time 3/4 \key a \minor \tempo 4 = 120 \relative {
    a8 a' c a c a | a, a' d a d a | e, gs' d' gs, d' gs, | e, gs' b gs b gs | a, a' c a c a | \break
    a, c' e c e c | d, d' f d f d | d, b' f' b, f' b, | a, c' e c e c | a, a' c a c a | \break
    e, a' d a d a | e, gs' b gs b gs | a, a' c a c a | e, a' c a c a | a, a' c a c a | a,2. \bar"|."
  }
}

bass_b =  {
  \time 3/4 \key a \minor \relative {
    a2. a e e a a d d a a e e a e a a
  }
}

\score {
  \header {piece = "Etude No. 4 (Shearer Vol 1 p 61)"}
  \transpose a g {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble_a}
          \new Voice {\voiceTwo \bass_a}
        >>
      }
    >>
  }
}

\score {
  \header {piece = "Etude No. 4 (Shearer Vol 1 p 61)"}
  \transpose a c' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble_b}
          \new Voice {\voiceTwo \bass_b}
        >>
      }
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble = {
  \time 3/4 \key a \minor \tempo 4 = 120
  a,4 a c' | e, a c' | a, a c' | a, a c' | d a d' |
  a, a d' | d a d' | d a d' | a, a c' e, a c ' | a, a c' |
  a, a c' | e, gs b | e, d' e' | a, c' e' | a,2. |
}

bass = {
  \time 3/4 \key a \minor
  e'2 c'4 | e'2 c'4 | e'2. | c' | f'2 d'4 |
  f'2 d'4 f'2. | d'2. e'2 c'4 | e'2 c'4 | e'2. |
  c'2 c'4 | c'4 b2 | gs2 b4 | a2. | a
}

\markup {
  Etudes Nos. 5 and 5a (Shearer Vol 1 p 65)
}


\score {
  \header{piece = "Etude No. 5, Guitar"}
  \transpose a g {
    <<
      \context Staff {
        \clef "treble_8" 
        <<
          \new Voice {\voiceOne \treble}
        >>
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
      }
      \new Staff {
        \clef "treble_8" 
        \bass
      }
    >>
  }
}



treble = {
  \time 3/4 \key g \minor \tempo 4 = 120 {
    g,4 g bf | g, g bf | d bf g' | g, g bf | g, ef c' | g, ef c' | c c' g' | g, g c' | \break
    g, g bf | d bf g' | g, bf g' | g, g bf | d a fs' | d c' fs' | g, d bf | <g, d bf>2. \bar"|."
  }
}

\score {
  \header{piece = "Etude No. 5, GDAE"}
  \transpose g g' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble}
        >>
      }
%      \new TabStaff {
%        <<
%          \set TabStaff.stringTunings = #violin-tuning
%          \new TabVoice {\voiceOne \treble}
%        >>
%      }
    >>
  }
}

%%%%%%%%%%%%

treble = {
  \time 3/4 \key a \minor \tempo 4 = 120 \relative {
    r4 c e | r c e | r d f | r d f | r c e | r c e |
    r b e | r b e | r c e | r c e | r d f |
    r d f | r d e | r d e | r c e | s2. \bar"|."
  }
}

bass =  {
  \time 3/4 \key a \minor \relative {
    a,2. | a | a | a | a | a |
    gs | e | a | a | a |
    a | a | gs | a | a |
  }
}

\score {
  \header{piece = "Etude No. 5a, Guitar"}
  \transpose a g' {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        \clef "treble_8" 
        <<
          \new Voice {\voiceOne \treble}
          \new Voice {\voiceTwo \bass}
        >>
      }
%      \new TabStaff {
%        <<
%          \new TabVoice {\voiceOne \treble}
%          \new TabVoice {\voiceTwo \bass}
%        >>
%      }
    >>
  }
}

treble = {
  \time 3/4 \key g \minor \tempo 4 = 120 {
    g4 bf d' |  g bf d' | g c' ef' | g c' ef' | g bf d' | g bf d' | fs a d' | d a d' | \break
    g bf d' | g bf d' | g c' ef' | g c' ef' |  g c' d' | fs c' d' | g bf d' | g2. 

  }
}

treble = {
  \time 3/4 \key g \minor \tempo 4 = 120 {
    g4 d' bf' |  g d' bf' | g ef' c'' | g ef' c'' | g d' bf' | g d' bf' | a d' fs''| a d' a' |
    g d' bf' | g d' bf' | g ef' c'' | g ef' c'' |  g d' c'' | c' d' fs'' | g d' bf' | <g d' bf'>2. 

  }
}

treble = {
  \time 3/4 \key g \minor \tempo 4 = 120 {
    g4 d' bf' |  g d' bf' | g ef' c'' | g ef' c'' | g d' bf' | d' bf' g'' | d' a' fs''| d' a' a'' |
    g d' bf' | g d' bf' | g ef' c'' | ef' c'' g'' |  d' c'' g'' | d' c'' fs'' | d' bf' g'' | <g bf' g''>2. 

  }
}

bass =  {
  \time 3/4 \key g \minor \relative {
  }
}

\score {
  \header{piece = "Etude No. 5a, GDAE"}
  \transpose g g {
    <<
      \new Staff {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        <<
          \new Voice {\voiceOne \treble}
%          \new Voice {\voiceTwo \bass}
        >>
      }
%      \new TabStaff {
%        <<
%          \set TabStaff.stringTunings = #violin-tuning
%          \new TabVoice {\voiceOne \treble}
%          \new TabVoice {\voiceTwo \bass}
%        >>
%      }
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%

treble = {
  \time 2/4 \key e \minor \tempo 4 = 120
  e,8 g b e' | e, g b e' | e, g c' e' | e, g c' e' | e, a c' e' | e, a c' e' | e, a c' fs' | e, a c' fs' |
  e, a b fs' | e, a b fs' | e, a b g' | e, a b g' | e, a b fs' | e, a b fs' | e, g b e' | e, g b e' | e,2 \bar"|."
}

\score {
  \header {piece = "Prelude No. 9, Guitar (Shearer Vol 1 p 66)"}
  \transpose e e {
    \clef "treble_8" 
    \treble
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
  }
}

treble = {
  \time 2/4 \key e \minor \tempo 4 = 120
  e,8 b, g e' | e, b, g e' | e, c g e' | e, c g e' | e, c a e' | e, c a e' | e, c a fs' | e, c a fs' |
  e, b, a fs' | e, b, a fs' | e, b, a g' | e, b, a g' | e, b, a fs' | e, b, a fs' | e, b, g e' | e, b, g e' | e,2 \bar"|."
}


\score {
  \header {piece = "Prelude No. 9, GDAE (Shearer Vol 1 p 66)"}
  \transpose e g' {
    <<
      \treble
%      \new TabStaff {
%        \set TabStaff.stringTunings = #violin-tuning
%        \treble
%      }
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble = {
  \time 3/4 \key e \minor \tempo 4 = 120
  e,8 g b e' b g | e, g b e' b g | e, g c' e' c' g | e, g c' e' c' g | \break
  e, a c' e' c' a | e, a c' e' c a | e, a c' fs' c' a | e, a c' fs' c' a | \break
  e, a b fs' b a | e, a b fs' b a | e, a b g' b a | e, a b g' b a | \break
  e, a b fs' b a | e, a b fs' b a | e, g b e' b g | e, g b e' ~ e' 4 \bar"|."
}

\score {
  \header {piece = "Prelude No. 10, Guitar (Shearer Vol 1 p 68)"}
  \transpose e e {
    \clef "treble_8" 
    \treble
    \set Staff.midiInstrument = #"acoustic guitar (nylon)"
  }
}


treble = {
  \time 3/4 \key e \minor \tempo 4 = 120
  e,8\p b,\i g\m e'\a g\m b,\i | e, b, g e' g b, | e, c g e' g c | e, c g e' g c | \break
  e, c a e' a c | e, c a e' a c | e, c a fs' a c | e, c a fs' a c | \break
  e, b, a fs' a b, | e, b, a fs' a b, | e, b, a g' a b, | e, b, a g' a b, | \break
  e, b, a fs' a b, | e, b, a fs' a b, | e, b, g e' g b, | e, b, g e' ~ e'4 \bar"|."
}


\score {
  \header {piece = "Prelude No. 10, GDAE (Shearer Vol 1 p 68)"}
  \transpose e g' {
    <<
      \treble
%      \new TabStaff {
%        \set TabStaff.stringTunings = #violin-tuning
%        \treble
%      }
    >>
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header {piece = "Etude No. 6 (Shearer Vol 1 p 70)"}
  \transpose g g' {
    \time 4/4 \key g \minor \tempo 4 = 120 \voiceOne
    g8 d' bf' d' g, d' bf' d' | g8 d' bf' d' g, d' bf' d' |
    g8 ef' c'' ef' g, ef' c'' ef' |  g8 ef' c'' ef' g, ef' c'' ef' \break
    g8 d' bf' d' g, d' bf' d' | g8 d' bf' d' g, d' bf' d' |
    g8 d' a' d' fs d' a' d' | d d' a' d' fs d' a' d' | \break
    g8 d' bf' d' g, d' bf' d' | g8 d' bf' d' g, d' bf' d' |
    g8 ef' c'' ef' g, ef' c'' ef' |  g8 ef' c'' ef' g, ef' c'' ef' \break
    g8 d' a' d' fs d' a' d' | d d' a' d' fs d' a' d' | 
    g8 d' bf' d' g, d' bf' d' | g8 d' bf' d' g, d' bf' d' \bar"|." \break

  }
}

%\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble = {
  \time 6/8 \key c \major \tempo 4 = 120
  
}

\score {
  \header {piece = "Prelude No. 11 (Shearer Vol 1 p 71)"}
  \transpose c c' {
    \clef "treble" 
    \treble
    \voiceOne
    e8 c' c' e c' c' | f d' d' f d' d' | d b b d b b | e c' c' e c' c' | \break
    g e' e' g e' e' | a f' f' a f' f' | g e' e' f d' d' | e c' c' e c' c' | \break
    e g' g' e g' g' | d g' g' d f' f' | a f' f' a f' f' | g f' f' g e' e' | \break
    a e' e' g e' e' | f e' e' f d' d' | d c' c' d b b | e c' c' c'4. | \break
  }
}


\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\markup {
  Moorish Dance (Shearer Vol 1 p 72)
}
%
% as written, with low E
%

withLowE = {
    \time 4/4 \key a \minor \tempo 4 = 120    
    \voiceTwo a,4\p e\p f\p d\p | \voiceOne e8\p c' a, c' e c' a, c' | \voiceTwo e,4 e f d | \voiceOne e8 d' e, d' e d' e, d' | \break
    \voiceTwo e4 f gs f | \voiceOne e8 d' e, d' e d' e, d' | \voiceTwo f4 d e gs | \voiceOne a8 e' a, e' e e' a e' | \voiceTwo a,4 e f d | \break
    \voiceOne e8 c' a, c' e c' a, c' | \voiceTwo e,4 e f d | \voiceOne e8 d' e, d' e d' e, d' | \voiceTwo e4 f gs f |
        \voiceOne e8 d' e, d' e d' e, d' | \break
    \voiceTwo e4 d e gs | \voiceOne a8 e' a, e' e e' a e' | \voiceTwo f4 d a f | \voiceOne e8 d' e, d' e d' e, d' | \voiceTwo f4 d e gs | \break
    \voiceOne a8 e' a, e' e e' a, e' | \voiceTwo f4 d e gs | \voiceOne a8 e' a, e' e e' a e' | a e' a, e' e e' a, e' ~ | <<e'2.\p a\a>> \bar "|."
}

%
% substitute C (3rd) for low E (5th) to suit GDAE in some keys
%

withC = {
    \time 4/4 \key a \minor \tempo 4 = 120    
    \voiceTwo a,4\p e\p f\p d\p | \voiceOne e8\p c' a, c' e c' a, c' | \voiceTwo c4 e f d | \voiceOne e8 d' c d' e d' c d' | \break
    \voiceTwo e4 f gs f | \voiceOne e8 d' c d' e d' c d' | \voiceTwo f4 d e gs | \voiceOne a8 e' a, e' e e' a e' | \voiceTwo a,4 e f d | \break
    \voiceOne e8 c' a, c' e c' a, c' | \voiceTwo c4 e f d | \voiceOne e8 d' c d' e d' c d' | \voiceTwo e4 f gs f |
        \voiceOne e8 d' c d' e d' c d' | \break
    \voiceTwo e4 d e gs | \voiceOne a8 e' a, e' e e' a e' | \voiceTwo f4 d a f | \voiceOne e8 d' c d' e d' c  d' | \voiceTwo f4 d e gs | \break
    \voiceOne a8 e' a, e' e e' a, e' | \voiceTwo f4 d e gs | \voiceOne a8 e' a, e' e e' a e' | a e' a, e' e e' a, e' ~ | <<e'2.\p a\a>> \bar "|."
}

\score {
  \header {piece = "Moorish Dance, Guitar"}
  \transpose c c' {
    \withLowE
  }
}

\score {
  \header {piece = "Moorish Dance, GDAE"}
  \transpose c f' {
    \withLowE
  }
}

\pageBreak

\score {
  \header {piece = "Moorish Dance, GDAE"}
  \transpose c bf {
    \withC
  }
}


\score {
  \header {piece = "Moorish Dance, GDAE"}
  \transpose c c' {
    \withC
  }
}

\pageBreak

%\score {
%  \header {piece = "Moorish Dance, GDAE"}
%  \transpose c ef' {
%    \withLowE
%  }
%}
%
%\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

treble = {
  \time 4/4 \key c \major \tempo 4 = 120
  
}

\score {
  \header {piece = "Prelude No. 12 (Shearer Vol 1 p 73)"}
  \transpose c c' {
    \clef "treble" 
    \treble
    \voiceOne
    e8\p c'\a c'\m c'\i e c' c' c' | f d' d' d' f d' d' d' | d b b b d b b b | e c' c' c' e c' c' c' | \break
    g e' e' e' g e' e' e' | a f' f' f' a f' f' f' | g e' e' e' f d' d' d' | e c' c' c' e c' c' c' | \break
    e g' g' g' e g' g' g' | d g' g' g' d f' f' f' | a f' f' f' a f' f' f' | g f' f' f' g e' e' e' | \break
    a e' e' e' g e' e' e' | f e' e' e' f d' d' d' | d c' c' c' d b b b | e c' c' c' <<e2 c'>> | \break
  }
}

%\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  \header {piece = "Etude No. 7 (Shearer Vol 1 p 75)"}
  \transpose c c' {
    \time 4/4 \key c \major \tempo 4 = 120 \voiceOne
    c4\p e'\m e'\i c\p | e c' c' e | d b b d | b, d' d' b, | d f' f' d | \break
    f d' d' f | e c' c' e | c e' e' c | e g' g' e | a, c' c' a, | \break
    d f' f' d | b, d' d' b, | c e' e' e | f d' d' b, | c\p c'\m g\i e\p | c1 |
  }
}

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pageBreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

