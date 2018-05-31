\include "style.ily"
\version "2.18.2"

\score {

  \header {
    piece = "Illinois Cotillion"
    tag = "Mel Bay p. 15"
  }

  \transpose c c
  << \chords {
    % chords
    s4. g2. s \parenthesize a:m s d:7 s | \break
    g s s s \parenthesize a:m s d:7 | \break
    s g4. d4.:7 g2. c s f | \break
    s g:7 s s s c s | \break
    f s g:7 s c4. g4.:7 c
  } << \relative g {
    % melody
    \clef "treble_8"
    \key g \major
    \time 6/8
    \partial 4.
    \repeat volta 2 {
      d'8( e d) |
      \ch"g" <b g,>4( g8) b4( g8) |
      <b d,>4. b8( c b) |
      \ch"c(a:m)" <a c,>4( e8) e4--( e8-.) |
      <e a,>4. e8( fs e) |
      \ch"d:7" <d a>4( d'8) d4--( d8-.) |
      d( c b) c( b a) | \break
      \ch"g" <g g,>4( b8) b4--( b8-.) |
      <b d,>4. d8( e d) |
      <b g,>4( g8) b4( g8) |
      <b d,>4. b8( c b) |
      \ch"c(a:m)" <a c,>4( e8) e4--( e8-.) |
      <e a,>4. e8( fs e) |
      \ch"d:7" <d a>4( d'8) d4--( d8-.) | \break
      <d fs, \parenthesize a,>8( c b) c( b a) |
      \ch"g" <g g,>4( d8) \ch"d:7" <fs a,>( e d) |
      \ch"g" <g b,>4 r8
    }
    \mark \markup
      \magnify #0.8 \musicglyph #"scripts.ufermata"
    \key c \major
    \repeat volta 2 {
      e'4( f?8) |
      \ch"c" <g e,>4. a4( g8) |
      <e g,>4. c4( b8) |
      \ch"f" <a c,>4. <a f?>4--( <a f>8-.) | \break
      <a f>4. a4( f8) |
      \ch"g:7" <g g,>4. <b d,>4--( <b d,>8-.) |
      <b d,>4. a4( f8) |
      <g g,>4. <b d,>4--( <b d,>8-.) |
      <b d,>4. e4( f8) |
      \ch"c" <g e,>4. a4( g8) |
      <e g,>4. c4( b8) | \break
      \ch"f" <a c,>4. <a f>4--( <a f>8-.) |
      <a f>4. a4( f8) |
      \ch"g:7" <g g,>4. b4( a8) |
      <g g,>4. a4( b8) |
      \ch"c" <c e, g,>4( g8) \ch"g:7" <b f g,>( a g) |
      \ch"c" <c e, g,>4 r8
    }
  } >> >>
}
     

