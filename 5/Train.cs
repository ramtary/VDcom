using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace _5
{
    /// <summary>
    /// Поезд
    /// </summary>
    public class Train
    {
        private bool[] LightInCar;
        private int Size;
        private int CurrentCarIndex;
        private static Random random = new Random();

        public Train(int MinSize, int MaxSize)  // создаем поезд
        {
            Size = random.Next(MinSize, MaxSize);

            LightInCar = new bool[Size];

            for (int i = 0; i < Size; i++)
            {
                LightInCar[i] = random.Next(1, 10) < 5;
            }

            CurrentCarIndex = 0;
        }

        public void GoToNextCar()   // к след. вагону
        {
            CurrentCarIndex = (CurrentCarIndex + 1) % Size;
        }

        public void GoToPrevCar()   // к пред. вагону
        {
            CurrentCarIndex = (CurrentCarIndex + Size - 1) % Size;
        } 

        public bool GetLightInCar() // свет в вагоне вкл?
        {
            return LightInCar[CurrentCarIndex];
        }

        public void SetLightInCar(bool Light)   // вкл/выкл свет вагоне
        {
            LightInCar[CurrentCarIndex] = Light;
        }
    }
}
