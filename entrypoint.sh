#!/bin/bash
set -xe

mkdir -p /hls
rm -f /hls/*

# Пример захвата потока с USB камеры

ffmpeg \
-nostats \
-hide_banner \
-v info \
-f v4l2 \
-input_format mjpeg \
-framerate 30 \
-video_size 640x480 \
-i /dev/video0 \
-map 0:0 \
-pix_fmt yuv420p \
-c:v libx264 \
-b:v 5M \
-preset ultrafast \
-tune zerolatency \
-profile high \
-level 4.1 \
-g 30 \
-an \
-f hls \
-hls_time 3 \
-hls_list_size 3 \
-hls_flags delete_segments \
-hls_segment_filename "/hls/%09d.ts" \
/hls/index.m3u8

# Пример захвата потока с USB камеры с аппаратным ускорением VAAPI intel при энкодинге и наложением времени.
# https://trac.ffmpeg.org/wiki/Hardware/VAAPI

# ffmpeg \
# -nostats \
# -hide_banner \
# -v info \
# -fflags nobuffer \
# -vaapi_device /dev/dri/renderD128 \
# -f v4l2 \
# -input_format yuyv422 \
# -framerate 30 \
# -video_size 640x480 \
# -i /dev/video0 \
# -map 0:0 \
# -vf "drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='%{localtime\:%F %T %Z}':fontsize=24:fontcolor=white:x=10:y=10,format=nv12,hwupload" \
# -c:v h264_vaapi \
# -b:v 5M \
# -preset ultrafast \
# -tune zerolatency \
# -profile high \
# -level 4.1 \
# -g 30 \
# -an \
# -f hls \
# -hls_time 1 \
# -hls_list_size 2 \
# -hls_flags delete_segments \
# -hls_segment_filename "/hls/%09d.ts" \
# /hls/index.m3u8

# Пример захвата потока с камеры видеонаблюдения

# -abort_on empty_output \
# -v info \
# -nostats \
# -hide_banner \
# -analyzeduration 10000000 \
# -probesize 10000000 \
# -use_wallclock_as_timestamps 1 \
# -rtsp_transport tcp \
# -stimeout 5000000 \
# -i rtsp://login:passwd@192.168.1.11/stream1 \
# -f hls \
# -copytb 1 \
# -vsync -1 \
# -map 0:0 \
# -c copy \
# -an \
# -hls_time 1 \
# -hls_list_size 3 \
# -hls_flags delete_segments \
# -hls_segment_filename "/hls/%09d.ts" \
# /hls/index.m3u8


# Пример записи архива кусочками часу

# -f segment \
# -copytb 1 \
# -vsync -1 \
# -map 0:0 \
# -c copy \
# -an \
# -reset_timestamps 1 \
# -strftime 1 \
# -segment_atclocktime 1 \
# -segment_time 3600 \
# -segment_format mp4 \
# -segment_format_options movflags=faststart \
# /archive/%Y-%m-%d_%H-%M-%S.mp4
