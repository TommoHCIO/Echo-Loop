# PowerShell script to compress videos for GitHub
# This script creates compressed versions of the videos under 100MB

Write-Host "Video Compression Script for GitHub" -ForegroundColor Green
Write-Host "===================================" -ForegroundColor Green

# Check if FFmpeg is in PATH or download location
$ffmpegPath = "ffmpeg.exe"
$ffmpegUrl = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip"

# Function to compress video
function Compress-Video {
    param(
        [string]$InputFile,
        [string]$OutputFile,
        [int]$TargetSizeMB
    )

    # Calculate bitrate for target size (accounting for audio)
    # Assuming 15 second videos
    $duration = 15
    $targetBitrate = [math]::Floor(($TargetSizeMB * 8192) / $duration) - 128  # Subtract audio bitrate

    Write-Host "Compressing: $InputFile -> $OutputFile (Target: ${TargetSizeMB}MB)" -ForegroundColor Yellow

    # FFmpeg command for compression
    $ffmpegArgs = @(
        "-i", $InputFile,
        "-c:v", "libx264",
        "-b:v", "${targetBitrate}k",
        "-maxrate", "${targetBitrate}k",
        "-bufsize", "2000k",
        "-preset", "slow",
        "-movflags", "+faststart",
        "-vf", "scale=1920:1080",
        "-t", "15",
        "-an",  # Remove audio
        "-y",   # Overwrite output
        $OutputFile
    )

    if (Test-Path $ffmpegPath) {
        & $ffmpegPath $ffmpegArgs
    } else {
        Write-Host "FFmpeg not found. Please install FFmpeg first." -ForegroundColor Red
        Write-Host "Download from: $ffmpegUrl" -ForegroundColor Cyan
        return $false
    }

    return $true
}

# Compress golden waves video (target: 95MB to be safe)
$goldenWavesOriginal = "Echo Imgs\dark-golden-waves-background-loop-2025-08-29-09-52-17-utc.mov"
$goldenWavesCompressed = "Echo Imgs\golden-waves-compressed.mp4"

if (Test-Path $goldenWavesOriginal) {
    Compress-Video -InputFile $goldenWavesOriginal -OutputFile $goldenWavesCompressed -TargetSizeMB 95
} else {
    Write-Host "Golden waves video not found!" -ForegroundColor Red
}

# Compress wave fabric video (target: 95MB to be safe)
$waveFabricOriginal = "Echo Imgs\dark-wave-fabric-background-loop-2025-08-29-10-19-59-utc.mov"
$waveFabricCompressed = "Echo Imgs\wave-fabric-compressed.mp4"

if (Test-Path $waveFabricOriginal) {
    Compress-Video -InputFile $waveFabricOriginal -OutputFile $waveFabricCompressed -TargetSizeMB 95
} else {
    Write-Host "Wave fabric video not found!" -ForegroundColor Red
}

Write-Host "`nCompression complete!" -ForegroundColor Green
Write-Host "Compressed files are in 'Echo Imgs' folder" -ForegroundColor Cyan
Write-Host "`nNOTE: After pushing to GitHub, you can replace these with the original files locally." -ForegroundColor Yellow