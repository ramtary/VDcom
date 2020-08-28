using System;
using System.Collections;
using System.Collections.Generic;

namespace _5
{
    class Program
    {   
        static void Main(string[] args)
        {
            Train train = new Train(1000, 5000);

            Watcher watcher = new Watcher(train);
            watcher.CountOfCars();
            Console.ReadKey();
        }
    }
}
