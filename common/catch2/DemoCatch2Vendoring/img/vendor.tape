#tools in path:
# * vhs.exe from releases https://github.com/charmbracelet/vhs/releases
# * ttyd.exe from https://github.com/tsl0922/ttyd/releases
# * ffmeg.exe from https://www.gyan.dev/ffmpeg/builds/
#run in git bash. Prepare tools: `export PATH="$PATH:/c/tools"`

# Where should we write the GIF?
Output vendor.gif

# Set up a 1200x600 terminal with 46px font.
Set FontSize 18
Set Width 1200
Set Height 600

Type "::Это комментарий"
Enter
Type "::Получаем версию из гитхаба"
Enter

Type "git clone https://github.com/antlas1/DemoCatch2Vendoring.git"
Enter
Sleep 8s

Type "::Переходим в скачанный каталог"
Enter
Type "cd DemoCatch2Vendoring"
Sleep 500ms
Enter
Sleep 500ms

Type "::Посмотрим на файлы и папку"
Enter
Type "dir /B"
Sleep 500ms
Enter
Sleep 500ms

Type "::создаём директорию для генерации проекта cmake"
Enter
Type "mkdir build"
Sleep 500ms
Enter
Sleep 500ms

Type "::переходим в директорию генерации"
Enter
Type "cd build"
Sleep 500ms
Enter
Sleep 500ms

Type "::настраиваем переменные среды для сборки visual studio 2022"
Enter
Type 'call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"'
Sleep 5s
Enter
Sleep 500ms

Type "::запускаем генератор для получения solution visual studio"
Enter
Type 'cmake -G "Visual Studio 17 2022" -A "x64" ..'
Sleep 500ms
Enter
Sleep 15s

Type "::проверяем, что появился build\demoVendorCatch2.sln"
Enter
Type "dir /B"
Sleep 500ms
Enter
Sleep 5s

Type "::Готово, теперь можно открывать в студии"
Enter
Sleep 5s