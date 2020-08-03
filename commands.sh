sudo spotify-ripper my-playlist.txt -u githireh@gmail.com --flac

sudo spotify-ripper playlists/MtaaMentality.txt -u githireh@gmail.com --flac -u githireh@gmail.com -p "_JF)GTWjMddYw35" && sudo spotify-ripper playlists/mwanzo.txt -u githireh@gmail.com --flac -u githireh@gmail.com -p "_JF)GTWjMddYw35"

sudo spotify-ripper music/playlists/"Best of Khaligraph Jones.txt" -u githireh@gmail.com --flac -u githireh@gmail.com -p "_JF)GTWjMddYw35"

spotify-ripper music/playlists/"Best of Khaligraph Jones.txt" -u githireh@gmail.com --flac -u githireh@gmail.com -p "_JF)GTWjMddYw35"

spotify-ripper music/playlists/"Lucky you.txt" -u githireh@gmail.com --flac -u githireh@gmail.com -p "_JF)GTWjMddYw35"

spotify-ripper music/playlists/"indie"

spotify-ripper music/playlists/"streetbullies.txt"  -f "{artist} - {track_name}.{ext}" --directory "/media/2TB/software/spotify-ripper/music/riddim/Street Bullies Riddim"

spotify-ripper music/playlists/"playground riddim"  -f "{artist} - {track_name}.{ext}" --directory "/media/2TB/software/spotify-ripper/music/riddim/Playground Riddim"

spotify-ripper music/playlists/"message riddim"  -f "{artist} - {track_name}.{ext}" --directory "music/riddim/Message Riddim"


## get playlist
docker run --rm -it -v $(pwd)/Hanyaring\ Game:/music ritiek/spotify-downloader -p https://open.spotify.com/playlist/1qL2zpsXNYVsshy37ezH9Y

docker run --rm -it -v $(pwd)/"music/playlists":/music ritiek/spotify-downloader -p https://open.spotify.com/playlist/5zqUzVRqn6NZxAEeYkl6SN

docker run --rm -it -v $(pwd)/"music/playlists":/music ritiek/spotify-downloader -p https://open.spotify.com/playlist/5HEd4NldckiTSWPjqSAgQA


