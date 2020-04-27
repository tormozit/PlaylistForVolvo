https://github.com/tormozit/PlaylistForVolvo

Command line tool for Windows platform to generate playlists (m3u) for every folder on USB drive. Useful for Volvo cars.
Playlists are generated for first 2 levels of folder structure and they get names
1. first level - _<folder name>
2. second level - <first 3 letters of root folder name>.<folder name>

Playlist for folder contains all audio files in folder subtree.
Recommended folder organization:
1. first level - genres
2. second level - albums

Usage:
PlaylistForVolvo.exe <USB drive letter>

Example usage:
PlaylistForVolvo.exe F

Example output:
+ F:\Ambient\_Ambient.m3u
+ F:\Ambient\Cell - Live in Corfu (2020)\Amb.Cell - Live in Corfu (2020).m3u
+ F:\Ambient\Eguana_-_Numbness_(2020)\Amb.Eguana_-_Numbness_(2020).m3u
+ F:\DrumBass\_DrumBass.m3u
+ F:\DrumBass\Phace - Caged EP (2020)\Dru.Phace - Caged EP (2020).m3u
+ F:\DrumBass\REAPER - RENEGADE EP (2020)\Dru.REAPER - RENEGADE EP (2020).m3u
+ F:\Psy\_Psy.m3u
+ F:\Psy\VA - Guardians of the Light (2020)\Psy.VA - Guardians of the Light (2020).m3u
+ F:\Psy\Volcano - Sacred Tools, Vol. 2 (2020)\Psy.Volcano - Sacred Tools, Vol. 2 (2020).m3u
+ F:\Techno\_Techno.m3u
+ F:\Techno\Enrico Sangiuliano - Astral Projection (2017)\Tec.Enrico Sangiuliano - Astral Projection (2017).m3u
+ F:\Techno\Enrico Sangiuliano - Biomorph - 2018 (320 kbps)\Tec.Enrico Sangiuliano - Biomorph - 2018 (320 kbps).m3u

Example playlist page in Volvo car:
+_Ambient
+_DrumBass
+_Psy
+_Techno
+Amb.Cell - Live in Corfu (2020)
+Amb.Eguana_-_Numbness_(2020)
+Dru.Phace - Caged EP (2020)
+Dru.REAPER - RENEGADE EP (2020)
+Psy.VA - Guardians of the Light (2020)
+Psy.Volcano - Sacred Tools, Vol. 2 (2020)
+Tec.Enrico Sangiuliano - Astral Projection (2017)
+Tec.Enrico Sangiuliano - Biomorph - 2018 (320 kbps)
