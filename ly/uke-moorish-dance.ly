\version "2.18.2"
\include "style.ily"

% fix
"p" = \P
"i" = \I
"m" = \M
"a" = \A

\paper {
  page-count = 3
}

\header {
    title = "Moorish Dance"
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

\markup{Guitar}

\score {
  \transpose c c' {
    \withLowE
  }
}

\markup{GDAE}

\score {
  \transpose c f' {
    \withLowE
  }
}

\pageBreak

\markup{GDAE}

\score {
  \transpose c bf {
    \withC
  }
}


\markup{GDAE}

\score {
  \transpose c c' {
    \withC
  }
}

\pageBreak

\markup{GDAE}

\score {
  \transpose c ef' {
    \withLowE
  }
}


