function fn() {
  var env = karate.env; // get system property 'karate.env'
  let constantes = Java.type('RestfulBooker.Utils.Constantes');
  if (!env) {
    env = 'uat';
  }

  var config = {
    env: env,
    constantes: constantes

  }
  if (env == 'pro') {
    config.baseUrl = 'https://restful-booker.herokuapp.com';
    config.username = 'admin';
    config.password = 'password123';

  }
  if (env == 'uat') {
    config.baseUrl = 'https://restful-booker.herokuapp.com';
    config.username = 'admin';
    config.password = 'password123';

  }

  karate.configure('connectTimeout', 60000);
  karate.configure('readTimeout', 50000);
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);
  return config;
}