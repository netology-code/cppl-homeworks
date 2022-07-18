# Задача 2. std::variant

### Описание
std::variant бывает удобно применять в разработке парсеров.

Например, есть некоторая универсальная функция, которая может возвращать значения разных типов в зависимости от контекста.
В этом задании вам придется использовать простую функцию, которая может возвращать число, строку или массив чисел.

```C++
std::variant<int, std::string, std::vector<int>> get_variant() {
	std::srand(std::time(nullptr));
	int random_variable = std::rand() % 3;

	std::variant<int, std::string, std::vector<int>> result;
	switch (random_variable)
	{
	case 0:
		result = 5;
		break;
	case 1:
		result = "string";
		break;
	case 2:
		result = std::vector<int>{ 1, 2, 3, 4, 5 };
		break;
	default:
		break;
	}
	return result;
}
```

Вам необходимо написать обработку результата этой функции следующим образом:
* Если в результате функции содержится int, то вывести число, умноженное на 2
* Если в результате функции содержится строка, то просто вывести её в консоль
* Если в результате функции содержится вектор чисел, то вывести все его элементы в консоль


#### Подсказки

Не читайте этот раздел сразу, попытайтесь сначала решить задачу самостоятельно :)

<details>

<summary>Подсказка 1. Какие функции использовать?</summary>

Использовать функции `std::holds_alternative`, `std::get` или `std::get_if`

</details>