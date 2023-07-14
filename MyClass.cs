using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassConsoleFacktorial
{
    public class MyClass
    {
        public int ID { get; set; } = -1;
        protected string Name { get; set; } = "Unknown";

        public virtual string GetText()
        {
            return (ID + " " + Name);
        }
    }
}
