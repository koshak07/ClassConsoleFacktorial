using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Enter a number to calculate factorial:");
        string input = Console.ReadLine();

        if (int.TryParse(input, out int n))
        {
            int factorial = CalculateFactorial(n);
            Console.WriteLine($"Factorial number {n} equals: {factorial}");
        }
        else
        {
            Console.WriteLine("Invalid input forma.");
        }
    }

    static int CalculateFactorial(int n)
    {
        if (n == 0)
        {
            return 1;
        }
        else
        {
            return n * CalculateFactorial(n - 1);
        }
    }
}