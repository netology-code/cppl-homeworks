# Кортежи

Кортеж - это коллекция фиксированного размера, которая позволяет хранить элементы различных типов.

Если раньше по правилам C++ массив типа `in`t мог содержать только элементы типа `int`, а массив типа `float` - только элементы типа `float` и т.д., то с появлением кортежей в стандарте C++11 появилась возможность хранить элементы различных типов в одной коллекции.

В C++ кортежи реализуются с помощью структуры `std::tuple`. 

## Синтаксис кортежа в C++ следующий:

- Вариант 1: Создание кортежа через конструктор.

`std::tuple<std::string, int, char, double> test(“str”, 4, ‘a’, 3.0)`

- Вариант 2: Создание с помощью функции `make_tuple`. Компилятор автоматически определяет тип элементов.

`auto simple_tuple = std::make_tuple(“str”, 4, ‘a’, 3.0)`

## Для того, чтобы получить элемент, нужно использовать функцию std::get

`std::string str = std::get<0>(simple_tuple);` // “str” 


`int num = std::get<1>(simple_tuple);` // 4


`char symbol = std::get<2>(simple_tuple);` // a


`double num_double = std::get<3>(simple_tuple);` // 3.0

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/9b2b4f0b-c2e6-4ec9-8037-6aa9faeb5d3a)

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/e0043058-1499-4fa1-bcae-bbc55d304433)


## Более простой способ получить элементы - использовать функцию std::tie


`std::tie(str, num, symbol, num_double) = simple_tuple;`

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/cb915e5c-f0bf-4166-b146-71c23e076c70)

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/cae4c4ca-80af-4036-ba6e-734b54eb4591)







