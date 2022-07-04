# Задача 2*. Копирование умных массивов

### Описание
В этом задании вам необходимо будет поработать с классом умных массивов, который вы реализовали в предыдущем задании.
Для начала, попробуйте создать два экземпляра вашего класса с различными элементами и присвоить один другому.
``` C++
smart_array arr(5);
arr.add_element(1);
arr.add_element(4);
arr.add_element(155);

smart_array new_array(2);
new_array.add_element(44);
new_array.add_element(34);

arr = new_array
```
Что произошло? Попытайтесь самостоятельно разобраться и исправить эту ситуацию.
Вам необходимо правильно реализовать копирование умных массивов.

### Пример правильной работы программы
Работа с вашим классом должна происходить примерно так
``` C++
try {
	smart_array arr(5);
	arr.add_element(1);
	arr.add_element(4);
	arr.add_element(155);
	arr.add_element(14);
	arr.add_element(15);
	std::cout << arr.get_element(1) << std::endl;
}
catch (const std::exception& ex) {
	std::cout << ex.what() << std::endl;
}
```
