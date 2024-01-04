# Juice Shop Gatling

Example of performance/load testing with [Karate](https://github.com/intuit/karate) "Web-Services Testing Made Simple" framework integrated with [Gatling](https://gatling.io). Since performing load testing against open APIs on the Internet is generally frowned upon (or might even get you banned), this example uses a locally installed version of [OWASP Juice Shop](https://owasp.org/www-project-juice-shop/) to run against, either on the same machine or a different local networked machine.

This repo is meant as a supporting resource from my Karate-Gatling presentation (slides are included in the root directory in file Karate-Gatling 2023.pptx). [A recording of the 2021 version of my talk is available on Youtube](https://www.youtube.com/watch?v=8xbk5LguMVs). Read the slides or listen to the talk before trying to use this framework.

## Getting started

### Installing Juice Shop

1. Install [Node.js](https://nodejs.org/), either version 18 or 20.
1. Install [the right version of Juice Shop](https://github.com/juice-shop/juice-shop/releases/) depending on which Node.js version you installed in previous step
1. Go to the Juice Shop directory and type `npm install`
1. When you are ready to run it type `npm start`

**NOTE: Juice Shop is by design insecure - do not run it continually on an Internet exposed computers as this introduces security issue. Run it only as long as needed to run the Karate-Gatling examples**

### Installing the Karate-Gatling examples framework

Clone this repo on your local machine.

This framework runs through Maven. You'll need to have Java 8+ (version 1.8.0_112 is the minimum) and Maven installed. There seems to be compatibility issues with the Scala plugins and recent versions of Java. I do not recommend installing the latest and greatest. Version 8 to 11 have been proven to work, possibly more.

## Running Karate tests

The Karate tests are run against Juice Shop. The actual location (URL) of Juice Shop has to be provided. This is configured as the `baseUrl` in the `src/test/java/api/karate-config.js` file. By default it is assumed that Juice Shop is run on the same machine as Karate tests. Please adjust the URL if that is not the case.

Karate tests are located in the `src/test/java/api/juiceshop` directory. To run the tests:

```bash
mvn test -Dtest=TestParallel
```

### Simpler Approach
While Karate code can be developed in any IDE or text editor, there is a [Karate Runner](https://marketplace.visualstudio.com/items?itemName=kirkslota.karate-runner) Extension available for [Visual Studio Code](https://code.visualstudio.com) that greatly simplifies running specific tests, while also providing syntax highlight and advanced debugging functionality.  As such, if you favor simplicity in your work, we highly suggest using Visual Studio Code.

You only need to load the feature file and click on the "Run Karate test" link above the Scenario or Feature (see image below). You'll have to provide the Test Runner name (`TestParallel`) but you can set it once and forget it in the VS Code options!

## Running performance/load test
Running the Karate tests on their own is fun, but to run the performance/load test you must use Gatling. There is an example performance test in `src/test/scala` directory. To run it:

```bash
mvn test-compile gatling:test -D"gatling.simulationClass"=JuiceShop.HammerGetReview
```

Once the simulation is complete, the results (Gatling Test Report) will be available in the `target/gatling` directory (each simulation has it's own directory).
