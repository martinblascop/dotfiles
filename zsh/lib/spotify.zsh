function play_pause(){
	dbus-send \
		--print-reply \
		--dest=org.mpris.MediaPlayer2.spotify \
		/org/mpris/MediaPlayer2 \
		org.mpris.MediaPlayer2.Player.PlayPause
}
function next_song() {
	dbus-send \
		--print-reply \
		--dest=org.mpris.MediaPlayer2.spotify \
		/org/mpris/MediaPlayer2 \
		org.mpris.MediaPlayer2.Player.Next
}

function previous_song() {
	dbus-send \
		--print-reply \
		--dest=org.mpris.MediaPlayer2.spotify \
		/org/mpris/MediaPlayer2 \
		org.mpris.MediaPlayer2.Player.Prev
}

function get_current_song(){
	qdbus \
		--literal org.mpris.MediaPlayer2.spotify \
		/org/mpris/MediaPlayer2 \
		org.freedesktop.DBus.Properties.Get \
		org.mpris.MediaPlayer2.Player \
		Metadata
}

if [ `uname -s` = "Darwin" ]; then
	play_pause(){ osascript -e 'tell application "Spotify" to playpause' }
	unset -f next_song
	next_song(){ osascript -e 'tell application "Spotify" to next track'}
	unset -f previous_song
	previous_song(){
		osascript -e ' tell application "Spotify" set player position to 0 previous track end tell' }
	unset -f get_current_song
	get_current_song(){ osascript -e 'tell application "Spotify" to name of current track as string' }
fi
