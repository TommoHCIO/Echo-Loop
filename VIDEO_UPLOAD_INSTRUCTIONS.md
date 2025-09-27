# Video Upload Instructions for Echo Loop

## Important: Manual Video Upload Required

Due to GitHub's 100MB file size limit, the following video files need to be manually uploaded to your hosting server:

### Required Video Files

1. **Homepage Video**
   - File: `dark-golden-waves-bg.mp4`
   - Source: `Echo Imgs/dark-golden-waves-background-loop-2025-08-29-09-52-17-utc.mov`
   - Size: ~141MB
   - Upload to: `/public/dark-golden-waves-bg.mp4`

2. **About & Whitepaper Pages Video**
   - File: `dark-wave-fabric-bg.mp4`
   - Source: `Echo Imgs/dark-wave-fabric-background-loop-2025-08-29-10-19-59-utc.mov`
   - Size: ~234MB
   - Upload to: `/public/dark-wave-fabric-bg.mp4`

### Upload Instructions

1. Convert the .mov files to .mp4 format if needed (they may already be compatible)
2. Upload both video files to your server's `/public` directory
3. Ensure the files are named exactly as specified above
4. The HTML files are already configured to reference these video names

### Alternative: Video Compression

If you need to reduce file sizes for easier upload:
- Use a video compression tool like HandBrake
- Target bitrate: 2-4 Mbps for good quality
- Resolution: 1920x1080 or lower
- Format: H.264 MP4

### Deployment Notes

- The HTML files have been updated with cache-busting parameters (`?v=20250928`)
- Videos will loop seamlessly once properly uploaded
- Ensure your server has sufficient bandwidth for video streaming

## Changes Made

- Homepage: Updated to use `dark-golden-waves-bg.mp4`
- About page: Updated to use `dark-wave-fabric-bg.mp4`
- Whitepaper: Updated to use `dark-wave-fabric-bg.mp4`
- TOC Width: Increased by 25% (260px → 325px) on whitepaper page