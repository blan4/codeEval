package easy

/**
 * @see https://www.codeeval.com/open_challenges/214/
 */
object TimeToEat extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines().filter(_.length > 0)
  
  run(lines).foreach(println(_))
  
  def run(lines: Iterator[String]): Iterator[String] = {
    lines.map(line => {
      line
        .split(" ")
        .map(new MyTimestamp(_))
        .sorted
        .map(_.toString)
        .mkString(" ")
    })
  }

  class MyTimestamp(raw: String) extends Ordered[MyTimestamp] {
    //there is could be validation
    val data = raw.split(":")
    val (hours, minutes, seconds) = (data(0), data(1), data(2))

    override def compare(that: MyTimestamp): Int = {
      if (hours > that.hours) return -1
      if (hours < that.hours) return 1
      if (minutes > that.minutes) return -1
      if (minutes < that.minutes) return 1
      if (seconds > that.seconds) return -1
      if (seconds < that.seconds) return 1
      0
    }
    
    override def toString = s"$hours:$minutes:$seconds"
  }
}