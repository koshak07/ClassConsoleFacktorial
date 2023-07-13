using static System.Net.WebRequestMethods;

public class MyClass
{
    public int ID { get; set; } = -1; 
    protected string Name { get; set; } = "Unknown"; 

    public virtual string GetText() 
    {
    return (ID  + " " + Name); 
    }
}