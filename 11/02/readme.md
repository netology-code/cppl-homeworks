# Задача 2. Большие числа

### Описание
Вам необходимо реализовать класс для работы с большими числами, которые не помещаются в стандартные типы данных.
Для этого класса необходимо определить следующие методы:
- Конструктор перемещения
- Перемещающий оператор присваивания
- Оператор сложения двух больших чисел
- Оператор умножения на число

Для реализации данного класса можно воспользоваться `std::string` или `std::vector`.

### Пример правильной работы программы
```C++
auto number1 = big_integer("114575");
auto number2 = big_integer("78524");
auto result = number1 + number2;
std::cout << result; // 193099
```