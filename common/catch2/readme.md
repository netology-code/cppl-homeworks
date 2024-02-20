# Инструкция по установке и работе с Сatch2

В этой инструкции:
- разберёмся, как устанавливать библиотеки Catch2 для своего проекта,
- познакомимся с процессом установки Catch2 с использованием Microsoft Visual Studio 2022 Community Edition в режиме вендоринга,
- узнаем, как запустить юнит-тест.

План:

1. [Способы установки библиотеки Сatch2.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%81%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D1%8B-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8-%D0%B1%D0%B8%D0%B1%D0%BB%D0%B8%D0%BE%D1%82%D0%B5%D0%BA%D0%B8-catch2)
2. [Предварительные требования.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D0%BF%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5-%D1%82%D1%80%D0%B5%D0%B1%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
3. [Шаг 1. Подготовка проекта.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%88%D0%B0%D0%B3-1-%D0%BF%D0%BE%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0)
4. [Шаг 2. Установка Catch2.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%88%D0%B0%D0%B3-2-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-catch2)
5. [Шаг 3. Сборка в Visual Studio.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%88%D0%B0%D0%B3-3-%D1%81%D0%B1%D0%BE%D1%80%D0%BA%D0%B0-%D0%B2-visual-studio)
6. [Шаг 4. Запуск юнит-теста.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%88%D0%B0%D0%B3-4-%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D1%8E%D0%BD%D0%B8%D1%82-%D1%82%D0%B5%D1%81%D1%82%D0%B0)
7. [Часто встречаемые проблемы.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D1%87%D0%B0%D1%81%D1%82%D0%BE-%D0%B2%D1%81%D1%82%D1%80%D0%B5%D1%87%D0%B0%D0%B5%D0%BC%D1%8B%D0%B5-%D0%BF%D1%80%D0%BE%D0%B1%D0%BB%D0%B5%D0%BC%D1%8B)
8. [Полезные ссылки.](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/readme.md#%D0%BF%D0%BE%D0%BB%D0%B5%D0%B7%D0%BD%D1%8B%D0%B5-%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D0%B8)

-----

### Способы установки библиотеки Catch2

Чтобы установить  библиотеку Catch2, вы можете воспользоваться одним из 4 способов:
1. **Вендоринг.** Этот способ представляет собой простое копирование всех исходников библиотеки в структуру своего проекта. Этот подход обладает своими плюсами и минусами. Среди преимуществ: повышенная надёжность, независимость от изменений в репозитории библиотеки и лучшая переносимость. Однако существуют и недостатки: увеличение объёма кода проекта и увеличение времени компиляции. Несмотря на это, вендоринг остается одним из самых простых и наглядных методов. Каталог с демонстрационным проектом можно найти по ссылке – [DemoCatch2Vendoring](https://github.com/netology-code/cppl-homeworks/tree/main/common/catch2/DemoCatch2Vendoring). Этот метод ниже рассмотрим пошагово.

2. **Пакетный менеджер.** 2 популярных пакетных менеджера: `vcpkg` и `conan`. Его плюсы: зависимости от библиотек прописываются в проекте при этом установкой и обслуживанием занимается менеджер пакетов. Минусы подхода: требуется установка менеджера, установка библиотеки для платформы через менеджер, старт сложнее. Этот метод подходит для крупных и серьёзных проектов. Каталог с демонстрационным проектом доступен по ссылке – [DemoCatch2Vcpkg](https://github.com/netology-code/cppl-homeworks/tree/main/common/catch2/DemoCatch2Vcpkg).

3. **Инструкция по сборке и подключению от авторов.** В хороших библиотеках всегда есть такие инструкции. Важно изучить конкретную библиотеку и решить соответствует ли предложенный метод установки вашим требованиям. Для Catch2 она расположена в [документации GitHub](https://github.com/catchorg/Catch2/blob/devel/docs/cmake-integration.md).

4. **Использовать облегчённую версию.** В этом случае у вас будет только 2 дополнительных файла: `catch_amalgamated.hpp` и `catch_amalgamated.cpp`. Вы можете просто скачать их и подключить, как часть многофайлового проекта удобным для себя способом.

-----

### Предварительные требования

Перед работой работой с проектом убедитесь, что у вас установлены следующие программы или проведите их установку:

* [Visual Studio 2022](https://github.com/netology-code/cppm-homeworks/blob/main/common/instr/readme.md?),
* [CMake под Windows](https://github.com/catchorg/Catch2/blob/devel/docs/cmake-integration.md),
* текстовый редактор, например, Блокнот.

-----

### Шаг 1. Подготовка проекта

1. Создайте каталог для проекта, например, в директории `C:\projects\test_factorial\`.

2. В этом каталоге создайте файл `CMakeLists.txt` и внесите в него следующий текст через текстовый редактор:
```cmake
#минимальная версия cmake
cmake_minimum_required(VERSION 3.10)
#имя проекта
project(demoVendorCatch2)
#добавляем поддиректорию, в которой будет catch2
add_subdirectory(catch2)
#добавляем цель - приложение, у которого исходник с единственным приложением
add_executable(${PROJECT_NAME} main.cpp)
#линкуемся к catch2, в котором уже есть main
target_link_libraries(${PROJECT_NAME} PRIVATE Catch2::Catch2 Catch2::Catch2WithMain)
```

3. Далее в той же директории создайте файл `main.cpp`. Добавьте в файл через текстовый редактор скрипт с вашим тестом. Для примера можете воспользоваться следующим вариантом теста для проверки работы функции, которая рассчитывает факториал:
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

_Примечание: создание скрипта этого теста подробно разобран в частях 2 и 3 материалов занятия «Тестирование» в личном кабинете._

4. В результате у вас должна получиться следующая структура каталога:
```
\---test_factorial
    CMakeLists.txt
    main.cpp
```
-----

### Шаг 2. Установка Catch2

1. Перейдите на официальную страницу Catch2 по [ссылке](https://github.com/catchorg/Catch2). На странице нажмите кнопку «Code» и в выпадающем списке выберите `Download ZIP`, как на скрине:

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122165402.png)

2. Скачайте архив Download zip и выполните его распаковку в каталог с проектом – `C:\projects\test_factorial\`.

3. Переименуйте распакованный каталог в `catch2`. В результате должна получиться следующая обновлённая структура каталога:
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

1. Теперь можно открыть проект в Visual Studio. Для этого запустите Visual Studio. Если Visual Studio не была ранее установлена на вашем компьютере, воспользуйтесь [инструкцией](https://github.com/netology-code/cppm-homeworks/blob/main/common/instr/readme.md).

2. После запуска программы выберите «Продолжить без кода». В окне откройте проект через CMake. Для этого пройдите по пути Файл → Открыть → CMake, как на скрине:

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122171210.png)

2. Выберите файл `CMakeLists.txt` в директории `C:\projects\test_factorial\`. После этого студия начнёт автоматический разбор и подготовку проекта. Обратите внимание на вывод построения Cmake, всё должно пройти без ошибок:

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122171357.png)

3. Далее на верхней панели выберите Сборка → Собрать всё или воспользуйтесь клавишей F7. Результатом успешной сборки будет вывод, как на скрине:

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122171627.png)

_Примечание: здесь подсвечен результат сборки – бинарник с юнит-тестом._

-----

### Шаг 4. Запуск юнит-теста

Чтобы запустить юнит-тест, воспользуйтесь одним из 2 способов:
1. запустить юнит-тест из системы по пути `C:\projects\test_factorial\out\build\x64-Debug\demoVendorCatch2`,
2. выбрать юнит-тест для запуска непосредственно из Visual Studio. Для этого на верхней панели Студии нажмите на «Выбрать элемент запуска» и выберите `demoVendorCatch2.exe`:

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122171759.png)

Если все юнит-тесты будут пройдены, у вас отобразится соответствующая информация:

![](https://github.com/netology-code/cppl-homeworks/blob/main/common/catch2/Pasted%20image%2020231122171933.png)

_Примечание: `Randomness` у вас может быть другим._

Попробуйте теперь изменить в исходном коде `REQUIRE( factorial( 1) == 2 );` После запуска вы увидите, что возникла ошибка, а также место возникновения.

Поздравляем! Тестирование завершено.

-----

### Часто встречаемые проблемы

* Не конфигурируется проект, ошибка CMake.
> Проверьте наличие Cmake в системном пути.

* Проект конфигурируется, но не компилируется.
> Скачайте демонстрационный проект [DemoCatch2Vendoring](https://github.com/netology-code/cppl-homeworks/tree/main/common/catch2/DemoCatch2Vendoring) и попробуйте его собрать. Если не работает, значит проблема в настройках компилятора. Если работает, найдите отличия между вашим решением и эталонным. Если всё равно не получается, воспользуйтесь версией `catch_amalgamated`.

* При запуске пишет «Файлы не найдены».
> Выберите активным проектом `demoCatch2Vendoring`. Иначе, активным проектом может быть сама библиотека.

-----

### Полезные ссылки

[Официальная документация по проекту. Интеграция с Cmake](https://github.com/catchorg/Catch2/blob/devel/docs/cmake-integration.md).
