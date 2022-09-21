# Задача 1. Клонирование объекта класса

### Описание
Бывает полезно быстро создать копию объекта, которая самостоятельно управляет своей памятью.
Если объект класса тяжёлый и имеет много данных на стеке, то целесообразнее возвращать unique_ptr.

В этом задании нужно написать функцию `clone` для класса трёхдиагональной матрицы, которая возвращает `std::unique_ptr`. Код класса трёхдиагональной матрицы ниже:

``` C++
#include <iostream>
#include <vector>
#include <memory>

class tridiagonal_matrix
{
public:
    std::vector<double> m_down;
    std::vector<double> m_upper;
    std::vector<double> m_middle;
    tridiagonal_matrix(
        const std::vector<double>& down,
        const std::vector<double>& upper,
        const std::vector<double>& middle) :
        m_down{ down }, m_upper{ upper }, m_middle{ middle }
    {};
    ~tridiagonal_matrix() { std::cout << "destructor called\n"; }

    // clone()
};

int main()
{
    auto down = std::vector<double>{ -4.0, 5.0 };
    auto upper = std::vector<double>{ 14.0, 8.0 };
    auto middle = std::vector<double>{ 3.0, 1.0, 7.0 };
    auto matrix = std::make_unique<tridiagonal_matrix>(
        down,
        upper,
        middle
    );

    auto matrix_clone = matrix->clone();

    return 0;
}
```
