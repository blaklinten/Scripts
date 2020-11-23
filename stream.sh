cvlc -vvv v4l2:///dev/video0 --sout '#transcode{vcodec=theo,acodec=vorb,vb=400,ab=128,scale=0.5,channels=2,samplerate=44100,scodec=none}:http{mux=ogg,dst=:8080/} --sout-all --sout-keep'
