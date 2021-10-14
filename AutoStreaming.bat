for /f "delims=" %%x in (config.cfg) do (set "%%x")
for %%a in (videos\*.*) do (
cls
echo Appuyez sur une touche pour lancer le stream de "%%a"
PAUSE
cls
:: ffmpeg.exe -re -i "videos\VODNBA2K.mp4" -i "overlay.png" -filter_complex "[0:v][1:v] overlay=0:0" -codec:a copu -vcodec libx264 -s 1920x1080 -r 60 -g 60 -b:v "%bitrate%k" -maxrate "%bitrate%k" -bufsize "%buffersize%k" -f flv 
ffmpeg.exe -re -i "%%a" -i "%overlay%" -filter_complex "[0:v][1:v] overlay=0:0" -codec:a copy -vcodec "%video_codec%" -preset "%codec_preset%" -profile:v "high" -rc "cbr" -s "%resolution%" -r "%fps%" -b:v "%bitrate%k" -maxrate "%bitrate%k" -bufsize "%buffersize%k" -f flv "%serveur%"
)