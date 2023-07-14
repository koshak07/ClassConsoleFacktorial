using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassConsoleFacktorial
{
    internal class MyExternalClass : MyClass
    {
        MyExternalClass() : base()
        {

        }
        public int Age { get; set; } = -1;
        public override string GetText()
        {
            return (Id + " " + Name + " " + Age);
        }
    }
}
