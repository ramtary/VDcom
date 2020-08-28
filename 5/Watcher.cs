using System;
using System.Collections.Generic;
using System.Text;

namespace _5
{
    /// <summary>
    /// Наблюдатель
    /// </summary>
    class Watcher
    {
        private Train Train;
        private int MinNumOfCars;
        private static Random random = new Random();

        public Watcher(Train train)
        {
            this.Train = train;
        }

        private int GuessNumOfCars()
        {
            return MinNumOfCars + (int)random.Next() * 10000;
        }

        public void CountOfCars()
        {
            int Guess = GuessNumOfCars();

            int N = 0;

            while (true) // идем по вагонам, выключая свет
            {
                N++;

                if (N == Guess)  
                {
                    Train.SetLightInCar(true);  // вкл свет в вагоне
                    break;
                }
                else
                {
                    Train.SetLightInCar(false);
                    Train.GoToNextCar();
                }
            }

            int NumOfCars = 0;  // кол-во вагонов в поезде

            while (true)    // идем обратно
            {
                Train.GoToPrevCar();

                NumOfCars++;

                if (Train.GetLightInCar())
                {
                    break;
                }

                if (NumOfCars == Guess && !Train.GetLightInCar())
                {
                    MinNumOfCars = NumOfCars + 1;
                    CountOfCars();
                }
            }

            Console.WriteLine("Кол-во вагонов в поезде: " + NumOfCars);
        }
    }
}
