# Catch2

В этой инструкции:
- разберёмся, как устанавливать библиотеки для использования в своём проекте,
- познакомимся с процессом установки Catch2 с использованием Microsoft Visual Studio 2022 Community Edition в режиме вендоринга,
- узнаем, как запустить юнит-тест.

План:

1. [Способы установки библиотеки Сatch2.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D1%8B-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8-%D0%B1%D0%B8%D0%B1%D0%BB%D0%B8%D0%BE%D1%82%D0%B5%D0%BA%D0%B8-catch2)
2. [Предварительные требования.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D0%BF%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5-%D1%82%D1%80%D0%B5%D0%B1%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
3. [Шаг 1. Подготовка проекта.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%88%D0%B0%D0%B3-1-%D0%BF%D0%BE%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0)
4. [Шаг 2. Установка Catch2.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%88%D0%B0%D0%B3-2-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-catch2)
5. [Шаг 3. Сборка в Visual Studio.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%88%D0%B0%D0%B3-3-%D1%81%D0%B1%D0%BE%D1%80%D0%BA%D0%B0-%D0%B2-visual-studio)
6. [Шаг 4. Запуск юнит-теста.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%88%D0%B0%D0%B3-4-%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D1%8E%D0%BD%D0%B8%D1%82-%D1%82%D0%B5%D1%81%D1%82%D0%B0)
7. [Рекомендации по другим операционным системам.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%80%D0%B5%D0%BA%D0%BE%D0%BC%D0%B5%D0%BD%D0%B4%D0%B0%D1%86%D0%B8%D0%B8-%D0%BF%D0%BE-%D0%B4%D1%80%D1%83%D0%B3%D0%B8%D0%BC-%D0%BE%D0%BF%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D1%8B%D0%BC-%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0%D0%BC)
8. [Часто встречаемые проблемы.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%87%D0%B0%D1%81%D1%82%D0%BE-%D0%B2%D1%81%D1%82%D1%80%D0%B5%D1%87%D0%B0%D0%B5%D0%BC%D1%8B%D0%B5-%D0%BF%D1%80%D0%BE%D0%B1%D0%BB%D0%B5%D0%BC%D1%8B)
9. [Полезные ссылки.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D0%BF%D0%BE%D0%BB%D0%B5%D0%B7%D0%BD%D1%8B%D0%B5-%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B8)

-----

### Способы установки библиотеки Catch2

Существует несколько способов установки библиотеки Catch2:
1. Скачать скомпилированные бинарные сборки для своей операционной системы и компилятора с официального сайта. Этот способ чаще всего применяется для коммерческих проектов и не обладает нужной гибкостью. В этом гайде мы не будет его рассматривать, так как система Catch2 не обладает такими релизами.
2. Вендоринг. Это по сути простое копирование всех исходников библиотеки в свой проект. В этом способе есть свои плюсы и минусы. Плюсы: повышенная надёжность, не зависит от изменений репозитория с библиотекой, наилучшая переносимость. Минусы: увеличение объёма кода проекта, компиляция происходит дольше. Тем не менее, это наиболее простой и наглядный способ. Каталог с демонстрационным проектом есть здесь: [DemoCatch2Vendoring](https://github.com/netology-code/cppl-homeworks/tree/main/common/catch2/DemoCatch2Vendoring). Этот способ мы рассмотрим по шагам ниже.
3. Пакетный менеджер. Существует несколько популярных пакетных менеджеров - `vcpkg` и `conan`. Плюсы: зависимости от библиотек прописываются в проекте, при этом установкой и обслуживанием занимается менеджер пакетов. Минусы: требуется установка менеджера, установка библиотеки для платформы через менеджер, старт сложнее. Способ подходит для крупных и серьёзных библиотек, в том числе и для Catch2. Каталог с демонстрационным проектом есть тут: [DemoCatch2Vcpkg](https://github.com/netology-code/cppl-homeworks/tree/main/common/catch2/DemoCatch2Vcpkg).
4. Инструкция по сборке и подключению от авторов. В хороших библиотеках всегда есть такие инструкции. Однако здесь необходимо учитывать особенности конкретной библиотеки и принимать решение в зависимости от проекта.

-----

### Предварительные требования

* Установленная Visual Studio 2022
* Установленный Cmake под Windows
* Текстовый редактор типа блокнота

-----

### Шаг 1. Подготовка проекта

1. Создадим каталог для решения. В этом примере рассмотрим вариант в каталоге `C:\projects\test_factorial\`.

2. Создадим в каталоге файл `CMakeLists.txt` следующего содержания через текстовый редактор:
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

3. Далее создадим файл `main.cpp` через текстовый редактор следующего содержания:
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

4. В результате у вас получится следующая структура каталога:
```
\---test_factorial
    CMakeLists.txt
    main.cpp
```
-----

### Шаг 2. Установка Catch2

1. Переходим на [официальную страницу Catch2](https://github.com/catchorg/Catch2).

2. Нажимаем кнопку Code->Download zip

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122165402.png)

3. Скачанный архив распаковываем в каталог с проектом  `C:\projects\test_factorial\` и переименовываем в `catch2`. Обратите внимание на новую структуру каталога:
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

-----

### Шаг 3. Сборка в Visual Studio

1. Теперь можно открывать проект в Студии. После запуска нажимаем «Продолжить без кода» и выбираем «Открыть» -> «Cmake»:

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122171210.png)

2. Выбираем наш `CMakeLists` из `test_factorial`. Студия начнёт автоматический разбор и подготовку проекта. Обратите внимание на вывод построения Cmake, всё должно пройти без ошибок:

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122171357.png)

3.Нажимаем Сборка->Собрать всё (F7). Успешный вывод сборки:

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122171627.png)

Подсвечен результат сборки - бинарник с юнит-тестом. 

-----

### Шаг 4. Запуск юнит-теста
Можно запустить юнит-тест из системы по пути `C:\projects\test_factorial\out\build\x64-Debug\demoVendorCatch2`, либо выбираем для запуска прямо из студии: 

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122171759.png)


Результат запуска:

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122171933.png)

Обратите внимание, `Randomness` у вас может быть другим.

-----

### Рекомендации по другим операционным системам
Вариант вендоринга или установка через пакетный менеджер - кросплатформенные. Если у вас есть рабочий компилятор и Cmake, то можете устанавливать и использовать Catch2, по инструкции, за исключением особенностей IDE Visual Studio 2022.

-----

### Часто встречаемые проблемы

* Не конфигурируется проект. Ошибка Cmake.
> Проверьте наличие Cmake в системном пути

* Проект конфигурируется, но не компилируется.
> Скачайте демонстрационный проект и попробуйте собрать. Если не работает, значит проблема в настройках компилятора. Если работает, найдите отличия между вашим решением и эталонным.

* При запуске пишет «Файлы не найдены».
> Выберите активным проектом `demoCatch2Vendoring`. Иначе, активным проектом может быть сама библиотека.

-----

### Полезные ссылки

* [Официальная документация по проекту. Интеграция с Cmake](https://github.com/catchorg/Catch2/blob/devel/docs/cmake-integration.md).
