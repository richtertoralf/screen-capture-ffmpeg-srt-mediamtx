:: Screen Capture to SRT for MediaMTX
:: Toralf Richter

@echo off
:: ==================== Configuration ====================
:: Public IP address of the MediaMTX server
set "MEDIAMTX_SERVER_IP=DEINE_SERVER_IP"

:: SRT port used by MediaMTX for receiving streams
set "SRT_PORT=8890"

:: Stream ID for identifying this stream in MediaMTX
set "STREAM_ID=screen01"

:: Screen resolution for the capture (e.g., 1920x1080)
set "VIDEO_RESOLUTION=1920x1080"

:: Bitrate for the video stream (e.g., 3000k for 3 Mbps)
set "VIDEO_BITRATE=3000k"

:: Packet size for SRT transmission (default: 1316 bytes)
set "SRT_PACKET_SIZE=1316"

:: Construct the SRT target URL for streaming
set "SRT_TARGET=srt://%MEDIAMTX_SERVER_IP%:%SRT_PORT%?streamid=publish:%STREAM_ID%&pkt_size=%SRT_PACKET_SIZE%"
:: =======================================================

:: ============== Optional: Log Stream Info ==============
:: Create a log file with relevant information for debugging
echo ==== Stream Log ==== >> %~f0.log
echo Date: %date% >> %~f0.log
echo Time: %time% >> %~f0.log
echo Stream ID: %STREAM_ID% >> %~f0.log
echo Video Resolution: %VIDEO_RESOLUTION% >> %~f0.log
echo Video Bitrate: %VIDEO_BITRATE% >> %~f0.log
echo SRT Target: %SRT_TARGET% >> %~f0.log
echo ==================== >> %~f0.log
:: =======================================================

:endless_loop

:: Optional: Ping the MediaMTX server to check connectivity before starting
ping -n 1 %MEDIAMTX_SERVER_IP% >nul || goto endless_loop

:: Start streaming with ffmpeg using the configured parameters
start /min "ffmpeg %STREAM_ID%" ffmpeg -f gdigrab -framerate 5 -video_size %VIDEO_RESOLUTION% -show_region 1 -i desktop -b:v %VIDEO_BITRATE% -f mpegts %SRT_TARGET%

:: Keep the script running in an endless loop (adjust timing as needed)
ping -n 15 localhost >nul
goto endless_loop
