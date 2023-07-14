using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassConsoleFacktorial
{
    internal class MyDisposableClass : IDisposable
    {
      
    public string Name { get; }
        public MyDisposableClass(string name) => Name = name;

        public void Dispose()
        {
            Console.WriteLine($"{Name} has been disposed");
        }
    }

}
