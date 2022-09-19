# Задача 1. Программа с ошибками

### Описание
Найдите ошибки в программе. Добейтесь, чтобы программа компилировалась и выдавала корректный результат.

### Код программы 
``` C++
#include <iostream>
using namespace std; 

struct point {
	double m_x;
	double m_y;
	point(double x, double y) {
		m_x = x;
		y = y;
	}
}

void print_point(const point& point_object) {
	std::cout << "x:" << point_object.m_x << ", y: "
		<< point_object.m_y << std::endl;
}

int Main()
{
	int i;
	for (i = 0; i < 5; i++); {
		point my_point(i, 2 * i);
		print_point(my_point);
	}
	return 0;
}

void print_point(const point& point_object) {
	std::cout << "x:" << point_object.m_x << ", y: "
		<< point_object.m_y << std::endl;
}
```

### Пример правильной работы программы
```
x:0, y: 0
x:1, y: 2
x:2, y: 4
x:3, y: 6
x:4, y: 8
```

