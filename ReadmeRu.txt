Вебсайт- https://sourceforge.net/projects/playlistforvolvo
Исходный код - https://github.com/tormozit/PlaylistForVolvo

Утилита командной строки для Windows платформы для создания списков воспроизведения (m3u) для каждой папки на USB-накопителе. Полезно для автомобилей Volvo.
Списки воспроизведения создаются для первых двух уровней структуры папок и получают имена:
1.первый уровень - _<имя папки>
2.второй уровень - <первые 3 буквы имени корневой папки>. <имя папки>

Список воспроизведения для папки содержит все аудиофайлы в поддереве папки. Рекомендуемая организация папок:
1.первый уровень - жанры
2.второй уровень - альбомы

Использование:
PlaylistForVolvo.exe <Путь к аудио коллекции> [r]

Параметры:
<Путь к аудио коллекции> - можно указать букву накопителя, либо путь к папке
r - для предварительного удаления всех существующих плейлистов в поддерере папки

Примеры использования:
PlaylistForVolvo.exe F
PlaylistForVolvo.exe F: r
PlaylistForVolvo.exe F:\Music

Пример вывода сообщений:
+ F:\Ambient\_Ambient.m3u
+ F:\Ambient\Cell - Live in Corfu (2020)\Amb. Cell - Live in Corfu (2020).m3u
+ F:\Ambient\Eguana_-_Numbness_(2020)\Amb. Eguana_-_Numbness_(2020).m3u
+ F:\DrumBass\_DrumBass.m3u
+ F:\DrumBass\Phace - Caged EP (2020)\Dru. Phace - Caged EP (2020).m3u
+ F:\DrumBass\REAPER - RENEGADE EP (2020)\Dru. REAPER - RENEGADE EP (2020).m3u
+ F:\Psy\_Psy.m3u
+ F:\Psy\VA - Guardians of the Light (2020)\Psy. VA - Guardians of the Light (2020).m3u
+ F:\Psy\Volcano - Sacred Tools, Vol. 2 (2020)\Psy. Volcano - Sacred Tools, Vol. 2 (2020).m3u
+ F:\Techno\_Techno.m3u
+ F:\Techno\Enrico Sangiuliano - Astral Projection (2017)\Tec. Enrico Sangiuliano - Astral Projection (2017).m3u
+ F:\Techno\Enrico Sangiuliano - Biomorph - 2018 (320 kbps)\Tec. Enrico Sangiuliano - Biomorph - 2018 (320 kbps).m3u

Пример страницы "Плейлисты" в автомобиле Volvo:
_Ambient
_DrumBass
_Psy
_Techno
Amb. Cell - Live in Corfu (2020)
Amb. Eguana_-_Numbness_(2020)
Dru. Phace - Caged EP (2020)
Dru. REAPER - RENEGADE EP (2020)
Psy. VA - Guardians of the Light (2020)
Psy. Volcano - Sacred Tools, Vol. 2 (2020)
Tec. Enrico Sangiuliano - Astral Projection (2017)
Tec. Enrico Sangiuliano - Biomorph - 2018 (320 kbps)

Поддерживаются аудиофайлы с расширениями:
aac
ac3
aif
aiff
alac
ape
apl
asf
cda
flac
m2a
m4a
mp3
mp2
mpa
ogg
oga
ra
wav
wma