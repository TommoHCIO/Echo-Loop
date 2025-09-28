# Video Conversion Guide for Echo Loop Background Videos

## Overview
This guide provides the optimal conversion settings to transform the large .mov files into web-optimized background videos.

## Source Files
- **Homepage**: `dark-golden-waves-background-loop-2025-08-29-09-52-17-utc.mov` (141MB)
- **About/Whitepaper**: `dark-wave-fabric-background-loop-2025-08-29-10-19-59-utc.mov` (234MB)

## Target Specifications
Based on 2025 web optimization research:
- **File size**: 8-12MB per video (90% reduction)
- **Formats**: MP4 (H.264) + WebM (VP9) for browser compatibility
- **Resolution**: 1920x1080 (Full HD)
- **Duration**: 15-20 seconds loop
- **Frame rate**: 30fps (24fps for mobile)

## FFmpeg Conversion Commands

### 1. Golden Waves Video (Homepage)

#### MP4 Conversion (Primary format)
```bash
ffmpeg -i "Echo Imgs/dark-golden-waves-background-loop-2025-08-29-09-52-17-utc.mov" \
  -c:v libx264 \
  -crf 23 \
  -preset medium \
  -movflags +faststart \
  -vf "scale=1920:1080,fps=30" \
  -t 15 \
  -an \
  "public/dark-golden-waves-bg.mp4"
```

#### WebM Conversion (Optimized compression)
```bash
ffmpeg -i "Echo Imgs/dark-golden-waves-background-loop-2025-08-29-09-52-17-utc.mov" \
  -c:v libvpx-vp9 \
  -crf 30 \
  -b:v 0 \
  -row-mt 1 \
  -vf "scale=1920:1080,fps=30" \
  -t 15 \
  -an \
  "public/dark-golden-waves-bg.webm"
```

#### Mobile-Optimized Version (720p)
```bash
ffmpeg -i "Echo Imgs/dark-golden-waves-background-loop-2025-08-29-09-52-17-utc.mov" \
  -c:v libx264 \
  -crf 28 \
  -preset medium \
  -movflags +faststart \
  -vf "scale=1280:720,fps=24" \
  -t 15 \
  -an \
  "public/dark-golden-waves-bg-mobile.mp4"
```

#### Poster Frame Generation
```bash
ffmpeg -i "Echo Imgs/dark-golden-waves-background-loop-2025-08-29-09-52-17-utc.mov" \
  -vf "scale=1920:1080" \
  -frames:v 1 \
  "public/dark-golden-waves-poster.jpg"
```

### 2. Wave Fabric Video (About/Whitepaper)

#### MP4 Conversion (Primary format)
```bash
ffmpeg -i "Echo Imgs/dark-wave-fabric-background-loop-2025-08-29-10-19-59-utc.mov" \
  -c:v libx264 \
  -crf 23 \
  -preset medium \
  -movflags +faststart \
  -vf "scale=1920:1080,fps=30" \
  -t 15 \
  -an \
  "public/dark-wave-fabric-bg.mp4"
```

#### WebM Conversion (Optimized compression)
```bash
ffmpeg -i "Echo Imgs/dark-wave-fabric-background-loop-2025-08-29-10-19-59-utc.mov" \
  -c:v libvpx-vp9 \
  -crf 30 \
  -b:v 0 \
  -row-mt 1 \
  -vf "scale=1920:1080,fps=30" \
  -t 15 \
  -an \
  "public/dark-wave-fabric-bg.webm"
```

#### Mobile-Optimized Version (720p)
```bash
ffmpeg -i "Echo Imgs/dark-wave-fabric-background-loop-2025-08-29-10-19-59-utc.mov" \
  -c:v libx264 \
  -crf 28 \
  -preset medium \
  -movflags +faststart \
  -vf "scale=1280:720,fps=24" \
  -t 15 \
  -an \
  "public/dark-wave-fabric-bg-mobile.mp4"
```

#### Poster Frame Generation
```bash
ffmpeg -i "Echo Imgs/dark-wave-fabric-background-loop-2025-08-29-10-19-59-utc.mov" \
  -vf "scale=1920:1080" \
  -frames:v 1 \
  "public/dark-wave-fabric-poster.jpg"
```

## Command Explanation

### Key Parameters
- `-crf 23`: Constant Rate Factor for quality (lower = higher quality)
- `-preset medium`: Encoding speed vs compression balance
- `-movflags +faststart`: Optimizes for web streaming (moves metadata to start)
- `-vf "scale=1920:1080"`: Ensures consistent resolution
- `-fps=30/24`: Frame rate optimization (30 for desktop, 24 for mobile)
- `-t 15`: Limits duration to 15 seconds for optimal loop
- `-an`: Removes audio track (not needed for background videos)
- `-row-mt 1`: Enables row-based multithreading for VP9

### Quality Settings
- **CRF 23**: DVD-quality, good balance of size and quality
- **CRF 28**: Lower quality for mobile, smaller file sizes
- **CRF 30**: WebM optimization, leverages VP9's superior compression

## Alternative Tools

If FFmpeg is not available, use these alternatives:

### Online Converters
1. **CloudConvert**: Supports MOV to MP4/WebM conversion
2. **Convertio**: Free online video converter
3. **Online-Convert**: Offers compression settings

### Desktop Applications
1. **HandBrake**: Free, cross-platform video transcoder
2. **VLC Media Player**: Can convert videos with custom settings
3. **Adobe Media Encoder**: Professional video encoding

### HandBrake Settings
- **Container**: MP4 or WebM
- **Video Codec**: H.264 (x264) or VP9
- **Quality**: RF 23 for MP4, RF 30 for WebM
- **Framerate**: 30fps constant
- **Resolution**: 1920x1080
- **Audio**: Remove track

## Expected Results

### File Sizes (Estimated)
- **Original MOV files**: 141MB + 234MB = 375MB total
- **Optimized MP4 files**: ~10MB + ~12MB = 22MB total
- **Optimized WebM files**: ~7MB + ~8MB = 15MB total
- **Mobile versions**: ~4MB + ~5MB = 9MB total

### Performance Improvements
- **90% file size reduction**
- **Faster loading**: 2-3 seconds vs 10+ seconds
- **Better browser compatibility**: MP4 + WebM support
- **Mobile optimization**: Responsive loading based on device

## Next Steps

1. **Convert videos** using the commands above
2. **Verify file sizes** are within 8-12MB range
3. **Test playback** in multiple browsers
4. **Update HTML files** with new video sources
5. **Deploy optimized videos** to production

## Troubleshooting

### If videos are too large:
- Increase CRF value (lower quality, smaller size)
- Reduce resolution to 1280x720
- Decrease frame rate to 24fps
- Shorten duration to 10 seconds

### If quality is poor:
- Decrease CRF value (higher quality, larger size)
- Use 2-pass encoding for WebM
- Increase bitrate with `-b:v` parameter
- Test different presets (slow, veryslow)

This conversion will transform your 375MB of video assets into ~37MB of optimized web content, providing a 90% reduction in file size while maintaining professional quality.