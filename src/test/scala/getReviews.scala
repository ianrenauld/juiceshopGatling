package JuiceShop

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

/* Example Gatling performance tests which reuse Karate scenarios.
 *
 * Run with
 *  mvn clean test-compile gatling:test -D"gatling.simulationClass"=JuiceShop.HammerGetReview
 *
 * And see the target directory for the Gatling reports folder.
 */
class HammerGetReview extends Simulation {

  val feeder = csv("products.csv").circular

  // This section is only important to fill out properly if you have endpoints with a parameter in it:
  // Something like /rest/products/{id}/reviews would be considered a different endpoint
  // for each {id} - which it is not. Normal URLs can be skipped with no worries
  val protocol = karateProtocol(
    "/rest/products/register" -> Nil,
  )

  val test = scenario("getReviews")
    .feed(feeder)
    .exec(karateFeature("classpath:api/juiceshop/getReview.feature"))

  setUp(
    test.inject(
      constantUsersPerSec(5) during (20 seconds)
      ).protocols(protocol)
  )
}
