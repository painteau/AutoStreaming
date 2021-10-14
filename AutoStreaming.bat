@echo off
cls
echo This will start the stream...
pause
for /f "delims=" %%x in (config.cfg) do (set "%%x")
for %%a in (videos\*.mp4) do (
cls
ffmpeg.exe -re -i "%%a" -i "%overlay%" -filter_complex "[0:v][1:v] overlay=0:0" -codec:a copy -vcodec "%video_codec%" -preset "%codec_preset%" -profile:v "high" -rc "cbr" -s "%resolution%" -r "%fps%" -b:v "%bitrate%k" -maxrate "%bitrate%k" -bufsize "%buffersize%k" -f flv "%serveur%"
)