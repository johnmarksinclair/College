#include <iostream>
#include <time.h>
using namespace std;

int compute_pascal(int row, int position)
{
    if (position == 1)
    {
        return 1;
    }
    else if (position == row)
    {
        return 1;
    }
    else
    {
        return compute_pascal(row - 1, position) + compute_pascal(row - 1, position - 1);
    }
}

int main()
{
    clock_t start, end;
    start = clock();
    compute_pascal(30, 20);
    end = clock();
    double time = double(end - start);
    cout << "time taken: " << fixed << time;
    return 0;
}