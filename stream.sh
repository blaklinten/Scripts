cvlc -vvv v4l2:///dev/video0 --sout '#transcode{vcodec=theo,vb=800,acodec=vorb,ab=128,channels=2,samplerate=44100,scodec=none}:http{mux=ogg,dst=:8080/} --sout-all --sout-keep'
