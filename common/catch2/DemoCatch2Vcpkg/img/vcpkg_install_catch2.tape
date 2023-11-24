#tools in path:
# * vhs.exe from releases https://github.com/charmbracelet/vhs/releases
# * ttyd.exe from https://github.com/tsl0922/ttyd/releases
# * ffmeg.exe from https://www.gyan.dev/ffmpeg/builds/
#run in git bash.
#export PATH="$PATH:/c/tools"
#cd /c/tools/demo
#vhs vcpkg_install_catch2.tape

# Where should we write the GIF?
Output vcpkg_install.gif

# Set up a 1200x600 terminal with 46px font.
Set FontSize 18
Set Width 1200
Set Height 600

Type "cls"
Enter

Type "::Эту строку можно не печатать в консоли"
Enter
Type "::Получаем vcpkg из гитхаба"
Enter

Type "git clone https://github.com/microsoft/vcpkg"
Enter
Sleep 15s

Type "::Переходим в скачанный каталог"
Enter
Type "cd vcpkg"
Sleep 500ms
Enter
Sleep 500ms

Type "::Посмотрим на содержимое директории"
Enter
Type "dir /D"
Sleep 500ms
Enter
Sleep 5s

Type "::создаём утилиту vcpkg.exe под нашу систему и компилятор"
Enter
Type "bootstrap-vcpkg.bat"
Sleep 500ms
Enter
Sleep 5s

Type "::устанавливаем catch2 для x86"
Enter
Type "::Придётся подождать первый раз, нужны дополнительные утилиты"
Enter
Type "vcpkg.exe install catch2:x86-windows"
Sleep 500ms
Enter
Sleep 70s

Type "::устанавливаем catch2 для x64"
Enter
Type "vcpkg.exe install catch2:x64-windows"
Sleep 500ms
Enter
Sleep 70s

Type "::Готово, теперь можно подключать к проекту"
Enter
Sleep 5s