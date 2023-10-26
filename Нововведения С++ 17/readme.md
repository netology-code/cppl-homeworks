# Нововведения C++17

1. [Структурированные привязки](https://github.com/netology-code/cppl-homeworks/tree/main/%D0%9D%D0%BE%D0%B2%D0%BE%D0%B2%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%A1%2B%2B%2017#1-%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B5-%D0%BF%D1%80%D0%B8%D0%B2%D1%8F%D0%B7%D0%BA%D0%B8)
2. [std::variant](https://github.com/netology-code/cppl-homeworks/tree/main/%D0%9D%D0%BE%D0%B2%D0%BE%D0%B2%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%A1%2B%2B%2017#2-stdvariant)
3. [std::optional](https://github.com/netology-code/cppl-homeworks/tree/main/%D0%9D%D0%BE%D0%B2%D0%BE%D0%B2%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%A1%2B%2B%2017#stdoptional)
4. [std::any](https://github.com/netology-code/cppl-homeworks/tree/main/%D0%9D%D0%BE%D0%B2%D0%BE%D0%B2%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%A1%2B%2B%2017#stdany)


## 1. Структурированные привязки

Структурированные привязки в C++17 это возможность декомпозировать объекты, такие как массивы, кортежи и структуры, на отдельные переменные с помощью простого синтаксиса.

Ранее в C++ для доступа к элементам массивов или полей структур приходилось использовать индексацию или доступ по имени. Структурированные привязки вводят удобный способ извлечения значений из структур, массивов или кортежей, что делает код более читабельным и лаконичным.

Однако вложенные структуры так не получится декомпозировать. С классами это также не работает.

Рассмотрим пример:

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/a9254b48-b9d9-435c-ad2a-09f552235876)


У нас есть структура `struct Person {` с тремя полями данных:

`std::string name;`

`unsigned score;`

`std::string birthday;`

Мы инициализируем объект этой структуры:

`Person p1{ "Alex", 70, "03.11.1995" };`

`auto name = p1.name;`

`auto score = p1.score;`

`auto birthday = p1.birthday;`

Чтобы получить эти данные раньше необходимо было последовательно, каждый раз обращаясь к объекту класса `Person`.

В стандарте C++17 появилась возможность использовать структурированные привязки:

`auto [name, score, birthday] = p1;`

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/2b9404ed-0237-470e-ae0d-bf521f3e0fe8)

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/6f1d6fec-f8c4-4154-9697-f23a3f1fed8c)


Значения полей из объекта `p1` будут присвоены соответствующим переменным `name`, `score` и `birthday`. 
В данном примере названия переменных совпали с именами полей данных, но это не обязательно. Переменные могут называться как угодно.

Синтаксис структурированных привязок выглядит следующим образом:

`auto [var1, var2, ...] = объект;`

`var1`, `var2`, ... - это имена переменных, которым будут присвоены значения из объекта, а `объект` - это структура или кортеж, из которых будут извлекаться значения.

Во-первых, мы не думаем про типы. Во-вторых, вместо того, чтобы указывать название каждого из полей данных, мы прописываем переменные, которым будут присвоены значения полей. 

## 2. std::variant


Это такой класс, экземпляр которого в данный момент времени содержит одно значение из альтернативных типов.

Рассмотрим пример:

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/1fc832bc-77fc-4a06-a030-c6883cbdcc04)


`std::variant<unsigned, std::string> age;` // Позволяет хранить в объекте этого класса одно из двух значений. Переменная age может хранить как число (unsigned) или как строку с датой рождения (std::string). Два типа, которые может в себе совмещать переменная, нужно передать в скобках <>

`age = 51u;`// Инициализируем, работаем как с числом

`auto age_int = std::get<unsigned>(age);` // Но, чтобы получить эти данные, нужно использовать функцию std::get, явно прописать тип данных - unsigned, передать название переменной, которая является объектом класса std::variant - age

`age = "03.05.2014";` // После этого мы меняем значение, работаем как со строкой.

`auto age_string = std::get<std::string>(age);` // Также использует функцию std::get и указываем тип данных. 

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/487efa6e-2306-4a5c-989c-ad3dee9b8655)

Если мы попытаемся получить значение типа `unsigned` из объекта `age`, хотя объект `age` был присвоен значению типа `std::string`. Это вызывает исключение std::bad_variant_access, поскольку типы не соответствуют:

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/100b8d33-e336-4eb9-aa24-fca114709f93)


Дополнительные функции `std::holds_alternative` и `std::get_if`.

1. `std::holds_alternative` помогает проверить тип данных, который в данный момент используется.

Рассмотрим пример:

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/e803b5e3-5a42-4f13-8dd1-6bfa5e392b55)

Мы создали переменную `std::variant`, в треугольных скобках указали, что здесь может лежать либо `unsigned`, либо `string`. 

Решили работать с этим как с числом, присвоили `age = 51u`. 

Дальше мы хотим узнать, что именно лежит в объекте класса `age`. 

Вызываем функцию `std::holds_alternative`, в треугольных скобках передаём тип проверку которого мы хотим произвести. Дальше прописываем название самой переменной.

Если функция в данный момент содержит тот тип данных, который мы пытаемся получить, то результат будет `true`.
Если она содержит другой тип данных, то результат будет `false`.

В нашем примере мы проверяем тип данных `string`. И результатом будет `false`: 

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/fda0f0ee-f749-48a9-84ff-21491451d571)

Если мы проверим `unsigned`, получим `true`:

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/95c026bc-3080-44fe-933d-1b56638a705a)

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/594f12df-5da4-42d0-918a-a18ebd3cba20)


2. Функция `get_if` позволяет вернуть данные, если их тип соответствует типу, укзанному в треугольных скобках.

`auto try_string = std::get_if<std::string>(&age)` // nullptr, не получается, так как там лежит 51u. 

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/28b03fb4-fb49-47c2-be52-79ed6792f07e)


![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/d096fd53-9ad3-4942-be84-3a658f75f03a)


`auto try_unsigned = std::get_if<unsigned>(&age);` // unsigned int *, возвращает значение.

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/fadc01e8-1fb0-4a9e-a927-5a3689f26f34)


![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/c7ad4483-a69e-4a7a-b39d-75d31e2649b0)


## std::optional

Это класс, который может содержать значение, а может не содержать ничего. С помощью него удобно показать, что функция может не возвращать значение.

Рассмотрим пример:

Функция `my_sqrt` возвращает квадратный корень из переданного значения.

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/0af49382-0cad-4476-adff-ef2a1d3b8c2d)


Метод value_or - вызов из этой функции:

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/3ead84c4-e38a-4e31-8c74-bbb470d5cd51)


Мы попытались вычислить квадратный корень из -5. Получили 0:

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/9bddfdd4-998a-4d08-ad12-0e00f35d4860)


Если мы попытаемся вычислить квадратный корень из 4, то получим значение 2:

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/f66fb223-d5c5-4156-aba2-4524303fd34d)

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/32d28d1a-6ccc-4020-b297-f760b5fa4e5b)


Метод has_value - проверка, содержится значение или нет

`bool has_value = my_sqrt(-5).has_value();` // false

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/179f7da4-22fb-4a58-881f-f8c3c949e1ab)

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/243c95ac-1ec7-4349-89e4-8e4455810a1f)


`bool has_value1 = my_sqrt(4).has_value();` // true

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/925615e9-7cf6-4aeb-851f-bf415d43614b)


![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/4eda57e4-7fd4-4480-a599-3d2035b16e4b)


## std::any

Это класс, который может хранить значения разных копируемых типов (не путать с auto).
Если `auto` определяется на этапе компиляции, то `std::any` - это динамический тип, который может работать с разными типами данных.

Рассмотрим первый пример:

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/93465960-72ea-4b30-aa24-a853b469e9a4)


Функция `std::any_cast` используется для извлечения значения из объекта `std::any`. В данном случае, тип, переданный в `std::any_cast<int>`, указывает, что значение должно быть приведено к типу `int`.

В результате выполнения программы будет выведено сообщение int: 5, что указывает на тип переменной a (int) и ее значение (5).

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/712b9ec3-ec1e-4fb1-83df-0d58d22c70a2)


Рассмотрим второй пример:

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/be13e0e5-74b5-4994-89ce-e3b8c7fdc2d2)

В данном случае, тип, переданный в `std::any_cast<double>`, указывает, что значение должно быть приведено к типу `double`.

В результате выполнения программы будет выведено сообщение double: 3.14, что указывает на тип переменной a (double) и ее значение (3.14).

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/5ee57a45-6374-490e-a065-c8f3370c6074)


Итак, можно воспользоваться функцией `type`, которая вернёт объект `typeinfo`, у которого можем узнать тип.

Получить значение можно с помощью `any_cast`. 

Если значение преобразовываем не к тому типу, который находится, то получим исключение `bad_cast`.

Также можно проверить содержит ли значение с помощью `int has_value = a.has_value()`

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/31e69804-46e7-4adb-ad32-62ec15135cf8)

![image](https://github.com/netology-code/cppl-homeworks/assets/147130852/56162f3e-af8c-4892-82af-de81882034fe)

Можно хранить значения любых типов в одном контейнере:

`std::vector<any> v { "test_string", 4.12, 5, false};`

Используется, когда требуется создать контейнер, в котором можно хранить элементы разных типов.












