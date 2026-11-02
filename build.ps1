# Builds the standalone, double-click-to-open copy of the Rongo mā Tāne profile tool.
# src\rongo-ma-tane.html is the page body (also what gets published as the online version);
# this wraps it in a full HTML document so it opens correctly straight from a folder.
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$src = Join-Path $root 'src\rongo-ma-tane.html'
$out = Join-Path $root 'Rongo-ma-Tane-Sensory-Profile.html'
$utf8 = New-Object System.Text.UTF8Encoding($false)
$body = [IO.File]::ReadAllText($src, $utf8)
# noindex keeps the test site out of Google and other search engines; anyone with the link can still open it.
$head = '<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><meta name="robots" content="noindex, nofollow"><style>:root{color-scheme:light}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style></head><body>'
$page = $head + "`n" + $body + "`n</body></html>`n"
[IO.File]::WriteAllText($out, $page, $utf8)
Write-Output "Built $out"
# Same page as index.html at the top of the repo, which is what GitHub Pages serves.
[IO.File]::WriteAllText((Join-Path $root 'index.html'), $page, $utf8)
Write-Output "Built $(Join-Path $root 'index.html')"
