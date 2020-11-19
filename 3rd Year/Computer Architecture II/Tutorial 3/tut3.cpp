#include <iostream>
#include <time.h>
using namespace std;

int procedureCalls, depth, tempDepth, underflows, overflows, windowSize, currentWindows, minWindows, windowSizeReduction;

int compute_pascal(int row, int position)
{
    procedureCalls++;
    tempDepth++;
    if (tempDepth > depth)
    {
        depth = tempDepth;
    }

    currentWindows++;
    if (currentWindows >= (windowSize - windowSizeReduction))
    {
        overflows++;
        currentWindows--;
    }

    if (position == 1)
    {
        tempDepth--;
        currentWindows--;
        if (currentWindows < minWindows)
        {
            underflows++;
            currentWindows++;
        }
        return 1;
    }
    else if (position == row)
    {
        tempDepth--;
        currentWindows--;
        if (currentWindows < minWindows)
        {
            underflows++;
            currentWindows++;
        }
        return 1;
    }
    else
    {
        int ans = compute_pascal(row - 1, position) + compute_pascal(row - 1, position - 1);
        tempDepth--;
        currentWindows--;
        if (currentWindows < minWindows)
        {
            underflows++;
            currentWindows++;
        }
        return ans;
    }
}

int main()
{
    procedureCalls = 0;
    depth = 0;
    tempDepth = 0;
    windowSize = 16;
    windowSizeReduction = 1;
    currentWindows = 0;
    minWindows = 2;
    overflows = 0;
    underflows = 0;
    clock_t start = clock();
    compute_pascal(30, 20);
    clock_t timeTaken = clock() - start;
    cout << "\nWindow size of " << windowSize;
    cout << "\nOverflow occurs on " << windowSizeReduction << " free registers";
    cout << "\n     time taken: " << (float)timeTaken / CLOCKS_PER_SEC << " seconds";
    cout << "\n     calls: " << procedureCalls;
    cout << "\n     window size: " << windowSize;
    cout << "\n     window size reduction: " << windowSizeReduction;
    cout << "\n     depth: " << depth;
    cout << "\n     overflows: " << overflows;
    cout << "\n     underflows: " << underflows;
    return 0;
}