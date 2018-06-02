\include "style.ily"
\version "2.18.2"

\header {
  title = "Happy Jack"
  composer = "Mel Bay p. 18"
}


\score {

  \transpose c c
  << \chords {
    % chords
    s8 | d2. | g | s | a:7 | d | \break
    g | d4. a4.:7 | d2. | g | d | \break
    e:7 | a | d | g | d4. a4.:7 | d2. \break
  } << \relative g {
    % melody
    \clef "treble_8"
    \key d \major
    \time 6/8
    \partial 8
    \repeat volta 2 {
      fs'16 e | d4--( b8-.) a fs a | b4--( d8-.) g4--( b8-.) |  a4--( fs8-.) fs e d |
      e fs e e4--\( fs16( e)\) | d4--( b8-.) a fs a | \break
      b4--( d8-.) g4--( b8-.) | a fs d a4--( cs8-.) | d[ r a-+] d,-+ r
    }
    \repeat volta 2 {
      fs' | g4--( g8-.) g a b | fs4--( fs8-.) fs g a | \break
      e4--( e8-.) e fs gs | a[ r e-+] a,-+ r b | a4--( a8-.) a fs a |
      b4--( d8-.) g4--( b8-.) | a fs d a4--( cs8-.) | d8[ r a-+] d,-+ r \break
    }
  } \\ \relative g {
    % accompaniment
    s8 | <d a>2. | <d g,> | s | <e g,> | <d a> | \break
    <d g,> | <d a>4. <e g,> | <d a>2. | <d g,> | <fs a,> | \break
    <b d, g,> | <a e g,> | <d, a> | <d g,> | <a' d, a>4. <e g,>4. | <d a>4. a8 s \break
  } >> >>
}

