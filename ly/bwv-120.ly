\version "2.12.1"
\include "english.ly"

\header
{
  title    	    = "Minuet in A minor"
  composer 	    = "Johann Sebastian Bach"
  opus     	    = "BWV Anh. 120"
  source	    = "Bach-Gesellschaft Ausgabe 1851-1899 Band 43 (1894)"
  sourceurl         = "http://imslp.org/wiki/Notebook_for_Anna_Magdalena_Bach_(Bach,_Johann_Sebastian)"
  style	            = "Baroque"
  copyright	    = "Public Domain"
}


upper = \relative a {

  \repeat volta 2 {
    \partial 4 e4  	  |
    a8. b16 c4 b   	  | % 1
    c4 a e' ~      	  | % 2
    e4 e8 d c b    	  | % 3
    c4 a f' ~      	  | % 4
    f4 e ds        	  | % 5
    e4 b e ~       	  | % 6
    e4 d! cs       	  | % 7
    d4 a d ~         	  | % 8
    d4 c! b        	  | % 9
    c4 g c         	  | % 10
    b8 c d b f' a, 	  | % 11
    gs2 s4         	  | % 12
  }

  \repeat volta 2 {
    \partial 4 g!  	  |
    c8. d16 e4 d   	  | % 13
    e4 c g' ~      	  | % 14
    g4 g8 f e d    	  | % 15
    e4 c a' ~      	  | % 16
    a4 g fs        	  | % 17
    g4 d e         	  | % 18
    f!4 d2         	  | % 19
    c2 e4          	  | % 20
    f4 fs4.\trill e16 fs  | % 21
    g4 d fs               | % 22
    g4 gs4.\trill fs16 gs | % 23
    a4 e a                | % 24
    f!4 e d               | % 25
    e4 e, a               | % 26
    d4 b2\trill           | % 27
    a2 s4                 | % 28
  }
}

lower = \relative a {

  \repeat volta 2 {
    \partial 4 r4 	    |
    r4 r e        	    | % 1
    a,8. b16 c4 b  	    | % 2
    c4 a e' ~     	    | % 3
    e4 e8 d c b   	    | % 4
    a4 a a        	    | % 5
    gs4 gs gs     	    | % 6
    g!4 g g       	    | % 7
    fs'4 fs fs     	    | % 8
    f!4 f f       	    | % 9
    e4 e e        	    | % 10
    d4 d d        	    | % 11
    e4 e s       	      % 12 barcheck fails here
  }
  \repeat volta 2 {
    \partial 4 r4 	    |
    r4 r g,       	    | % 13
    c8. d16 e4 d  	    | % 14
    e4 c g' ~     	    | % 15
    g4 g8 f e d   	    | % 16
    c'4 c c        	    | % 17
    b4 g c        	    | % 18
    a4 f g        	    | % 19
    c,4 c r      	    | % 20
    r4 r a'       	    | % 21
    bf4 b8.\trill a32 b c4  | % 22
    b4 e, b'                | % 23
    c4 cs8.\trill b32 cs a4 | % 24
    d4 e f                  | % 25
    c2 f4                   | % 26
    d4 e e,                 | % 27
    a2 s4                   | % 28
  }
}

\score {
  <<
    {
      \clef "treble_8"
      \time 3/4
      \upper
    }
    \\
    {
      \lower
    }
  >>
}   


