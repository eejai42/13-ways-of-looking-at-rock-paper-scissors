namespace TestProject
{
    public class W05Tests : SharedTests
    {
        public override void Setup()
        {
            base.Setup();
        }


        [Test]
        public void TestConcreteFish()
        {
            var result = this.Invoke(@"/W05/VisualBasicConsoleApp1\bin\Debug\net7.0\W05-VisualBasic-Concrete-Fish.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestDynamicFish()
        {            
        
            var result = this.Invoke(@"/W05/W05-VisualBasic-Dynamic-Fish\bin\Debug\net7.0\W05-VisualBasic-Dynamic-Fish.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }


        [Test]
        public void TestFishingPole()
        {            
            var result = this.Invoke(@"/W05/VisualBasicConsoleAppWithSSoT\bin\Debug\net7.0\W05-VisualBasic-Fishing-Pole.exe");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }
    }
}
