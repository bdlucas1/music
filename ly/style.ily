\language "english"

\paper {
  #(set-paper-size "letter")
  ragged-bottom = ##t
  ragged-right = ##f
  ragged-last = ##f
  %page-count = #1
  bookTitleMarkup = \markup {
    \column {
      \fill-line {\null \bold \fontsize #4 \fromproperty #'header:title \null}
      \fill-line {\fromproperty #'header:subject \null \fromproperty #'header:composer }
    }
  }
  %page-breaking = #ly:minimal-breaking
  %page-breaking = #ly:page-turn-breaking
}

\layout {
  \set Timing.beamHalfMeasure = ##f
  indent = 0
  %\override Score.NonMusicalPaperColumn.page-break-permission = ##f
}

br = \break

%"i" = ^\markup{\tiny i}
%"m" = ^\markup{\tiny m}
%"a" = ^\markup{\tiny a}
%"im" = ^\markup{\tiny{i m}}
%"mi" = ^\markup{\tiny{m i}}
%"ma" = ^\markup{\tiny{m a}}
%"am" = ^\markup{\tiny{a m}}
%"p" = _\markup{\tiny p}

%"p" = -\markup\tiny\italic"p"
%"i" = -\markup\tiny\italic"i"
%"m" = -\markup\tiny\italic"m"
%"a" = -\markup\tiny\italic"a"

% \finger seems to be necessary to position it like a fingering
% \text needed to override apparently weird font implied by \finger
"p" = -\finger\markup\text\italic\fontsize #3 "p"
"i" = -\finger\markup\text\italic\fontsize #3 "i"
"m" = -\finger\markup\text\italic\fontsize #3 "m"
"a" = -\finger\markup\text\italic\fontsize #3 "a"

% "trip" from http://lsr.di.unimi.it/LSR/Snippet?id=328
triplet = #(define-music-function (parser location m1 m2 m3) 
  (ly:music? ly:music? ly:music?)
  #{ \tuplet 3/2 { $m1 $m2 $m3 } #})

% /ch"..." just ignores the string - used for entering comments like chords
% this is a workaround to emacs lilypond bugs parsing %{...%}
ch = #(define-music-function (parser location aaa) (string?) #{#})

%
% from https://gist.github.com/kris7t/6038247
% usage:
%   stuff = \late #'#{ ... #}
%   \stuff
%
late =
#(define-scheme-function
  (parser location embedded-lilypond)
  (list?)
  (define-music-function (parser location) ()
   (eval embedded-lilypond (interaction-environment))
  )
)

%
% my alternative
% usage:
%   stuff = #'#{ ... #}
%   \eval-music \stuff
%
eval-music =
#(define-music-function (parser location quoted-music) (list?)
  (eval quoted-music (interaction-environment))
)


%
% some default values
%
\layout {
  \override Staff.NoteCollision.merge-differently-headed = ##t
  \override Staff.NoteCollision.merge-differently-dotted = ##t 
}

%
% http://music.stackexchange.com/questions/15155/define-custom-chord-voicings-in-lilypond
% example:
% gchord = \makechord < g b, d, \parenthesize g, >
% \gchord2
%
makechord =
  #(define-scheme-function (parser location m) (ly:music?)
    (define-music-function (parser location d) (ly:duration?)
     (map-some-music
      (lambda (m)
       (and (ly:duration? (ly:music-property m 'duration))
        (begin
         (set! (ly:music-property m 'duration) d)
         m)))
      (ly:music-deep-copy m))))


