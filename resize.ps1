Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile("a:\RailSummaryPWA\icon.jpg")

function Save-ResizedImage {
    param([int]$size, [string]$path)
    $bmp = New-Object System.Drawing.Bitmap($size, $size)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.DrawImage($img, 0, 0, $size, $size)
    $g.Dispose()
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
}

Save-ResizedImage 192 "a:\RailSummaryPWA\icon-192.png"
Save-ResizedImage 512 "a:\RailSummaryPWA\icon-512.png"
$img.Dispose()
