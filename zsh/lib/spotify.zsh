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
