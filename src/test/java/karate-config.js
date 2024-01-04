function fn() {
  const { env } = karate; // get java system property 'karate.env'

  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);
  karate.configure('report', { showLog: true, showAllSteps: true });
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 60000);

  const config = {
    baseUrl: 'http://localhost:3000',
  };

  return config;
}
