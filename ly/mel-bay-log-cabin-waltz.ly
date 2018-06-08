\include "style.ily"
\version "2.18.2"

\header {
  title = "Log Cabin Waltz"
  composer = "Mel Bay p. 19"
  subject = "fussy"
}

\score {

  \transpose c c
  << \chords {
    % chords
    s4 d2. s g d a:7 s d s2 \break
    s4 a2.:7 s d s a:7 s d2 a4:7 d2. \break
    s s g d a:7 s d s2 \break
    s4 g2. s c s g s d s \break
    g s c s g d:7 g s2 \break
  } << \relative g {
    % melody
    \clef "treble_8"
    \key d \major
    \time 3/4
    \partial 4
    \repeat volta 2 {
      d8( fs) | a4. b8( a fs) | d4 fs( a) | d4. e8( d8 b8) | a2 fs8( g) |
      a4. b8( a fs) | e2 fs4 | d4. e8( fs e) | d2 \break
    }
    \repeat volta 2 {
      cs'8( d) | e4. cs8( e fs) | g4 fs( e) | d4. cs8( d e) | fs2 cs8( d) |
      e4. cs8( e fs) | g4 fs( e) | d4. d8( cs b) | a2 d,8( fs) | \break
      a4. b8( a fs) | d4 fs( a) | d4. e8( d b) | a2 fs8( g) |
      a4. b8( a fs) | e2 fs4 | d4. e8( fs e) | d2 \break
    }
    \key g \major
    \repeat volta 2 {
      g8( a) | <b d,>2 <b d,>4 | <d d,>2 <b d,>4 | <c e,>2 <c e,>4 | <e c>2 <c e,>4 |
      <d d,>2 <b d,>4 | <b d,>2 <b g>4 | <a d,>2 <a d,>4 | <a d,>2 g8( a) | \break
      <b d,>2 <b d,>4 | <d d,>2 <b d,>4 | <c e,>2 <c e,>4 | <e c>2 <c e,>4 |
      <d d,>2 <b d,>4 | <b d,>2 <a d,>4 | <g b,>2 <g b,>4 | <g b,>2 \break
    }

  } \\ \relative g {
    % accompaniment
    s4 | <d a>2. | s | <d g,> | <d a> | <e g,> | s | a, | a2 \break
    s4 | <a' e g,>2. | s | <d, a> | s | <a' e g,> | s | <d, a>2 <e g,>4 | <d a>2. | \break
    <d a> | s | <d g,> | <d a> | <e g,> | s | a, | a2 \break
    s4 | g2. | s | g | s | g | s | a | s | \break
    g | s | g | s | g | a | s | s2 \break
  } >> >>
}

