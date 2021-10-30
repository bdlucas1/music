\version "2.18.2"
\include "style.ily"
\include "definitions.ily"

\header {
  title = #(string-append "Ukelele (" tuning ") Exercises 15-16")
}

\markup {Notes on the E string}
\markup {" "}

"ex15ab" = \late #'#{
  \transpose c c'' {
    \key e \major
    e4 \x e\y e\x e | fs\x fs fs\x fs | gs\x gs gs\x gs | fs2\x fs |
    e4\x e fs\x fs | gs\x gs fs\x fs | e\x fs gs\x fs | e1\x |
    e4\y e fs\y fs | fs\y fs gs\y fs | e\y e gs\y gs | fs2\y fs |
    e4\y gs e\y gs | fs\y gs fs\y gs | e\y fs gs\y fs | e1\y
  }
#}

\markup {Exercise 15a}
"x" = ^"i"
"y" = ^"m"
\"ex15ab"

\markup {Exercise 15b}
"x" = ^"m"
"y" = ^"a"
\"ex15ab"

%
%
%

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
\markup {Exercise 15c}
\"ex15cd"

"x" = ^"m"
"y" = ^"a"
\markup {Exercise 15d}
\"ex15cd"

%
%
%

"ex16ab" = \late #'#{
  \transpose c c'' {
    \key f \major
    f2\x f\y | g\x g | e\x e | f1\x |
    e4\y g e\y g | e2\y e | e4\y g e\y g | f1\y |
    f2\x f | g\x g | e\x e | f1\x |
    g2\y g | e\y e4 e\y | f2\x g | f1\x | \bar"|."
  }
#}

\markup {Exercise 16a}
"x" = ^"i"
"y" = ^"m"
\"ex16ab"

\markup {Exercise 16b}
"x" = ^"m"
"y" = ^"a"
\"ex16ab"








