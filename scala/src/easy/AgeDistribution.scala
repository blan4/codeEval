package easy

object AgeDistribution extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines().filter(_.length > 0)

  run(lines).foreach(println(_))

  def run(lines: Iterator[String]): Iterator[String] = {
    lines.map(line => {
      line.toInt match {
        case i if 0 to 2 contains i => "Still in Mama's arms"
        case i if 3 to 4 contains i => "Preschool Maniac"
        case i if 5 to 11 contains i => "Elementary school"
        case i if 12 to 14 contains i => "Middle school"
        case i if 15 to 18 contains i => "High school"
        case i if 19 to 22 contains i => "College"
        case i if 23 to 65 contains i => "Working for the man"
        case i if 66 to 100 contains i => "The Golden Years"
        case _ => "This program is for humans"
      }
    })
  }
}
