# Convert AAX to MP3

AAX isn't the most convenient...

## Steps

- Clone repo
- Install [FFmpeg](https://ffmpeg.org/download.html)
- Dump `*.aax` files in with scripts
- Add activation bytes to the `conv.py` call - [Somewhere like this](https://github.com/audible-tools/audible-tools.github.io/tree/master)
- Run `./dothething`
- Wait...

---

## What Do?

Quick detail for when I come back to this later...

### dothething.sh

Effectievly wraps everything for convenience.

- Calls `rename_aax_files.py`
- Calls `conv.py`
- zips the resulting MP3s

### rename_aax_files.py

Renames the raw files from something like `TheColourofMagicDiscworldBook1_ep7.aax` to `Book-1_TheColourofMagic.aax` in `\Book-1_TheColourofMagic`. This is useful later for self containing MP3s with respective titles...

### conv.py

Converts the AAX to MP3 using FFmpeg

#### Attribution

`conv.py` is `convert.py` from -> https://github.com/OndrejSkalicka/aax-to-mp3-python

Started writing my own version calling FFmpeg, then discovered it already existed...
