Command line tool for Windows platform to generate playlists (m3u) for every folder on USB drive. Useful for Volvo cars.
Playlists are gererated for first 2 levels of folder structure. Playlist names are generated by rule
1. first level - _[folder name]
2. second level - <first 3 letters of root folder name>.<folder name>

Playlist for folder contains all audio files in folder subtree.
Recommended folder organization:
1. first level - genres
2. second level - albums

Usage:
PlaylistForVolvo.exe <USB drive letter>

Example usage:
PlaylistForVolvo.exe F
