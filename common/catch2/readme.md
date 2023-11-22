
### Предварительные требования

* Установленная Visual Studio 2022
* Установленный cmake под windows
* Текстовый редактор, типа блокнота

### Подготовка проекта
Создаём каталог для решения, для примера будет в каталоге `C:\projects\test_factorial\`.
Создаём в нём `CMakeLists.txt` следующего содержимого через текстовый редактор:
```cmake
#минимальная версия cmake
cmake_minimum_required(VERSION 3.10)
#имя проекта
project(demoVendorCatch2)
#добавляем поддиректорию, в которой будет catch2
add_subdirectory(catch2)
#добавялем цель - приложение, у которого исходник с единственным приложением
add_executable(${PROJECT_NAME} main.cpp)
#линкуемся к catch2, в котором уже есть main
target_link_libraries(${PROJECT_NAME} PRIVATE Catch2::Catch2 Catch2::Catch2WithMain)
```

Далее, создаём файл `main.cpp` через текстовый редактор следующего содержимого:
```cpp
//подключаем макросы catch2
#include <catch2/catch_test_macros.hpp>

#include <cstdint>

//проверяемая функция
uint32_t factorial( uint32_t number ) {
    return number <= 1 ? number : factorial(number-1) * number;
}

//юнит-тест
TEST_CASE( "Factorials are computed", "[factorial]" ) {
    REQUIRE( factorial( 1) == 1 );
    REQUIRE( factorial( 2) == 2 );
    REQUIRE( factorial( 3) == 6 );
    REQUIRE( factorial(10) == 3'628'800 );
}
```

Сейчас у вас структура каталога следующая:
```
\---test_factorial
    CMakeLists.txt
    main.cpp
```
### Установка catch2
Переходим на официальную страницу: https://github.com/catchorg/Catch2
Нажимаем кнопку Code->Download zip
![[Pasted image 20231122165402.png]]
Скачанный архив распаковываем в каталог с проектом  `C:\projects\test_factorial\` и переименовываем в catch2, обратите внимание на новую структуру каталога:
```
\---test_factorial
    |   CMakeLists.txt
    |   main.cpp
    |
    \---catch2
        |   .bazelrc
        |   .clang-format
        |   .gitattributes
        |   .gitignore
        |   appveyor.yml
        |   BUILD.bazel
        |   CMakeLists.txt
        |   CMakePresets.json
        |   codecov.yml
        |   CODE_OF_CONDUCT.md
        |   conanfile.py
        |   Doxyfile
        |   LICENSE.txt
        |   mdsnippets.json
        |   meson.build
        |   meson_options.txt
        |   README.md
        |   SECURITY.md
        |   WORKSPACE.bazel
        |
        +---.conan
        ...
```

### Сборка в Visual Studio
Теперь можно открывать в Студии. После запуска нажимаем продолжить без кода и выбираем открыть Cmake:
![[Pasted image 20231122171210.png]]
Выбираем наш CMakeLists из test_factorial. Студия начнёт автоматический разбор и подготовку проекта. Обратите внимание на вывод построения Cmake, всё должно пройти без ошибок:
![[Pasted image 20231122171357.png]]
Нажимаем Сборка->Собрать всё (F7). Успешный вывод сборки:
![[Pasted image 20231122171627.png]]
Подсвечен результат сборки - бинарник с юнит-тестом. Можно запустить его из системы по пути `C:\projects\test_factorial\out\build\x64-Debug\demoVendorCatch2`, либо выбираем для запуска прямо из студии: 
![[Pasted image 20231122171759.png]]Результат:
![[Pasted image 20231122171933.png]]
Обратите внимание, Randomness у вас может быть другим.
