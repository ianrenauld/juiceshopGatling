package api;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class TestParallel {
  @Test
  void testParallel() {
    Results results = Runner.path("classpath:*")
        .outputJunitXml(true)
        .parallel(5);
    assertEquals(0, results.getFailCount(), results.getErrorMessages());
  }
}
