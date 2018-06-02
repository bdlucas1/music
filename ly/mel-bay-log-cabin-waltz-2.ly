\include "style.ily"
\version "2.18.2"

\header {
  title = "Log Cabin Waltz"
  composer = "Mel Bay p. 19"
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
      d8( fs) |
      \ch"d" <a d, a>4. b8( a fs) |
      d4 fs( a) |
      \ch"g" <d d, g,>4. e8( d8 b8) |
      \ch"d" <a d, a>2 fs8( g) |
      \ch"a:7" <a e g,>4. b8( a fs) |
      e2 fs4 |
      \ch"d" <d a>4. e8( fs e) |
      <d a>2 \break
    }
    \repeat volta 2 {
      cs'8( d) |
      \ch"a:7" <e a, e g,>4. cs8( e fs) |
      g4 fs( e) |
      \ch"d" <d d, g,>4. cs8( d e) |
      fs2 cs8( d) |
      \ch"a:7" <e a, e a,>4. cs8( e fs) |
      g4 fs( e) |
      \ch"d" <d d, a>4. d8( \ch"a:7" <cs e, g,>8 b) |
      \ch"d" <a d, a>2 d,8( fs) |
      \break
      <a d, a>4. b8( a fs) |
      d4 fs( a) |
      \ch"g" <d d, g,>4. e8( d b) |
      \ch"d" <a d, a>2 fs8( g) |
      \ch"a:7" <a e g,>4. b8( a fs) |
      e2 fs4 |
      \ch"d" <d a>4. e8( fs e) |
      <d a>2 \break
    }
    \key g \major
    \repeat volta 2 {
      g8( a) |
      \ch"g" <b d, g,>2 <b d,>4 |
      <d d,>2 <b d,>4 |
      \ch"c" <c? e, g,>2 <c e,>4 |
      <e c>2 <c e,>4 |
      \ch"g" <d d, g,>2 <b d,>4 |
      <b d,>2 <b g>4 |
      \ch"d" <a d, a>2 <a d,>4 |
      <a d,>2 g8( a) |
      \break
      \ch"g" <b d, g,>2 <b d,>4 |
      <d d,>2 <b d,>4 |
      \ch"c" <c e, g,>2 <c e,>4 |
      <e c>2 <c e,>4 |
      \ch"g" <d d, g,>2 <b d,>4 |
      \ch"d:7" <b d, a>2 <a d,>4 |
      \ch"g" <g b,>2 <g b,>4 | <g b,>2 \break
    }

  } >> >>
}

